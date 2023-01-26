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

   TextDirection getDirection(){
    String languageCode = getLanguage();//Platform.localeName.split('_')[0];

    if(languageCode == "AR")
      return TextDirection.rtl;
    return TextDirection.ltr;

  }
   Alignment Align(){
    // String languageCode = Platform.localeName.split('_')[0];
    String languageCode = getLanguage();//Platform.localeName.split('_')[0];

    if(languageCode == "AR")
      return Alignment.topRight;
    return Alignment.topLeft;

  }
  String Llanguage(String l) {
String txt='';
    getLanguage() == 'AR'? txt= ar[l].toString():txt= en[l].toString();
    return txt;
  }

  static Map<String , Object?>  ar={
    "language":"اللغه العربيه",
    "previoustime":"وقت الانصراف السابق",
    "timeline":"الخط الزمني",
    "WorkInfoScreen":"الحضور و الانصراف",
  "sickleave":"مرضيه"
    ,"company":"المؤسسة"
    ,"Attendancetoday":"وقت الحضور اليوم"
    ,"settings":"الاعدادات"
    ,"Home":"الرئيسية"
    ,"annual":"سنوية"
    ,"vacations":"رصيد الاجازات"
    ,"basel":"باسل خلف الزبن"
    ,"wanttologout":"هل تريد تسجيل الخروج ؟"
    ,"finget":"استخدام البصمة"
    ,"username":"اسم المستخدم"
    ,"password":"رمز المرور"
    ,"login":"تسجيل الدخول"
    ,"profile":"الملف الشخصي"
    ,"defaultend":"'وقت نهايه الدوام المفترض'"

    ,"light":"فاتح"
    ,"dark":"الوضع الليلي"
    ,"timeimprint":"بصمة الدوام"
    ,"workingstate":"الدوام"
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
    ,"request":"طلب اجازه"
    ,"fingett":"البصمة"
    ,"myrequest":"طلباتي"

  };

  static Map<String , Object?>  en={
    "username":"username "
    ,"defaultend":"default end time"
    ,"password":"password"
    ,"fingett":"finger print",
  "sickleave":"sickleave",
    "WorkInfoScreen":"Attend and leave",

    "previoustime":"previous dismissal time",
  "myrequest":"My Request"
    ,"vacations":"vacations"
    ,"company":"Enterprise",
  "timeline":"time line",
    "Attendancetoday":"Attendance time today"
    ,"annual":"annual"
    ,"Home":"Home"
    ,"wanttologout":"Are you sure you want to logout?؟"
    ,"settings":"Settings"
    ,"login":"LogIn"
    ,"basel":"basel khalaf alzaben"
    ,"finget":"fingerprint use"
    ,"profile":"profile"
    ,"timeimprint":"time imprint"
    ,"workingstate":"work"
    ,"Logout":"Logout"
    ,"light":"Light"
    ,"dark":"Dark"
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
