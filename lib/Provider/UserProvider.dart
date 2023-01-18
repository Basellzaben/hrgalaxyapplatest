import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class UserProvider extends ChangeNotifier {
  String name = '';
  String job = '';
  String depdesc = '';
  String section = '';
  String mangername = '';
  String workstate = '';
  String years = '';

  getname() {
    return name;
  }
  getjob() {
    return job;
  }
  getdepdesc() {
    return depdesc;
  }
  getsection() {
    return section;
  }
  getmangername() {
    return mangername;
  }
  getworkstate() {
    return workstate;
  }
  getyears() {
    return years;
  }


  setName(String namee) {
    name = namee;
    notifyListeners();
  }
  setjob(String jobe) {
    job = jobe;
    notifyListeners();
  }
  setdepdesc(String depdesce) {
    depdesc = depdesce;
    notifyListeners();
  }
  setsection(String sectione) {
    section = sectione;
    notifyListeners();
  }
  setmangername(String mangernamee) {
    mangername = mangernamee;
    notifyListeners();
  }
  setworkstate(String workstatee) {
    workstate = workstatee;
    notifyListeners();
  }
  setyears(String yearse) {
    years = yearse;
    notifyListeners();
  }






}