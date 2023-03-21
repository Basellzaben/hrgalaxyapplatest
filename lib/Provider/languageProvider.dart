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
    "loading":"يجب الانتظار لحين جلب الوقت...",
    "previoustime":"وقت الانصراف السابق",
    "aboutcompany":"وقت الانصراف السابق",
    "notask":"لا يتوفر لديك مهام الان",
    "MyRequest":"طلباتي",
    "checkin":"تسجيل الدخول",
    "checkout":"تسجيل الخروج",

    "late":"متاخر",
    "Absence":"الغياب بدون عذر",
    "fullwork":"دوام كامل",


    "timeline":"الخط الزمني",
    "WorkInfoScreen":"الحضور و الانصراف",
  "sickleave":"مرضيه"
    ,"company":"المؤسسة"
    ,"Attendancetoday":"وقت الحضور اليوم"
    ,"settings":"الاعدادات"
    ,"Home":"الرئيسية",
  "aboutcompany":"مجموعة غالاكسي الدولية (GI - Group) هي شركة لتكنولوجيا المعلومات تأسست عام 1992 بفروع مختلفة",
  "annual":"سنوية"
    ,"vacations":"رصيد الاجازات"
    ,"basel":"باسل خلف الزبن"
    ,"wanttologout":"هل تريد تسجيل الخروج ؟"
    ,"finget":"استخدام البصمة"
    ,"username":"اسم المستخدم"
    ,"password":"رمز المرور"
    ,"login":"تسجيل الدخول"
    ,"profile":"الملف الشخصي"
    ,"defaultend":"'وقت نهايه الدوام المفترض'"
    ,"departures":" : المغادرات"
    ,"vacations":" الاجازات",
  "acceptable":"مقبولة"
    ,"rejected":"مرفوضة",
  "pending":"قيد الانتظار",
  "workinmonth":"حاله الدوام خلال الشهر",
  "light":"فاتح"
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
    ,"Leaving":"مغادره"
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
    ,"fingett":"البصمة",
  "selectcolor":"اختيار الالوان",
  "metr":"متر"
    ,"nonotification":"لا يوجد اشعارات حاليا"
  ,"distancerange":"يجب ان تكون ضمن نطاق المسافه المسموح بها"
  ,"distancerangeit":"يجب ان تكون ضمن نطاق المسافه المسموح بها وهي",
    "myrequest":"طلباتي",
    "checkat":"تم تسجيل الدخول اليوم في الساعة 8",
    "onmonth":"خلال الشهر",
    "absence":"الاجازات",
    "sendrequest":"تقديم طلب",
    "task":"المهام",
    "checkinout":"تسجيل الحضور / المغادرة"
  };
  static Map<String , Object?>  en={
    "username":"username "
  ,"metr":"mtr",
    "checkin":"check in",
    "Absence":"Absence without excuse",
    "fullwork":"Full-time",
    "late":"Late",
  "departures":"departures :",
  "vacations":"vacations :",
    "checkout":"check out",
    "notask":"You don't have any assignments right now",
    "Leaving":"Leaving",
    "task":"Task",
  "sendrequest":"Submit a application",
    "absence":"absence",
    "onmonth":"in month",

    "selectcolor":"Select color",

    "acceptable":"acceptable",
    "rejected":"rejected",
  "rejected":"rejected",
  "pending":"pending",
"workinmonth":"Working hours during the month",
    "checkinout":"Attendance / departure registration"
  ,"nonotification":"There are currently no notifications",
  "checkat":"Checked in at 8:00 PM"
    ,"defaultend":"default end time"
  ,"password":"password",
"distancerangeit":"It must be within the permitted distance range",
"distancerange":"It must be within the allowed distance range",
  "loading":"You have to wait until the time comes..."
  ,"fingett":"finger print",
  "sickleave":"sick leave",
    "aboutcompany":"Galaxy International Group (GI - Group) is an Information Technology Company established in 1992 with different branches",
    "WorkInfoScreen":"Attend and leave",
    "MyRequest":"My Request",
    "previoustime":"previous dismissal time",
  "myrequest":"My Request"
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
