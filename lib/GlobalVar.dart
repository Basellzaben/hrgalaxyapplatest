
import 'dart:io';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';


class Globalvireables {

  //Colors
  static String basecolor="#0F64A2";
  static String secondcolor="#D09A64";
  static String white2="#F5F5F5";
  static String white="#ffffff";
  static String black="#000000";
  static String black2="#191919";


  //Api's
  static String loginapi="http://10.0.1.60:8020/api/User/CheckUser";
  static String personalinfoapi="http://10.0.1.60:8020/api/EmployeeInfo/GetEmployeePersonalInfo/";
  static String workstateapi="http://10.0.1.60:8020/api/EmployeeInfo/GetEmployeeWorkInfo/";
  static String check="http://10.0.1.60:8020/api/Attendance/CheckinOut/";
  static String urltime = "http://10.0.1.60:88/api/data/GetDatetimesp";
  static String GetLocation = "http://10.0.1.60:8020/api/Destination/GetLocation";


}