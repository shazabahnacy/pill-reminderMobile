import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicine_reminder/src/models/user.dart';
//import 'package:medicine_reminder/states/currentUser.dart';
import 'package:medicine_reminder/src/models/database.dart';

class CurrentUser {
  ourUser currentUser;
  //ourUser get getCurrentUser => _currentUser;
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<String> OnStartUp() async {
  //   String retVal = "error";

  //   try {
  //     FirebaseUser _firebaseuser = await _auth.currentUser();
  //     print(_firebaseuser);
  //     // if (_firebaseuser != null) {
  //     currentUser.uid = _firebaseuser.uid;
  //     currentUser.email = _firebaseuser.email;
  //     retVal = "sucess";
  //     print('tststststtsts');
  //     print(currentUser.uid);
  //     //}
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  Future<String> SignOut() async {
    String retval = "error";

    try {
      await _auth.signOut();
      currentUser = null;
      retval = "sucess";
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String retval = "error";
    ourUser _user = ourUser();

    try {
      AuthResult _authresult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authresult.user.uid;
      _user.email = _authresult.user.email;
      _user.fullName = fullName;

      String _returnString = await OurDatabase().createUser(_user);
      if (_returnString == "sucess") {
        retval = "sucess";
      }
    } catch (e) {
      retval = e.message;
    }
    return retval;
  }

  // Future<String> loginUserWithEmail(String email,String password)async{
  // String retval="error";
  //
  // try {
  //   AuthResult _authResult= await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   _currentUser.uid=_authResult.user.uid;
  //   _currentUser.email=_authResult.user.email;
  //
  //   retval="sucess";
  // }catch(e){
  //   retval=e.message;
  // }
  // return retval;
  // }

}
