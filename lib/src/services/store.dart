import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_reminder/src/models/medicalinfo.dart';
import 'package:medicine_reminder/src/screens/user/addMedicalRecord.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_reminder/src/models/medicalinfo.dart';

class Store {
  final Firestore _firestore = Firestore.instance;

  Addmedrecord(MedicalInfo medicalinformation) {
    _firestore.collection('MedicalInfo').add({
      'bloodsugar': medicalinformation.bloodsugar,
      'bloodpressure': medicalinformation.bloodpressure,
      'weight': medicalinformation.weight,
      'height': medicalinformation.height,
      'heartrate': medicalinformation.heartrate,
      'respiratoryrate': medicalinformation.respiratoryrate,
    });
  }
}
