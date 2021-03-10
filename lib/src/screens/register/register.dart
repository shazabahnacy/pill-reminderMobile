import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/screens/homepage/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicine_reminder/src/models/database.dart';
import 'package:medicine_reminder/src/models/currentUser.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _numbercontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context,
      String fullName) async {
    try {
      String _returnString =
          await CurrentUser().signUpUser(email, password, fullName);
      if (_returnString == "success") {
        Navigator.pop(context);
      } else {
        // Scaffold.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(_returnString),
        //     duration: Duration(seconds: 2),
        //   ),
        // );
        print("errorrrr");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // resizeToAvoidBottomPadding: false,
        body: ListView(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child: Text(
                  'Signup',
                  style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
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
                      controller: _emailcontroller,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter email here";
                        }
                        const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                        final regExp = RegExp(pattern);

                        if (!regExp.hasMatch(value)) {
                          return "email not valid";
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
                      controller: _passwordcontroller,
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
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _namecontroller,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your fullname here";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Full Name ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _agecontroller,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your age here";
                        }
                        int age = int.tryParse(value);
                        if (age == null || age <= 0) {
                          return 'Age must be greater then 0';
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
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your number here";
                        }
                        int number = int.tryParse(value);
                        if (number.bitLength < 12) {
                          return "phone number must be 11 numbers";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Phone number ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
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
                            onTap: () async {
                              print('hamda');
                              if (_formKey.currentState.validate()) {
                                _signUpUser(
                                    _emailcontroller.text,
                                    _passwordcontroller.text,
                                    context,
                                    _namecontroller.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              } else {
                                print("error in signup");
                                // AuthResult result = await FirebaseAuth.instance
                                //     .createUserWithEmailAndPassword(
                                //     email: _emailcontroller.text,
                                //     password: _passwordcontroller.text);
                                // print("esraa"+result.toString());
                                // if (result != null) {
                                //   Firestore.instance
                                //       .collection('users')
                                //       .document(result.uid)
                                //       .setData({
                                //     'name': _namecontroller.text,
                                //     'age': _agecontroller.text,
                                //     'number': _numbercontroller.text
                                //   });
                                // }

                              }
                            },
                            child: Center(
                              child: Text(
                                'SIGNUP',
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
