import 'package:medicine_reminder/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OurDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createUser(ourUser user) async {
    String retval = "error";

    try {
      await _firestore.collection("users").document(user.uid).setData({
        'fullName': user.fullName,
        'email': user.email,
        'age': user.age,
        'phoneNumber': user.phoneNumber,
        'is_Admin': false,
      });
      retval = "sucess";
    } catch (e) {
      print(e);
    }
    return retval;
  }
}
