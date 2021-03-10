//import 'dart:js';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medicine_reminder/main.dart';
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
  // final _doseFocusNode = FocusNode();
  // final _medtypeFocusNode = FocusNode();
  // final _dateController = TextEditingController();

  // final _imageUrlFocusNode = FocusNode();

  // TextEditingController medinamecontroller =TextEditingController(text: Medicines.medicineName);
  // TextEditingController doseController = TextEditingController();
  //final medtypeController = TextEditingController();
  // TextEditingController intervalController = TextEditingController();
  // TextEditingController timeController = TextEditingController();

  String medicineName, dosage, medicineType, interval, startTime;
  final _store = Store();
  final _formKey = GlobalKey<FormState>();
  List<String> _intervalss = ['4', '8', '12', '24'];
  String _selectedinterval;
  String _typeSelected;
  String dropdownValue = '4';
  List<Medicines> medicines = [];

  //final TextEditingController _lastNameController = new TextEditingController();

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
        medicineType = title;
        //medtypeController.text = medicineType;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Medicines medicines = ModalRoute.of(context).settings.arguments;
    final medicineNameController =
        TextEditingController(text: medicines.medicineName);
    final dosageController = TextEditingController(text: medicines.dosage);
    final medicineTypeController =
        TextEditingController(text: medicines.medicineType);
    final intervalController = TextEditingController(text: medicines.interval);
    final timeController = TextEditingController(text: medicines.startTime);
    //Medicines medicines = widget.medicines;
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
                          //controller: medicineNameController,
                          initialValue: medicines.medicineName,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('please enter new dosage');
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              medicines.medicineName = val;
                            });
                          },
                          // medicineName = medicineNameController.text;
                          // medicineNameController.text = medicineName;
                          //   },
                          // controller: medinamecontroller,
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
                          //controller: dosageController,
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return ('please enter new dosage');
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          initialValue: medicines.dosage,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your medicine dose here";
                            }
                            int dose = int.tryParse(value);
                            if (dose == null || dose <= 0) {
                              return 'Age must be greater then 0';
                            }
                            return null;
                          },

                          onChanged: (val) {
                            setState(() {
                              medicines.dosage = val;
                            });
                          },
                          // onChanged: (val) {
                          // dosage = val;
                          // dosage = dosageController.text;
                          //dosageController.text = val;
                          // },
                          //initialValue: medicines?.dosage,
                          //  controller: doseController,
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
                                hintText: intervalController.text,
                                value: _selectedinterval,
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return ('please enter new dosage');
                                //   } else {
                                //     return null;
                                //   }
                                // },
                                onChanged: (value) {
                                  setState(() {
                                    _selectedinterval = value;
                                    medicines.interval = value;
                                  });

                                  // intervalController.text = interval;
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
                          //initialValue: DateTime.now().toString(),
                          initialValue: medicines.startTime,
                          //  controller: timeController,
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
                              medicines.startTime = val;
                              // timeController.text = startTime;
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
                                    _formKey.currentState.save();

                                    print(medicineName);
                                    print(dosage);
                                    print(medicineType);
                                    print(interval);
                                    print(startTime);
                                    _store.editProduct({
                                      'MedicineName': medicines.medicineName,
                                      'dosage': medicines.dosage,
                                      'medicineType': medicines.medicineType,
                                      'interval': medicines.interval,
                                      'StartTime': medicines.startTime
                                    }, medicines.rId);
                                  }
                                  scheduleNotification();
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

Future<void> scheduleNotification() async {
  Medicines medicines;
  print(medicines.startTime);
  var hour = int.parse(medicines.startTime);
  print('ay khara');
  // var hour = int.parse(medicines.startTime[0] + medicines.startTime[1]);
  // var ogValue = hour;
  // var minute = int.parse(medicines.startTime[2] + medicines.startTime[3]);

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'repeatDailyAtTime channel id',
    'repeatDailyAtTime channel name',
    'repeatDailyAtTime description',
    importance: Importance.Max,
    // sound: 'sound',
    ledColor: Color(0xFF3EB16F),
    ledOffMs: 1000,
    ledOnMs: 1000,
    enableLights: true,
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.showDailyAtTime(
      int.parse(medicines.rId[0]),
      'Mediminder: ${medicines.medicineName}',
      // medicines.medicineType != MedicineType.None.toString()
      'It is time to take your ${medicines.medicineType.toLowerCase()}, according to schedule'
          'It is time to take your medicine, according to schedule',
      Time(hour, 0),
      platformChannelSpecifics);
  //hour = ogValue;
}
//await flutterLocalNotificationsPlugin.cancelAll();

// void scheduleAlarm() async {
//   var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 10));
//   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'alarm_notif',
//     'alarm_notif',
//     'Channel for Alarm notification',
//     icon: '@mipmap/launcher_icon',
//     // sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
//     largeIcon: DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
//   );
//   var iOSPlatformChannelSpecifics = IOSNotificationDetails(
//       sound: 'a_long_cold_sting.wav',
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true);
//   var platformChannelSpecifics = NotificationDetails(
//       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.schedule(
//       0,
//       'Office',
//       'medicines.medicineName',
//       scheduledNotificationDateTime,
//       platformChannelSpecifics);
// }
//DateTime scheduledNotificationDateTime, Medicines medicines) async {

// var iOSPlatformChannelSpecifics = IOSNotificationDetails(
//     sound: 'a_long_cold_sting.wav',
//     presentAlert: true,
//     presentBadge: true,
//     presentSound: true);
// var platformChannelSpecifics = NotificationDetails(
//     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
