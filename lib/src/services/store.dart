import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_reminder/src/models/medicalinfo.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/screens/user/addMedicalRecord.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_reminder/src/models/medicalinfo.dart';

class Store {
  final Firestore _firestore = Firestore.instance;

  addmedrecord(MedicalInfo medicalinformation) {
    _firestore.collection('MedicalInfo').add({
      'bloodsugar': medicalinformation.bloodsugar,
      'bloodpressure': medicalinformation.bloodpressure,
      'weight': medicalinformation.weight,
      'height': medicalinformation.height,
      'heartrate': medicalinformation.heartrate,
      'respiratoryrate': medicalinformation.respiratoryrate,
    });
  }

  addmedReminder(Medicines medicines) {
    _firestore.collection('Reminder').add({
      'MedicineName': medicines.medicineName,
      'dosage': medicines.dosage,
      'medicineType': medicines.medicineType,
      'interval': medicines.interval,
      'StartTime': medicines.startTime,
    });
  }

  Stream<QuerySnapshot> loadReminder() {
    return _firestore.collection('Reminder').snapshots();
  }

  deleteProduct(documentId) {
    _firestore.collection('Reminder').document(documentId).delete();
  }

  editProduct(data, documentId) {
    _firestore.collection('Reminder').document(documentId).updateData(data);
  }
}
