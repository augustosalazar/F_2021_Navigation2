import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXMyApp extends StatelessWidget {
  const GetXMyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          GetMaterialApp(debugShowCheckedModeBanner: false, home: UserView()),
    );
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
              title: Text('UserView with GetX'),
            ),
            body: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return Card(
                  child: ListTile(
                    title: Text(user),
                    onTap: () {
                      Get.to(() => UserDetailView(), arguments: user);
                    },
                  ),
                );
              },
            )));
  }
}

class UserDetailView extends StatelessWidget {
  final String user = Get.arguments;
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
