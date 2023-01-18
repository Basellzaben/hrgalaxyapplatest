import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class Language extends ChangeNotifier {
  String langg = language;

  getLanguage() {
    return langg;
  }

  setLanguage(String langl) {
    langg = langl;
    notifyListeners();
  }

  String Llanguage(String l) {
String txt='';
    getLanguage() == 'AR'? txt= ar[l].toString():txt= en[l].toString();
    return txt;
  }


  static Map<String , Object?>  ar={
    "language":"اللغه العربيه"
    ,"settings":"الاعدادات"
    ,"finget":"استخدام البصمة"
    ,"username":"اسم المستخدم"
    ,"password":"رمز المرور"
    ,"login":"تسجيل الدخول"
    ,"profile":"الملف الشخصي"
    ,"timeimprint":"بصمة الدوام"
    ,"workingstate":"حالة الدوام"
    ,"Logout":"تسجيل الخروج"
    ,"log":" جار تسجيل الدخول يرجى الانتظار"
    ,"logerror":" رقم المستخدم او رمز المرور خطأ"
    ,"distancesafe":"المسافة المسموح بها"
    ,"distancedang":"  المسافة الى الشركة   "
    ,"leaverequest":"طلب مغادرة"
    ,"vacationrequest":"طلب اجازة"
    ,"Name":"الاسـم : "
    ,"Departuretype":"نوع المغادرة"
    ,"Departurestarttime":"وقت بداية المغادرة"
    ,"Departureendtime":"وقت نهاية المغادرة"
    ,"Send":"أرسال"
    ,"notes":"الملاحظات"
    ,"Departuretime":"مدة المغادرة"
    ,"vactioncount":"عدد ايام الاجازة"
    ,"vactiontype":"نوع الاجازة"
    ,"datestartvaction":"تاريخ بداية الاجازة"
    ,"dateendvaction":"تاريخ نهاية الاجازة"
    ,"emmployees":"الموظف البديل"
    ,"phoneanddetails":"العنوان ورقم الهاتف اثناء الاجازة"
    ,"selectimage":"اختيار صورة"
    ,"Administration":"الادارة"
    ,"Directresponsible":"المسؤول المباشر"
    ,"Qualification":"المؤهل العلمي"
    ,"employeestatus":"حالة الموظف"
    ,"YearsofExperience":"عدد سنوات الخبرة"
    ,"department":"القسم"
    ,"Requestcertificate":"طلب شهادة"
    ,"otherrequests":"طلبات اخرى"
    ,"to":"موجهة الى"
    ,"certificationtype":"نوع الشهادة"
    ,"thereasons":"الاسباب"
    ,"Certificatestatement":"بيان الشهادة"
    ,"documents":"الوثائق"
    ,"Order":"طلب"
    ,"requesttype":"نوع الطلب"
    ,"request":"الطلب"

  };
  static Map<String , Object?>  en={
    "username":"username "
    ,"password":"password"
    ,"settings":"Settings"
    ,"login":"LogIn"
    ,"finget":"fingerprint use"
    ,"profile":"profile"
    ,"timeimprint":"time imprint"
    ,"workingstate":"working state"
    ,"Logout":"Logout"
    ,"language":"English"
    ,"log":"Signing in"
    ,"logerror":"Wrong user number or passcode"
    ,"distancesafe":"Allowed distance"
    ,"distancedang":"The distance to the company"
    ,"leaverequest":"leave request"
    ,"vacationrequest":"vacation request"
    ,"Name":"Name : "
    ,"Departuretype":"Departure type"
    ,"Departurestarttime":"Departure start time"
    ,"Departureendtime":"Departure end time"
    ,"notes":"Notes & Comment"
    ,"Departuretime":"Departure time"
    ,"Send":"Send"
    ,"Departuretime":"Departure time"
    ,"vactiontype":"vacation Type"
    ,"datestartvaction":"vacation start date"
    ,"dateendvaction":"vacation end date"
    ,"vactioncount":"number of vacation days"
    ,"phoneanddetails":"Address and phone number while on vacation"
    ,"emmployees":"substitute employee"
    ,"selectimage":"Select Images"
    ,"Administration":"Administration"
    ,"Directresponsible":"Direct responsible"
    ,"Qualification":"Qualification"
    ,"employeestatus":"employee status"
    ,"YearsofExperience":"Years of Experience"
    ,"department":"department"
    ,"Requestcertificate":"Request a certificate"
    ,"otherrequests":"other requests"
    ,"to":"to"
    ,"certificationtype":"certificationtype"
    ,"thereasons":"the reasons"
    ,"Certificatestatement":"Certificate statement"
    ,"Order":"Order"
    ,"requesttype":"request type"
    ,"request":"request"
    ,"documents":"documents"

  };


}
