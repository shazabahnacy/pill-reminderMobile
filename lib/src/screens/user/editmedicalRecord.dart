import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/models/medicalinfo.dart';
import 'package:medicine_reminder/src/screens/user/viewmedicalrec.dart';
import 'package:medicine_reminder/src/services/store.dart';

class Editmedicalrecord extends StatefulWidget {
  @override
  _EditmedicalrecordState createState() => _EditmedicalrecordState();
}

class _EditmedicalrecordState extends State<Editmedicalrecord> {
  static String id = 'EditProduct';

  String bloodsugar, bloodpressure, weight, height, heartrate, respiratoryrate;
  final _store = Store();
  final _formKey = GlobalKey<FormState>();
  String _typeSelected;
  List<MedicalInfo> medicalinfo = [];

  @override
  Widget build(BuildContext context) {
    MedicalInfo medicalinfo = ModalRoute.of(context).settings.arguments;
    final bloodSugarController =
        TextEditingController(text: medicalinfo.bloodsugar);
    final bloodPressureController =
        TextEditingController(text: medicalinfo.bloodpressure);
    final weightController = TextEditingController(text: medicalinfo.weight);
    final heightController = TextEditingController(text: medicalinfo.height);
    final heartRateController =
        TextEditingController(text: medicalinfo.heartrate);
    final respiratoryRateController =
        TextEditingController(text: medicalinfo.respiratoryrate);

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.purple,
          ),
          centerTitle: true,
          title: Text(
            "Edit the medical record",
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
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Blood Sugar Level",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                            TextFormField(
                              initialValue: medicalinfo.bloodsugar,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return ('please enter blood sugar');
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() {
                                  medicalinfo.bloodsugar = val;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'bloodsugar',
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
                                    "Blood Pressure  ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                            SizedBox(height: 10.0),
                            TextFormField(
                              initialValue: medicalinfo.bloodpressure,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return ('please enter new blood pressure');
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() {
                                  medicalinfo.bloodpressure = val;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'bloodpressure ',
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
                                    "Weight",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                            SizedBox(height: 10.0),
                            TextFormField(
                              initialValue: medicalinfo.weight,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return ('please enter new weight');
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() {
                                  medicalinfo.weight = val;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'weight ',
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
                                    "Height",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                            SizedBox(height: 10.0),
                            TextFormField(
                              initialValue: medicalinfo.height,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return ('please enter new height');
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() {
                                  medicalinfo.height = val;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'height ',
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
                                    "HeartRate",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                            SizedBox(height: 10.0),
                            TextFormField(
                              initialValue: medicalinfo.heartrate,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return ('please enter new heart rate');
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() {
                                  medicalinfo.heartrate = val;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'heartrate ',
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
                                    "Respiratory Rate",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                            SizedBox(height: 10.0),
                            TextFormField(
                              initialValue: medicalinfo.respiratoryrate,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return ('please enter new respiratory rate');
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (val) {
                                setState(() {
                                  medicalinfo.respiratoryrate = val;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'respiratoryrate ',
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

                                        print(bloodsugar);
                                        print(bloodpressure);
                                        print(weight);
                                        print(height);
                                        print(heartrate);
                                        print(respiratoryrate);
                                        _store.editmedicalrec({
                                          'bloodsugar': medicalinfo.bloodsugar,
                                          'bloodpressure':
                                              medicalinfo.bloodpressure,
                                          'weight': medicalinfo.weight,
                                          'height': medicalinfo.height,
                                          'heartrate': medicalinfo.heartrate,
                                          'respiratory rate':
                                              medicalinfo.respiratoryrate
                                        }, medicalinfo.medinfoId);
                                      }
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewMedicalRecords()));
                                    },
                                    child: Center(
                                      child: Text(
                                        'Edit medical record',
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
