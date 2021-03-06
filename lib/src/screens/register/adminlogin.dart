import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/screens/homepage/homepage.dart';
import 'package:medicine_reminder/src/screens/homepage/adminHomepage.dart';

class Adminlogin extends StatefulWidget {
  @override
  _AdminloginState createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //resizeToAvoidBottomPadding: false,
        body: ListView(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child: Text(
                  'Admin Login',
                  style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(210.0, 200.0, 0.0, 0.0),
                child: Text(
                  '.',
                  style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter email here";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,

                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter password here";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                      obscureText: true,
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
                                'LOGIN',
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
                            child: Text('Go Back',
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
