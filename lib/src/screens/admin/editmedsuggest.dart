import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/models/medsuggestion.dart';
import 'package:medicine_reminder/src/models/medicine_type.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/screens/homepage/homepage.dart';
//import 'package:date_time_picker/date_time_picker.dart';
//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:medicine_reminder/src/services/store.dart';

class EditmedSuggest extends StatefulWidget {
  @override
  _EditmedSuggestState createState() => _EditmedSuggestState();
}

class _EditmedSuggestState extends State<EditmedSuggest> {
  // static String id = 'EditProduct';

  // final _doseFocusNode = FocusNode();
  // final _medtypeFocusNode = FocusNode();
  // final _dateController = TextEditingController();

  // final _imageUrlFocusNode = FocusNode();

  // TextEditingController medinamecontroller =TextEditingController(text: Medicines.medicineName);
  // TextEditingController doseController = TextEditingController();
  //final medtypeController = TextEditingController();
  // TextEditingController intervalController = TextEditingController();
  // TextEditingController timeController = TextEditingController();

  String id,
      medName,
      dosage,
      medDiscribtion,
      medDosage,
      medRestriction,
      medSideEffects;
  final _store = Store();
  final _formKey = GlobalKey<FormState>();
  // List<String> _intervalss = ['4', '8', '12', '24'];
  // String _selectedinterval;
  // String _typeSelected;
  // String dropdownValue = '4';
  List<MedSuggetion> medsuggetion = [];

  //final TextEditingController _lastNameController = new TextEditingController();

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 85,
        // decoration: BoxDecoration(
        //   color: _typeSelected == title
        //       ? Colors.purpleAccent
        //       : Theme.of(context).accentColor,
        //   borderRadius: BorderRadius.circular(15),
        // ),
        // child: Center(
        //   child: Text(
        //     title,
        //     style: TextStyle(fontSize: 18, color: Colors.white),
        //   ),
        // ),
      ),
      // onTap: () {
      //   _typeSelected = title;
      //   medicineType = title;

      //   //medtypeController.text = medicineType;
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    MedSuggetion medSuggetion = ModalRoute.of(context).settings.arguments;
    // final medidController =TextEditingController(text: medSuggetion.id);
    final medNameController = TextEditingController(text: medSuggetion.medName);
    final medDiscribtionController =
        TextEditingController(text: medSuggetion.medDiscribtion);
    final medDosageController =
        TextEditingController(text: medSuggetion.medDosage);
    final medRestrictionController =
        TextEditingController(text: medSuggetion.medRestriction);
    final medSideEffectsController =
        TextEditingController(text: medSuggetion.medSideEffects);

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.purple,
          ),
          centerTitle: true,
          title: Text(
            "Edit a Medicine suggestion ",
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
                                "medicine Name ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        TextFormField(
                          initialValue: medSuggetion.medName,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('please enter new name');
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              medSuggetion.medName = val;
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
                                "medicine discription  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        TextFormField(
                          initialValue: medSuggetion.medDiscribtion,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('please enter new discription');
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              medSuggetion.medDiscribtion = val;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Medicine discription',
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
                                "Dosage ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        SizedBox(height: 10.0),
                        TextFormField(
                          initialValue: medSuggetion.medDosage,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('please enter new dosage');
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              medSuggetion.medDosage = val;
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
                                "medicine Restriction  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        TextFormField(
                          //controller: medicineNameController,
                          initialValue: medSuggetion.medRestriction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('please enter new restriction');
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              medSuggetion.medRestriction = val;
                            });
                          },
                          // medicineName = medicineNameController.text;
                          // medicineNameController.text = medicineName;
                          //   },
                          // controller: medinamecontroller,
                          decoration: InputDecoration(
                              labelText: 'Medicine restrictcion',
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
                                "medicine side effect  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                        TextFormField(
                          //controller: medicineNameController,
                          initialValue: medSuggetion.medSideEffects,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('please enter new side effect');
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              medSuggetion.medSideEffects = val;
                            });
                          },

                          decoration: InputDecoration(
                              labelText: 'Medicine discription',
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

                                    // print(id);
                                    print(medName);
                                    print(medDiscribtion);
                                    print(medDosage);
                                    print(medRestriction);
                                    print(medSideEffects);

                                    _store.editSuggetion({
                                      'medName': medSuggetion.medName,
                                      'medDiscribtion':
                                          medSuggetion.medDiscribtion,
                                      'medDosage': medSuggetion.medDosage,
                                      'medRestriction':
                                          medSuggetion.medRestriction,
                                      'Side medSideEffects':
                                          medSuggetion.medSideEffects,
                                    }, medSuggetion.mid);
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                child: Center(
                                  child: Text(
                                    'Edit medicine suggestion',
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
