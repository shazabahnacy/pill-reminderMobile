import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicine_reminder/src/screens/new_entry/addpillreminder.dart';

import 'package:flutter/foundation.dart';

class MedSuggetion with ChangeNotifier {
  String mid;
  String medName;
  String medDiscribtion;
  String medDosage;
  String medRestriction;
  String medSideEffects;

  MedSuggetion({
    @required this.mid,
    @required this.medName,
    @required this.medDiscribtion,
    @required this.medDosage,
    @required this.medRestriction,
    @required this.medSideEffects,
  });
}
