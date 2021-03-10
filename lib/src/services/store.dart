import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_reminder/src/models/medicalinfo.dart';
import 'package:medicine_reminder/src/models/medsuggestion.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/screens/user/addMedicalRecord.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Store {
  final Firestore _firestore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  addmedReminder(Medicines medicines) async {
    FirebaseUser _firebaseuser = await _auth.currentUser();
    String _currentUser;
    _currentUser = _firebaseuser.uid;
    _firestore.collection('Reminder').add({
      'MedicineName': medicines.medicineName,
      'dosage': medicines.dosage,
      'medicineType': medicines.medicineType,
      'interval': medicines.interval,
      'StartTime': medicines.startTime,
      'uid': _currentUser,
    });
  }

  String userid;

  get getUserid => this.userid;

  set setUserid(userid) => this.userid = userid;
  void getUID() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setUserid = user.uid.toString();
  }

  Stream<QuerySnapshot> loadReminder() {
    // FirebaseUser _firebaseuser = await _auth.currentUser();
    //  String _currentUser;
    //  _currentUser = _firebaseuser.uid;
    //print(_currentUser);
    getUID();
    return _firestore.collection('Reminder').snapshots();
  }

  deleteProduct(documentId) {
    _firestore.collection('Reminder').document(documentId).delete();
  }

  editProduct(data, documentId) {
    _firestore.collection('Reminder').document(documentId).updateData(data);
  }

  Stream<QuerySnapshot> loadmedicalrec() {
    // FirebaseUser _firebaseuser = await _auth.currentUser();
    //  String _currentUser;
    //  _currentUser = _firebaseuser.uid;
    //print(_currentUser);
    return _firestore.collection('MedicalInfo').snapshots();
  }

  deletemedicalrec(documentId) {
    _firestore.collection('MedicalInfo').document(documentId).delete();
  }

  editmedicalrec(data, documentId) {
    _firestore.collection('MedicalInfo').document(documentId).updateData(data);
  }

  addMedSuggest(MedSuggetion medSuggetion) {
    _firestore.collection('medsuggetion').add({
      'medName': medSuggetion.medName,
      'medDiscribtion': medSuggetion.medDiscribtion,
      'medDosage': medSuggetion.medDosage,
      'medRestriction': medSuggetion.medRestriction,
      'Side medSideEffects': medSuggetion.medSideEffects,
    });
  }

  Stream<QuerySnapshot> loadMedSuggetion() {
    return _firestore.collection('medsuggetion').snapshots();
  }

  deleteMedSuggetion(documentId) {
    _firestore.collection('medsuggetion').document(documentId).delete();
  }

  editSuggetion(data, documentId) {
    _firestore.collection('medsuggetion').document(documentId).updateData(data);
  }
}
