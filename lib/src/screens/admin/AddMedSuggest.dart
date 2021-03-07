import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/screens/homepage/adminHomepage.dart';
import 'package:medicine_reminder/src/screens/homepage/homepage.dart';

class AddMedSuggest extends StatefulWidget {
  @override
  _AddMedSuggestState createState() => _AddMedSuggestState();
}

class _AddMedSuggestState extends State<AddMedSuggest> {
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
            "Add Medicine Suggestion",
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
                                  return "Please enter medicine name here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Medicine Name',
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
                                  return "Please enter Medicine Description here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Medicine Description ',
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
                                  return "Please enter Medicine Dose here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Medicine Dose ',
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
                                  return "Please enter Medicine Restrictions here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Medicine Restrictions ',
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
                                  return "Please enter Medicine Side effects here";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Medicine Side effects ',
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
                                        'ADD new Medicine Suggestion',
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
