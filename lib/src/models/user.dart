import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_reminder/src/models/medicine.dart';

//Medicines medicines = Medicines();

class ourUser {
  String uid;
  String email;
  String fullName;
  String age;
  String phoneNumber;
  //List<Medicines> medicines = [];

  ourUser({
    this.uid,
    this.email,
    this.fullName,
    this.age,
    this.phoneNumber,
    // this.medicines,
  });
}
