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
  String _selectedUser;

  void _userSelection(user) {
    setState(() {
      _selectedUser = user;
    });
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Navigator(
      pages: [
        MaterialPage(child: UserView(didSelectUser: _userSelection)),
        if (_selectedUser != null)
          MaterialPage(
              child: UserDetailView(user: _selectedUser),
              key: UserDetailView.valueKey)
      ],
      onPopPage: (route, result) {
        final page = route.settings as MaterialPage;
        if (page.key == UserDetailView.valueKey) {
          _selectedUser = null;
        }

        return route.didPop(result);
      },
    ));
  }
}

class UserView extends StatelessWidget {
  UserView({Key key, this.didSelectUser}) : super(key: key);
  final _users = ['Moises', 'Brayan', 'Luis Eduardo', 'Jonathan'];
  final ValueChanged didSelectUser;
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
                  child: ListTile(
                    title: Text(user),
                    onTap: () => didSelectUser(user),
                  ),
                );
              },
            )));
  }
}

class UserDetailView extends StatelessWidget {
  const UserDetailView({Key key, this.user}) : super(key: key);
  static const valueKey = ValueKey('UserDetailView');
  final String user;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('UserDetailView'),
          ),
          body: Center(child: Text('Hola $user'))),
    );
  }
}
