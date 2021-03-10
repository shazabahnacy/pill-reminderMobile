import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class MedicalInfo {
  String medinfoId;
  String bloodsugar;
  String bloodpressure;
  String weight;
  String height;
  String heartrate;
  String respiratoryrate;

  MedicalInfo({
    @required this.medinfoId,
    @required this.bloodsugar,
    @required this.bloodpressure,
    @required this.weight,
    @required this.height,
    @required this.heartrate,
    @required this.respiratoryrate,
  });
}