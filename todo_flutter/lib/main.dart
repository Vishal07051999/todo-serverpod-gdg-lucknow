import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:serverpod_auth_firebase_flutter/serverpod_auth_firebase_flutter.dart';
import 'package:todo_flutter/todo_app.dart';

import 'config.dart';
import 'firebase_options.dart';

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
      home: const MyHomePage(title: 'TODO with Firebase Auth'),
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
