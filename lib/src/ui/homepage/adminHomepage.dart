import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/register/adminlogin.dart';
import 'package:medicine_reminder/src/ui/admin/AddMedSuggest.dart';
import 'package:medicine_reminder/src/ui/admin/AddUser.dart';
import 'package:medicine_reminder/src/ui/user/userprofile.dart';

class SO extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Admin Homepage!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(' admin Menu Bar '),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              title: Text('Add medicine suggestion'),
              leading: Icon(Icons.medical_services_outlined),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddMedSuggest(),
                    ));
              },
            ),
            ListTile(
              title: Text('view medicine suggestion list'),
              leading: Icon(Icons.list_alt_outlined),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Add user'),
              leading: Icon(Icons.supervised_user_circle_rounded),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddUser(),
                    ));
              },
            ),
            ListTile(
              title: Text('LogOut'),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Adminlogin(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
