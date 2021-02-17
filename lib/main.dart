import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UserView());
  }
}

class UserView extends StatelessWidget {
  UserView({Key key}) : super(key: key);
  final _users = ['Moises', 'Brayan', 'Luis Eduardo', 'Jonathan'];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text('UserView'),
            ),
            body: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return Card(
                  child: Text(user),
                );
              },
            )));
  }
}
