import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/screens/homepage/homepage.dart';
import 'package:medicine_reminder/src/screens/homepage/adminHomepage.dart';
//import 'package:medicine_reminder/services/auth.dart';
import 'package:medicine_reminder/src/models/currentUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Adminlogin extends StatefulWidget {
  @override
  _AdminloginState createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  //final _auth = Auth();
  // final Function onClick;
  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  // void _loginUserWithEmail(String email,String password,BuildContext context)async{
  //   try {
  //     String _returnString = await CurrentUser().loginUserWithEmail(email, password);
  //     if (_returnString == "success") {
  //       Navigator.pop(context);
  //     } else {
  //       // Scaffold.of(context).showSnackBar(
  //       //   SnackBar(
  //       //     content: Text(_returnString),
  //       //     duration: Duration(seconds: 2),
  //       //   ),
  //       // );
  //       print("errorrrr");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  Future<bool> checkIsAdmin(email) {}

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
                      controller: _emailcontroller,
                      // onClick: (value) {
                      //   _email = value;
                      // },
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
                      controller: _passwordcontroller,
                      // onClick: (value) {
                      //   _passsword = value;
                      // },
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
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                var _auth = FirebaseAuth.instance;
                                //CurrentUser current=new CurrentUser();
                                final authResult =
                                    await _auth.signInWithEmailAndPassword(
                                        email: _emailcontroller.text,
                                        password: _passwordcontroller.text);
                                // CurrentUser current=new CurrentUser();
                                //
                                // current.loginUserWithEmail(_emailcontroller.text,
                                //     _passwordcontroller.text);
                                bool test;
                                Firestore.instance
                                    .collection('users')
                                    .where('email',
                                        isEqualTo: _emailcontroller.text)
                                    .getDocuments()
                                    .then((doc) {
                                  // print(doc.documents[0]["is_Admin"]);
                                  if (doc.documents[0]["is_Admin"] == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SO()));
                                  } else {
                                    print("you are not admin :(");
                                    // Scaffold.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: Text('Invalid Email or Password'),
                                    //   ),
                                    // );
                                  }
                                });

                                //final result =
                                // await _auth.signIn(_email, _password);
                                // print(result.user.uid);

                                // }else{
                                // print("error log as admin");
                                //}
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
