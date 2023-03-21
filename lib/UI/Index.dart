import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:hrgalaxyapplatest/Provider/UserProvider.dart';
import 'package:hrgalaxyapplatest/Provider/languageProvider.dart';
import 'package:hrgalaxyapplatest/UI/Leave_Request.dart';
import 'package:hrgalaxyapplatest/UI/VacationScreen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timelines/timelines.dart';
import '../Models/Personalinfo.dart';
import '../Models/WorkInfo.dart';
import '../Provider/LoginProvider.dart';
import '../Provider/ThemeProvider.dart';
import 'FngetPrint.dart';
import 'LoginScreen.dart';
import 'MyRequest.dart';
import 'WorkInfo.dart';
import 'package:intl/intl.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var check = false;

  @override
  void dispose() {
    super.dispose();
  }
  String datee='';
  String datee2='';
  var prefs;
  int selectedIndex = 0;
  List<String> timelinestr=['تاريخ الميلاد','تاريخ التوظيف','تاريخ التثبيت','علاوه دوريه','مر 1 سنه منذ تاريخ التوظيف'];
  List<String> timelindate=['26/07/1999','24/04/2021','23/07/2021','24/07/2021','24/04/2022'];
  Future<Personalinfo> getUserInfo() async {
     prefs = await SharedPreferences.getInstance();

    var  jsonResponse= jsonDecode('{"EmployeeDisplayName":"باسل خلف الزبن","JobTitle":"مبرمج","EmployeeDepartmentDescription":"الادارة العامة","EmployeeSectionDescription":"قسم الدعم الفني","ManagerName":"جهاد عبد الكريم عبد الله السعدي","Education_Desc":"-","AttStatus":"دوام","YearsOfExp":"1 سنة 9 شهر ","Email":""}');
    var username = Personalinfo.fromJson(jsonResponse);

    return username;
  }
  @override
  Widget build(BuildContext context) {
    var LoginP = Provider.of<LoginProvider>(context, listen: false);
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    final themep = context.watch<ThemeProvider>();
    DateTime now = DateTime.now();
    datee= DateFormat('DD MM yyyy').format(now).toString();
    datee2= DateFormat('EEE d MMM').format(now).toString().substring(6,10);

    return ResponsiveBuilder(
        builder: (context,sizeInfo){
          return Scaffold(
          backgroundColor: themep.themeMode.backgroundColor,
          body: SafeArea(
              child: SingleChildScrollView(
                child: FutureBuilder<Personalinfo>(
                    future: getUserInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData || Provider.of<UserProvider>(context, listen: false).getname().toString().length>3) {
                        var data = snapshot.data;
                        try {
                          if(Provider.of<UserProvider>(context, listen: false).getname().toString().length<1){
                            Provider.of<UserProvider>(context, listen: false).setName(
                                data!.EmployeeDisplayName.toString());
                            Provider.of<UserProvider>(context, listen: false).setjob(
                                data.JobTitle.toString());
                            Provider.of<UserProvider>(context, listen: false).setdepdesc(
                                data.EmployeeDepartmentDescription.toString());
                            Provider.of<UserProvider>(context, listen: false).setsection(
                                data.EmployeeSectionDescription.toString());
                            Provider.of<UserProvider>(context, listen: false).setmangername(
                                data.ManagerName.toString());
                            Provider.of<UserProvider>(context, listen: false).setworkstate(
                                data.AttStatus.toString());
                            Provider.of<UserProvider>(context, listen: false).setyears(
                                data.YearsOfExp.toString());
                          }
                        }catch(_){
                        }return  SafeArea(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  width: MediaQuery.of(context).size.width/1.1,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    color: Colors.transparent,
                                    alignment: Alignment.topRight,
                                    child: Row(children: [
                                      //  Icon(Icons.person,color: Colors.white,size: 70,),

                                      IconButton(
                                          icon: Icon(Icons.notifications, color: themep.themeMode.primaryColor),
                                          onPressed: () =>
                                          {Fluttertoast.showToast(
                                              msg: LanguageProvider.Llanguage('nonotification'),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              textColor:HexColor(Globalvireables.white),
                                              fontSize: 16)
                                          }),


                                      Spacer(),

                                      Column(
                                        children: [
                                          Text(Provider.of<UserProvider>(context, listen: false).getname()??'',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                      Image(image: new AssetImage("assest/persionrx.png"),height: 55,width: 55),

                                      /* MaterialButton(
                                            onPressed: () {},
                                            elevation: 0.0,
                                            hoverElevation: 0,
                                            focusElevation: 0,
                                            highlightElevation: 0,
                                            color: themep.themeMode.primaryColor,
                                            textColor: themep.themeMode.primaryColor,
                                            *//*Icon(
                                              Icons.person,
                                              size: 20,
                                              color: themep.themeMode.backgroundColor,
                                            ),*//*
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
                                          ),*/
                                    ],),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 8,right: 8,bottom: 14),
                                  //  color: HexColor(Globalvireables.white2),
                                  child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.only(left: 13,right: 13,top: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black12),
                                              color: themep.themeMode.dividerColor,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8.0),
                                                  bottomRight: Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  bottomLeft: Radius.circular(8.0)
                                              )
                                              ),
                                          child: Column(
                                            children: [

                                              Container(
                                                margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 22),
                                                child: Row(children: [
                                                  Text(datee,style: TextStyle(fontWeight: FontWeight.w200,fontSize: 16),),
                                                  Spacer(),
                                                  Spacer(),
                                                  Text(datee2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),



                                                ],),
                                              ),

                                              Container(
                                                  margin: EdgeInsets.only(top: 5,left: 10,right: 10),
                                                  alignment: Alignment.topRight,
                                                  child: Text(LanguageProvider.Llanguage('checkinout'))),

                                              Row(children: [
                                                Spacer(),
                                                GestureDetector(
                                                    onTap: () {

                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FngetPrint()));

                                                    },
                                                    child: Card(
                                                        child: Container(
                                                            margin: EdgeInsets.all(13),
                                                            child: Image(image: new AssetImage("assest/finger2.png"),height: 50,width: 50,)))),

                                                /* Icon(
                                              Icons.fingerprint,
                                              size: 50,
                                           color: Colors.green,
                                            ),*/
                                                Spacer(),
                                                Container(
                                                  width: 200,
                                                  margin: EdgeInsets.only(top: 5,left: 10,right: 10),
                                                  alignment: Alignment.topRight,
                                                  child: Expanded(child: Text(LanguageProvider.Llanguage('checkat'),style: TextStyle(fontSize: 14), maxLines: 4,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.right,),
                                                  )),


                                                Spacer(),


                                              ],),

                                            ],
                                          ),

                                        ),


                                        Container(
                                            margin: EdgeInsets.only(left:20,right: 20,bottom: 0,top: 20),
                                            alignment: LanguageProvider.langg=='AR'?Alignment.topRight:Alignment.topLeft,
                                            child: Text(LanguageProvider.Llanguage('myrequest'),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),


                                        Container(
                                          margin: EdgeInsets.only(top: 4),
                                          child: Row(children: [
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            VacationScreen()));
                                              },
                                              child: Container(
                                                color: HexColor(Globalvireables.white2),

                                                width: MediaQuery.of(context).size.width/2.5,
                                                child: Card(
                                                  color: HexColor(Globalvireables.white),
                                                  child: Column(children: [
                                                    Container(
                                                        margin: EdgeInsets.all(15),
                                                        alignment:Alignment.topRight,child: Text(LanguageProvider.Llanguage('sendrequest'),style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w400))),
                                                    LanguageProvider.getLanguage()=='AR'?    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,

                                                      children: [
                                                      Spacer(),
                                                      Text(LanguageProvider.Llanguage('onmonth'),style: TextStyle(color: Colors.black45,fontSize: 14)),
                                                        Text('2',style: TextStyle(color:Colors.deepOrangeAccent,fontSize: 18,fontWeight: FontWeight.bold,)),
                                                      Text('/',style: TextStyle(color: themep.themeMode.primaryColor,fontSize: 18,fontWeight: FontWeight.bold)),
                                                      Text('30',style: TextStyle(color: themep.themeMode.primaryColor,fontSize: 18,fontWeight: FontWeight.bold)),
                                                      Spacer(),


                                                    ],):
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,

                                                      children: [
                                                        Spacer(),
                                                        Text('2',style: TextStyle(color:Colors.deepOrangeAccent,fontSize: 18,fontWeight: FontWeight.bold,)),
                                                        Text('/',style: TextStyle(color: themep.themeMode.primaryColor,fontSize: 18,fontWeight: FontWeight.bold)),
                                                        Text('30',style: TextStyle(color: themep.themeMode.primaryColor,fontSize: 18,fontWeight: FontWeight.bold)),
                                                        Text(LanguageProvider.Llanguage('onmonth'),style: TextStyle(color: Colors.black45,fontSize: 14)),

                                                        Spacer(),


                                                      ],),
                                                    Container(
                                                        margin: EdgeInsets.all(10),
                                                        child: Text(LanguageProvider.Llanguage('absence'),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),))

                                                  ],),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {

                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Leave_Request()));

                                              },
                                              child: Container(
                                                color: HexColor(Globalvireables.white2),
                                                width: MediaQuery.of(context).size.width/2.5,
                                                child: Card(
                                                  color: HexColor(Globalvireables.white),
                                                  child: Column(children: [
                                                    Container(
                                                        margin: EdgeInsets.all(15),

                                                        alignment:Alignment.topRight,child: Text(LanguageProvider.Llanguage('sendrequest'),style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w400))),
                                                    LanguageProvider.getLanguage()=='AR'?  Row(children: [
                                                      Spacer(),
                                                      Text(LanguageProvider.Llanguage('onmonth'),style: TextStyle(color: Colors.black45,fontSize: 14)),
                                                      Text('2',style: TextStyle(color:Colors.deepOrangeAccent,fontSize: 18,fontWeight: FontWeight.bold)),
                                                      Text('/',style: TextStyle(color: themep.themeMode.primaryColor,fontSize: 18,fontWeight: FontWeight.bold)),
                                                      Text('30',style: TextStyle(color: themep.themeMode.primaryColor,fontSize: 18,fontWeight: FontWeight.bold)),
                                                      Spacer(),


                                                    ],):Row(children: [
                                                      Spacer(),
                                                      Text('2',style: TextStyle(color:Colors.deepOrangeAccent,fontSize: 18,fontWeight: FontWeight.bold)),
                                                      Text('/',style: TextStyle(color: themep.themeMode.primaryColor,fontSize: 18,fontWeight: FontWeight.bold)),
                                                      Text('30',style: TextStyle(color: themep.themeMode.primaryColor,fontSize: 18,fontWeight: FontWeight.bold)),
                                                      Text(LanguageProvider.Llanguage('onmonth'),style: TextStyle(color: Colors.black45,fontSize: 14)),
                                                      Spacer(),


                                                    ],),
                                                    Container(
                                                        margin: EdgeInsets.all(10),
                                                        child: Text(LanguageProvider.Llanguage('Leaving'),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),))

                                                  ],),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                          ],),
                                        ),




                                        /*  Container(
                                    decoration: BoxDecoration(
                                      color:  themep.themeMode.primaryColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(0.0),
                                          bottomRight: Radius.circular(40.0),
                                          topLeft: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(0.0)),
                                    ),
                                    margin: EdgeInsets.only(left: 10,right: 10,top: 15),
                                    width: MediaQuery.of(context).size.width/1.1,
                                    height: MediaQuery.of(context).sizeeight/5,
child: Row(children: [
  GestureDetector(
        onTap: () {
          Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        VacationScreen()));
        },

  child:   Padding(
        padding: const EdgeInsets.all(8.0),
        child:   Column(children: [
          Spacer(),
          MaterialButton(
              onPressed: () { Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          VacationScreen()));},
              color: Colors.green,
            //  textColor: HexColor(Globalvireables.white),
              elevation: 0.0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              child: Icon(
                Iconsoliday_village,
                size: 24,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
          ),
          // Image(image: new AssetImage("assest/holy.png"),height: 40,width: 40,),
          Container(width:100,child: Text(textAlign: TextAlign.center,LanguageProvider.Llanguage('vacationrequest'),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: HexColor(Globalvireables.white)))),
          Spacer(),

        ],),
  ),
),
Spacer(),
  GestureDetector(
        onTap: () {

          Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                          FngetPrint()));

        },
        child: GestureDetector(
          onTap: () {

              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          FngetPrint()));

          },
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:   Column(children: [
                Spacer(),
                MaterialButton(
                  onPressed: () { Navigator.of(context).push(
                      MaterialPageRoute(
                            builder: (context) =>
                                    FngetPrint()));},
                  elevation: 0.0,
                  hoverElevation: 0,
                  focusElevation: 0,
                  highlightElevation: 0,
                  color: Colors.amber,
                  textColor: HexColor(Globalvireables.white),
                  child: Icon(
                    Icons.fingerprint,
                    size: 24,
                  ),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
               // Image(image: new AssetImage("assest/finger2.png"),height: 40,width: 40,),
                Container(width:100,child: Text(textAlign: TextAlign.center,LanguageProvider.Llanguage('fingett'),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: HexColor(Globalvireables.white)))),
                Spacer(),
              ],),
          ),
        ),
  )
  ,Spacer(),
  GestureDetector(
        onTap: () {

          Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        Leave_Request()));

        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:   Column(children: [
              Spacer(),
              MaterialButton(
                elevation: 0.0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            Leave_Request()));
                },
                color: Colors.deepPurple,
                textColor: HexColor(Globalvireables.white),
                child: Icon(
                  Icons.outbond,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
           // Image(image: new AssetImage("assest/leave.png"),height: 40,width: 40,),
              Container(width:100,child: Text(textAlign: TextAlign.center,LanguageProvider.Llanguage('leaverequest'),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: HexColor(Globalvireables.white)))),
              Spacer(),
          ],),
        ),
  )







],),),*/
                                        Container(
                                            margin: EdgeInsets.only(left:18,right: 18,bottom: 10,top: 20),
                                            alignment: LanguageProvider.langg=='AR'?Alignment.topRight:Alignment.topLeft,
                                            child: Text(LanguageProvider.Llanguage('vacations'), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                        ),


                                        Card(
                                          child:   Row(children: [
                                            Spacer(),
                                            Column(children: [
                                              Text(LanguageProvider.Llanguage('annual'), style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200),)
                                              ,
                                              Text('3', style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color:  themep.themeMode.primaryColor),)

                                            ],)
                                            , Spacer(),
                                            Spacer(),
                                            Column(children: [
                                              Text(LanguageProvider.Llanguage('sickleave'), style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200),),
                                              Text('12', style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color:  themep.themeMode.primaryColor),)

                                            ],),
                                            Spacer(),
                                          ],),
                                        ),





