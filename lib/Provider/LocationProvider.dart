import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class LocationProvider extends ChangeNotifier {
  String CLat = '0.00';
  String CLong = '0.00';
  String saefdistance = '0.00';

  getsaefdistance() {
    return saefdistance;
  }

  setsaefdistance(String saefdistancee) {
    saefdistance = saefdistancee;
    notifyListeners();
  }

  getCLat() {
    return CLat;
  }

  setCLat(String CLatt) {
    CLat = CLatt;
    notifyListeners();
  }

  getCLong() {
    return CLong;
  }

  setCLong(String CLongg) {
    CLong = CLongg;
    notifyListeners();
  }

}