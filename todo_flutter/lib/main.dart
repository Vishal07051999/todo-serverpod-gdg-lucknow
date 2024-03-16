import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:serverpod_auth_firebase_flutter/serverpod_auth_firebase_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todo_client/todo_client.dart';

import 'firebase_options.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager())
  ..connectivityMonitor = FlutterConnectivityMonitor();

var sessionManager = SessionManager(caller: client.modules.auth);

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  firebase.FirebaseUIAuth.configureProviders([
    firebase.EmailAuthProvider(),
  ]);

  await sessionManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void updateState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    sessionManager.addListener(updateState);
  }

  @override
  void dispose() {
    sessionManager.removeListener(updateState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!sessionManager.isSignedIn) {
      return const AnonymousApp();
    } else {
      return const ToDoApp();
    }
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  late Observable<ObservableFuture<List<ToDo>>> _todos;

  @override
  void initState() {
    _todos = Observable(ObservableFuture(client.toDo.getAll()));
    super.initState();
  }

  void refresh() {
    runInAction(() {
      _todos.value = ObservableFuture(client.toDo.getAll());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Todos'),
          ),
          body: Observer(builder: (BuildContext context) {
            final todosFuture = _todos.value;
            if (todosFuture.status == FutureStatus.fulfilled) {
              final todos = todosFuture.value!;
              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return _CreateToDoForm(
                                      create: client.toDo.create);
                                }).then((value) {
                              if (value == true) {
                                refresh();
                              }
                            });
                          },
                          child: const Text('Create ToDo'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            sessionManager.signOut().then((_) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(milliseconds: 500),
                                content: Text("LogOut done"),
                                backgroundColor: Colors.green,
                              ));
                            });
                          },
                          child: const Text('LogOut'),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _ToDoWidget(toDo: todo, refreshToDos: refresh),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          })),
    );
  }
}

class _ToDoWidget extends StatelessWidget {
  final ToDo toDo;
  final VoidCallback refreshToDos;

  const _ToDoWidget({required this.toDo, required this.refreshToDos});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue, // Set border color
          width: 2.0, // Set border width
        ),
        borderRadius: BorderRadius.circular(10.0), // Set corner radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    toDo.title,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  Text(toDo.description),
                ],
              ),
            ),
            Column(
              children: [
                Checkbox(
                    value: toDo.completed,
                    onChanged: toDo.completed
                        ? null
                        : (final _) {
                            client.toDo.markCompleted(toDo.id!).then((_) {
                              refreshToDos();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: Duration(milliseconds: 500),
                                content:
                                    Text("ToDo completed :- ${toDo.title}"),
                                backgroundColor: Colors.green,
                              ));
                            }).catchError((_) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(milliseconds: 500),
                                content: Text("Unable to complete ToDo."),
                                backgroundColor: Colors.red,
                              ));
                            });
                          }),
                IconButton(
                  icon: const Icon(Icons.delete), // Set the icon to delete
                  onPressed: () {
                    client.toDo.delete(toDo.id!).then((_) {
                      refreshToDos();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(milliseconds: 500),
                        content: Text("ToDo deleted :- ${toDo.title}"),
                        backgroundColor: Colors.green,
                      ));
                    }).catchError((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(milliseconds: 500),
                        content: Text("Unable to delete ToDo."),
                        backgroundColor: Colors.red,
                      ));
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AnonymousApp extends StatelessWidget {
  const AnonymousApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
          title: 'Serverpod TODO Application with Firebase Auth'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SignInWithFirebaseButton(
              caller: client.modules.auth,
              authProviders: [
                firebase.EmailAuthProvider(),
              ],
              onFailure: () {},
              onSignedIn: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text("Log In Success"),
                  backgroundColor: Colors.green,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateToDoForm extends StatefulWidget {
  final Future<void> Function(String, String) create;

  const _CreateToDoForm({required this.create});

  @override
  _CreateToDoFormState createState() => _CreateToDoFormState();
}

class _CreateToDoFormState extends State<_CreateToDoForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _title = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  maxLines: null,
                  onSaved: (newValue) {
                    setState(() {
                      _description = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.create(_title, _description).then((_) {
                        Navigator.pop(context, true);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Todo created :- $_title"),
                          backgroundColor: Colors.green,
                        ));
                      }).catchError((_) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Unable to create ToDo."),
                          backgroundColor: Colors.red,
                        ));
                      });
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ]))
      ],
    );
  }
}
