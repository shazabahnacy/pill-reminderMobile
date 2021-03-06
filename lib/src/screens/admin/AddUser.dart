import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/screens/homepage/adminHomepage.dart';
import 'package:medicine_reminder/src/screens/homepage/homepage.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.purple,
          ),
          centerTitle: true,
          title: Text(
            "Add a New User",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          elevation: 0.0,
        ),
        body: ListView(children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter User Name rate here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'FullName',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple))),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter User Email here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email ',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple))),
                              obscureText: true,
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter User Password here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Password ',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple))),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter User Age here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Age ',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple))),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter User Phone number here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Phone Number ',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.purple))),
                            ),
                            SizedBox(height: 50.0),
                            Container(
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.purpleAccent,
                                  color: Colors.purple,
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState.validate()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SO()));
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'ADD new User',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(height: 20.0),
                            Container(
                              height: 40.0,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1.0),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Center(
                                    child: Text('Cancel',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))),
              ])
        ]));
  }
}
