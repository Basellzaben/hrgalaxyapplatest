import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class LoginProvider extends ChangeNotifier {
  bool Remember = false;
  String username = 'nn';
  String password = 'nn';

  getRemember() {
    return Remember;
  }

  setRemember(bool Remembere) {
    Remember = Remembere;
    notifyListeners();
  }

  getUsername() {
    return username;
  }

  setUsername(String usernamee) {
    username = usernamee;
    notifyListeners();
  }

  getPassword() {
    return password;
  }

  setPassword(String passwordd) {
    password = passwordd;
    notifyListeners();
  }



}