/*
                            Row(children: [
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        color: Colors.white,
                                        child: Center(
                                            child: Column(
                                              children: [
                                                Spacer(),
                                                Spacer(),
                                                MaterialButton(
                                                  onPressed: () {},
                                                  color: Colors.deepOrange,
                                                  textColor: Colors.white,
                                                  elevation: 0.0,
                                                  hoverElevation: 0,
                                                  focusElevation: 0,
                                                  highlightElevation: 0,
                                                  child: Icon(
                                                    Icons.task_alt,
                                                    size: 24,
                                                  ),
                                                  padding: EdgeInsets.all(16),
                                                  shape: CircleBorder(),
                                                ),
                                                //  Icon(Icons.task_alt,color: Colors.white,size: 80,),
                                                Spacer(),
                                                Text('طلباتي', style: TextStyle(fontSize: 18, color: Colors.black),),
                                                Spacer(),

                                              ],
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        color: Colors.white,
                                        child: Center(
                                            child: Column(
                                              children: [
                                                Spacer(),
                                                Spacer(),
                                                MaterialButton(
                                                  onPressed: () {},
                                                  color: Colors.indigo,
                                                  textColor: Colors.white,
                                                  elevation: 0.0,
                                                  hoverElevation: 0,
                                                  focusElevation: 0,
                                                  highlightElevation: 0,
                                                  child: Icon(
                                                    Icons.account_balance_wallet,
                                                    size: 24,
                                                  ),
                                                  padding: EdgeInsets.all(16),
                                                  shape: CircleBorder(),
                                                ),
                                                //  Icon(Icons.task_alt,color: Colors.white,size: 80,),
                                                Spacer(),
                                                Text('الاجازات', style: TextStyle(fontSize: 18, color: Colors.black),),
                                                Spacer(),

                                              ],
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                            ],),*/
                                        /*   Row(children: [
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        color: Colors.white,
                                        child: Center(
                                            child: Column(
                                              children: [
                                                Spacer(),
                                                Spacer(),
                                                MaterialButton(
                                                  onPressed: () {},
                                                  color: Colors.deepOrange,
                                                  textColor: Colors.white,
                                                  elevation: 0.0,
                                                  hoverElevation: 0,
                                                  focusElevation: 0,
                                                  highlightElevation: 0,
                                                  child: Icon(
                                                    Icons.task_alt,
                                                    size: 24,
                                                  ),
                                                  padding: EdgeInsets.all(16),
                                                  shape: CircleBorder(),
                                                ),
                                                //  Icon(Icons.task_alt,color: Colors.white,size: 80,),
                                                Spacer(),
                                                Text('المهام', style: TextStyle(fontSize: 18, color: Colors.black),),
                                                Spacer(),

                                              ],
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        color: Colors.white,
                                        child: Center(
                                            child: Column(
                                              children: [
                                                Spacer(),
                                                Spacer(),
                                                MaterialButton(
                                                  onPressed: () {},
                                                  color: Colors.indigo,
                                                  textColor: Colors.white,
                                                  elevation: 0.0,
                                                  hoverElevation: 0,
                                                  focusElevation: 0,
                                                  highlightElevation: 0,
                                                  child: Icon(
                                                    Icons.account_balance_wallet,
                                                    size: 24,
                                                  ),
                                                  padding: EdgeInsets.all(16),
                                                  shape: CircleBorder(),
                                                ),
                                                //  Icon(Icons.task_alt,color: Colors.white,size: 80,),
                                                Spacer(),
                                                Text('الجدول الزمني', style: TextStyle(fontSize: 18, color: Colors.black),),
                                                Spacer(),

                                              ],
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                            ],),
                            Row(children: [
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        color: Colors.white,
                                        child: Center(
                                            child: Column(
                                              children: [
                                                Spacer(),
                                                Spacer(),
                                                MaterialButton(
                                                  onPressed: () {},
                                                  color: Colors.deepOrange,
                                                  textColor: Colors.white,
                                                  elevation: 0.0,
                                                  hoverElevation: 0,
                                                  focusElevation: 0,
                                                  highlightElevation: 0,
                                                  child: Icon(
                                                    Icons.task_alt,
                                                    size: 24,
                                                  ),
                                                  padding: EdgeInsets.all(16),
                                                  shape: CircleBorder(),
                                                ),
                                                //  Icon(Icons.task_alt,color: Colors.white,size: 80,),
                                                Spacer(),
                                                Text('طلباتي', style: TextStyle(fontSize: 18, color: Colors.black),),
                                                Spacer(),

                                              ],
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        color: Colors.white,
                                        child: Center(
                                            child: Column(
                                              children: [
                                                Spacer(),
                                                Spacer(),
                                                MaterialButton(
                                                  onPressed: () {},
                                                  color: Colors.indigo,
                                                  textColor: Colors.white,
                                                  elevation: 0.0,
                                                  hoverElevation: 0,
                                                  focusElevation: 0,
                                                  highlightElevation: 0,
                                                  child: Icon(
                                                    Icons.account_balance_wallet,
                                                    size: 24,
                                                  ),
                                                  padding: EdgeInsets.all(16),
                                                  shape: CircleBorder(),
                                                ),
                                                //  Icon(Icons.task_alt,color: Colors.white,size: 80,),
                                                Spacer(),
                                                Text('الاجازات', style: TextStyle(fontSize: 18, color: Colors.black),),
                                                Spacer(),

                                              ],
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                            ],),
*/


                                        Container(
                                            margin: EdgeInsets.only(left:8,right: 8,bottom: 10,top: 20),

                                            alignment: LanguageProvider.langg=='AR'?Alignment.topRight:Alignment.topLeft,

                                            child: Text(LanguageProvider.Llanguage('WorkInfoScreen'), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                        ),
                                        Container(
                                          /*  decoration: BoxDecoration(
                                         border: Border.all(color: Colors.black12),
                                         color: Colors.transparent,
                                         borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(8.0),
                                             bottomRight: Radius.circular(8.0),
                                             topLeft: Radius.circular(8.0),
                                             bottomLeft: Radius.circular(8.0))),*/
                                          child: Card(
                                            child: Column(children: [


                                              SizedBox(height: 22,),
                                              Column(children: [
                                                Text(LanguageProvider.Llanguage('Attendancetoday'),style: TextStyle(fontSize: 18,),),
                                                Text('8:13:00',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                SizedBox(height: 15,),
                                                Text(LanguageProvider.Llanguage('defaultend'),style: TextStyle(fontSize: 18,),),
                                                Text('17:00:00',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                                ,
                                                SizedBox(height: 15,),
                                                Text(LanguageProvider.Llanguage('previoustime'),style: TextStyle(fontSize: 18,),),
                                                Text('17:03:00',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                                              ],),

                                              Container(
                                                margin: EdgeInsets.only(bottom: 8),
                                              ),



                                            ],),
                                          ),
                                        )

                                        ,
                                        SizedBox(height: 20,),


                                      ]),
                                ),

                                SizedBox(height: 15,),

                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width/1.1,
                                    margin: EdgeInsets.only(
                                        top: 22, bottom: 0,left: 20,right: 20),
                                    color: HexColor(Globalvireables.white),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: HexColor(Globalvireables.white),
                                        ),
                                        child: Row(children: [
                                          Spacer(),
                                          Text(
                                            "تفاصيل الحضور و الانصراف",
                                            style: TextStyle(
                                                color: HexColor(
                                                    Globalvireables.black),
                                                fontSize: 14),
                                          ),
                                          Spacer(),
                                          Icon(Icons.work,color: themep.themeMode.primaryColor,)
                                        ],),
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WorkInfoScreen()));
                                        }

                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width/1.1,
                                    margin: EdgeInsets.only(left:18,right: 18,bottom: 10,top: 10),

                                    color: HexColor(Globalvireables.white),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: HexColor(Globalvireables.white),
                                        ),
                                        child: Row(children: [
                                          Spacer(),
                                          Text(
                                            LanguageProvider.Llanguage('MyRequest').toString(),
                                            style: TextStyle(
                                                color: HexColor(
                                                    Globalvireables.black),
                                                fontSize: 14),
                                          ),
                                          Spacer(),
                                          Icon(Icons.remove_from_queue_sharp,color: Colors.redAccent,)
                                        ],),
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyRequest()));
                                        }

                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width/1.1,
                                    margin: EdgeInsets.only(
                                        top: 0, bottom: 0),
                                    color: HexColor(Globalvireables.white),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: HexColor(Globalvireables.white),
                                        ),
                                        child: Row(children: [
                                          Spacer(),
                                          Text(
                                            LanguageProvider.Llanguage('task'),
                                            style: TextStyle(
                                                color: HexColor(
                                                    Globalvireables.black),
                                                fontSize: 14),
                                          ),
                                          Spacer(),
                                          Icon(Icons.task_alt,color: Colors.green,)
                                        ],),
                                        onPressed: () async {
                                          Fluttertoast.showToast(
                                              msg: LanguageProvider.Llanguage('notask'),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              textColor: HexColor(Globalvireables.white),
                                              fontSize: 16);
                                        }

                                    ),
                                  ),
                                ),



                                /*  Container(
                              margin: EdgeInsets.only(left:20,right: 20,bottom: 20),
                                alignment: Alignment.topRight,
                                child: Text(LanguageProvider.Llanguage('myrequest'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
*/
                                /*  Row(
                              children: [
                                Spacer(),
                                Column(children: [
                                  Text(LanguageProvider.Llanguage('leaverequest'),style: TextStyle(fontSize: 18,),),
                                  Text('3',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:  themep.themeMode.primaryColor),),
                                ],),
                                Spacer(),

                                Column(children: [
                                  Text(LanguageProvider.Llanguage('vacationrequest'),style: TextStyle(fontSize: 18,),),
                                  Text('2',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:  themep.themeMode.primaryColor),),
                                ],),
                                Spacer(),

                              ],
                            ),
*/
                                SizedBox(height: 15,),
                                Container(
                                  margin: EdgeInsets.only(left: 22,right: 22),
                                  child: Divider(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    thickness: 2,
                                  ),
                                ),

                                Container(
                                    margin: EdgeInsets.only(left:18,right: 18,bottom: 10,top: 20),
                                    alignment: LanguageProvider.langg=='AR'?Alignment.topRight:Alignment.topLeft,
                                    child: Text(LanguageProvider.Llanguage('timeline'),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),


                                FixedTimeline.tileBuilder(
                                  builder: TimelineTileBuilder.connectedFromStyle(
                                    contentsAlign: ContentsAlign.alternating,
                                    oppositeContentsBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: Text(timelinestr[index],style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                    contentsBuilder: (context, index) => /*Card(
                                  child:*/ Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: Text(timelindate[index],style: TextStyle(fontSize: 16),),
                                    ),
                                    //),
                                    connectorStyleBuilder: (context, index) => ConnectorStyle.dashedLine,
                                    indicatorStyleBuilder: (context, index) => IndicatorStyle.outlined,
                                    itemCount: 5,
                                  ),
                                )

                              ],






                            ),
                        )   ;



                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
          ),
        ); },

    );

  }


}