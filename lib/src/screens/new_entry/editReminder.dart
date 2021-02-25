import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/models/medicine_type.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/screens/homepage/homepage.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:medicine_reminder/src/services/store.dart';

class Editreminder extends StatefulWidget {
  @override
  _EditreminderState createState() => _EditreminderState();
}

class _EditreminderState extends State<Editreminder> {
  static String id = 'EditProduct';
  String _medname, _dose, _medtype, _interv, _timess;
  final _store = Store();
  final _formKey = GlobalKey<FormState>();
  List<String> _intervalss = ['4', '8', '12', '24'];
  String _selectedinterval;
  String _typeSelected;
  String dropdownValue = '4';
  List<Medicines> medicines = [];
  final TextEditingController _medicineNameController =
      new TextEditingController();

  final TextEditingController _lastNameController = new TextEditingController();

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
        _typeSelected = title;
        _medtype = title;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Medicines medicines = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.purple,
          ),
          centerTitle: true,
          title: Text(
            "Edit a pill reminder",
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
                          onChanged: (val) {
                            _medname = val;
                          },
                          controller: _medicineNameController,
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
                          onChanged: (val) {
                            _dose = val;
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
                                  _selectedinterval = value;
                                  _interv = value;
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
                            _timess = val;
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
                                    _formKey.currentState.save();

                                    print(_medname);
                                    print(_dose);
                                    print(_medtype);
                                    print(_interv);
                                    print(_timess);
                                    _store.editProduct({
                                      'medicineName': _medname,
                                      'dosage': _dose,
                                      'medicineType': _medtype,
                                      'interval': _interv,
                                      'startTime': _timess
                                    }, medicines.rId);
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                child: Center(
                                  child: Text(
                                    'Edit reminder',
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
