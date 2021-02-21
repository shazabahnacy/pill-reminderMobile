import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_reminder/constants.dart';
import 'package:medicine_reminder/src/models/medicalInfo.dart';
import 'package:medicine_reminder/src/models/medicine.dart';

class Store {
  final Firestore _firestore = Firestore.instance;

  addmedReminder(Medicines medicines) {
    _firestore.collection('Reminder').add({
      'medname': medicines.medicineName,
      'dose': medicines.dosage,
      'medtype': medicines.medicineType,
      'intervals': medicines.interval,
      'time': medicines.startTime
    });
  }
}
