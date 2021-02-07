import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicine_reminder/src/screens/new_entry/new_entry.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import './medicine.dart';

class AddReminders with ChangeNotifier {
  List<Medicines> _items = [];
  List<Medicines> get items {
    return [..._items];
  }

  Medicines findById(String id) {
    return _items.firstWhere((M) => M.id == id);
  }

  /////lecture 14
  Future<void> fetchAndSetProducts() async {
    const url =
        'https://pill-reminder-1-default-rtdb.europe-west1.firebasedatabase.app/Reminders.json';
    try {
      final response = await http.get(url);
      //print(json.decode(response.body));
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      final List<Medicines> dbReminders = [];
      dbData.forEach((key, data) {
        dbReminders.add(Medicines(
          id: key,
          medicineName: data['medicineName'],
          dosage: data['dosage'],
          medicineType: data['medicineType'],
          interval: data['interval'],
          startTime: data['startTime'],
        ));
      });
      _items = dbReminders;
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }

//'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'
  Future<void> addReminder(Medicines med) async {
    //essam@miu: https://console.firebase.google.com/u/0/project/csc422-rldb/database/csc422-rldb-default-rtdb/data
    const url =
        'https://pill-reminder-1-default-rtdb.europe-west1.firebasedatabase.app/Reminders.json';
    //'https://csc422-f20-lec12-default-rtdb.firebaseio.com/products.json';
    //https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg
    return http
        .post(url,
            body: json.encode({
              'medicineName': med.medicineName,
              'dosage': med.dosage,
              'medicineType': med.medicineType,
              'interval': med.interval,
              'startTime': med.startTime,
            }))
        .then((res) {
      final newReminder = Medicines(
          medicineName: med.medicineName,
          dosage: med.dosage,
          medicineType: med.medicineType,
          interval: med.interval,
          startTime: med.startTime,
          id: jsonDecode(res.body)['medicineName']);
      _items.add(newReminder);
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
