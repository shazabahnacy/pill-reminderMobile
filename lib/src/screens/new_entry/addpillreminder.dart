import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/models/medicine_type.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/screens/homepage/homepage.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:medicine_reminder/src/services/store.dart';

class Addpillrem extends StatefulWidget {
  @override
  _AddpillremState createState() => _AddpillremState();
}

class _AddpillremState extends State<Addpillrem> {
  final _store = Store();
  final _formKey = GlobalKey<FormState>();
  List<String> _intervalss = ['4', '8', '12', '24'];
  String _selectedinterval;
  String _typeSelected;
  String dropdownValue = '4';
  String error = '';
  String medname = '';
  String dose = '';
  String medtype = '';
  String intervals = '';
  String time = '';
  String id = '';
  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 85,
        decoration: BoxDecoration(
          color: _typeSelected == title
              ? Colors.purpleAccent
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
          medtype = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.purple,
          ),
          centerTitle: true,
          title: Text(
            "Add a pill reminder",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          elevation: 0.0,
        ),
        body: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "medicine Name  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter the medicine name here";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              medname = val;
                            });
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
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Dosage  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        SizedBox(height: 10.0),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter medicine dosage here";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              dose = val;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Dosage ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "please choose medicine type  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 45,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildContactType('pill'),
                              SizedBox(width: 10),
                              _buildContactType('syringe'),
                              SizedBox(width: 10),
                              _buildContactType('bottle'),
                              SizedBox(width: 10),
                              _buildContactType('tablet'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Remind me every  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16),
                              child: DropDownFormField(
                                titleText: 'select interval time',
                                hintText: 'Please choose one',
                                value: _selectedinterval,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedinterval = value;
                                    intervals = value;
                                  });
                                },
                                dataSource: [
                                  {
                                    "display": "4",
                                    "value": "4",
                                  },
                                  {
                                    "display": "6",
                                    "value": "6",
                                  },
                                  {
                                    "display": "8",
                                    "value": "8",
                                  },
                                  {
                                    "display": "12",
                                    "value": "12",
                                  },
                                  {
                                    "display": "24",
                                    "value": "24",
                                  },
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Reminder date and time ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        DateTimePicker(
                          type: DateTimePickerType.dateTimeSeparate,
                          dateMask: 'd MMM, yyyy',
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Hour",
                          selectableDayPredicate: (date) {
                            // Disable weekend days to select from the calendar
                            if (date.weekday == 6 || date.weekday == 7) {
                              return false;
                            }

                            return true;
                          },
                          onChanged: (val) {
                            setState(() {
                              time = val;
                            });
                          },
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
                                    print(medname);
                                    print(dose);
                                    print(medtype);
                                    print(intervals);
                                    print(time);
                                    _store.addmedReminder(Medicines(
                                        medicineName: medname,
                                        dosage: dose,
                                        medicineType: medtype,
                                        interval: intervals,
                                        startTime: time));

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'ADD medical records',
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
