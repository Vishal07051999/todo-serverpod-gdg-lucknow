import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/todo_form.dart';
import 'package:todo_flutter/todo_widget.dart';

import 'config.dart';

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
                                  return CreateToDoForm(
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
                      Text("User :- ${sessionManager.signedInUser?.userName}")
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ToDoWidget(toDo: todo, refreshToDos: refresh),
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
