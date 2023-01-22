import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:hrgalaxyapplatest/Provider/UserProvider.dart';
import 'package:hrgalaxyapplatest/Provider/languageProvider.dart';
import 'package:hrgalaxyapplatest/UI/Leave_Request.dart';
import 'package:hrgalaxyapplatest/UI/VacationScreen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Personalinfo.dart';
import '../Provider/LoginProvider.dart';
import 'FngetPrint.dart';
import 'LoginScreen.dart';

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
  var prefs;
  int selectedIndex = 0;
  Future<Personalinfo> getUserInfo() async {
     prefs = await SharedPreferences.getInstance();

    /*  try{
    var USER_ID=Provider.of<LoginProvider>(context, listen: false).getUsername().toString();
    Uri apiUrl = Uri.parse(Globalvireables.personalinfoapi+USER_ID);
    print(Globalvireables.personalinfoapi+USER_ID   +"  link");
    http.Response response = await http.get(apiUrl);

    var jsonResponse = jsonDecode(response.body);
    // var parsedJson = json.decode(jsonResponse);

    print(jsonResponse.toString() +'jsonResponse');

if(jsonResponse.toString().contains('error'  ))
    jsonResponse= jsonDecode('{"EmployeeDisplayName":"باسل خلف جليل خلف","JobTitle":"مبرمج","EmployeeDepartmentDescription":"الادارة العامة","EmployeeSectionDescription":"قسم الدعم الفني","ManagerName":"جهاد عبد الكريم عبد الله السعدي","Education_Desc":"-","AttStatus":"دوام","YearsOfExp":"1 سنة 9 شهر ","Email":""}');

    var username = Personalinfo.fromJson(jsonResponse);

    if(username.JobTitle.isEmpty)
{
  jsonResponse= jsonDecode('{"EmployeeDisplayName":"باسل خلف جليل خلف","JobTitle":"مبرمج","EmployeeDepartmentDescription":"الادارة العامة","EmployeeSectionDescription":"قسم الدعم الفني","ManagerName":"جهاد عبد الكريم عبد الله السعدي","Education_Desc":"-","AttStatus":"دوام","YearsOfExp":"1 سنة 9 شهر ","Email":""}');
  username = Personalinfo.fromJson(jsonResponse);
  return username;

}}catch(_){
    var  jsonResponse= jsonDecode('{"EmployeeDisplayName":"باسل خلف جليل خلف","JobTitle":"مبرمج","EmployeeDepartmentDescription":"الادارة العامة","EmployeeSectionDescription":"قسم الدعم الفني","ManagerName":"جهاد عبد الكريم عبد الله السعدي","Education_Desc":"-","AttStatus":"دوام","YearsOfExp":"1 سنة 9 شهر ","Email":""}');
     var username = Personalinfo.fromJson(jsonResponse);
      return username;

    }*/
    var  jsonResponse= jsonDecode('{"EmployeeDisplayName":"باسل خلف الزبن","JobTitle":"مبرمج","EmployeeDepartmentDescription":"الادارة العامة","EmployeeSectionDescription":"قسم الدعم الفني","ManagerName":"جهاد عبد الكريم عبد الله السعدي","Education_Desc":"-","AttStatus":"دوام","YearsOfExp":"1 سنة 9 شهر ","Email":""}');
    var username = Personalinfo.fromJson(jsonResponse);

    return username;


  }
  @override
  Widget build(BuildContext context) {
    var LoginP = Provider.of<LoginProvider>(context, listen: false);
    var LanguageProvider = Provider.of<Language>(context, listen: false);

    return Scaffold(
     /* appBar: AppBar(title: Text(
        LanguageProvider.Llanguage('Home').toString(),
        *//*   textDirection: TextDirection.ltr*//*),
        backgroundColor: HexColor(Globalvireables.basecolor),
        leading: IconButton(
          icon: Icon(Icons.logout_sharp, color: Colors.white),
          onPressed: () =>
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(LanguageProvider.Llanguage('wanttologout')),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ), (Route<dynamic> route) => false);

                      },
                      child: Text('نعم'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text('لا'),
                    ),
                  ],
                ),
              )

        ),
        // goBackToPreviousScreen();
      ),*/
       // backgroundColor:HexColor(Globalvireables.white2),
        body: SafeArea(
          child: Container(
           // color: HexColor(Globalvireables.white2),
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
}

             return Container(
            //  color: HexColor(Globalvireables.white2),
              /* decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("assest/back5.png"),
                   fit: BoxFit.cover,
                 ),
               ),*/
                  child: SafeArea(
                    child: Column(
                      children: [
                        Card(
                          child: Container(
                            alignment: Alignment.topRight,
                            width: MediaQuery.of(context).size.width/1.1,


                              child: Container(
                                padding: EdgeInsets.all(5),
                                color: Colors.transparent,
                                alignment: Alignment.topRight,
                                  child: Row(children: [
                                    //  Icon(Icons.person,color: Colors.white,size: 70,),

                                    IconButton(
                                        icon: Icon(Icons.notifications, color: Colors.redAccent),
                                        onPressed: () =>
                                        {
                                        Fluttertoast.showToast(
                                        msg: 'لا يوجد اشعارات حاليا',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        textColor:HexColor(Globalvireables.white),
                                        fontSize: 16.0)
                                        }),


Spacer(),

                                    Text(Provider.of<UserProvider>(context, listen: false).getname()??'',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

                                    MaterialButton(
                                      onPressed: () {},
                                      elevation: 0.0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      color: HexColor(Globalvireables.basecolor),
                                      textColor: HexColor(Globalvireables.white),
                                      child: Icon(
                                        Icons.person,
                                        size: 20,
                                      ),
                                      padding: EdgeInsets.all(16),
                                      shape: CircleBorder(),
                                    ),
                                  ],),
                                  ),
                                  ),
                        ),

                          Container(
                            margin: EdgeInsets.only(left: 12,right: 12,bottom: 14),
                            color: HexColor(Globalvireables.white2),
                            child: Card(
                              child: Column(
                              children: [
                              Container(
                                decoration: BoxDecoration(
                                  color:prefs==null ?HexColor(Globalvireables.basecolor):prefs.getBool('isDark') ?
                                  Colors.white12:HexColor(Globalvireables.basecolor),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(0.0),
                                      bottomRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(0.0)),
                                ),
                                margin: EdgeInsets.only(left: 10,right: 10,top: 15),
                                width: MediaQuery.of(context).size.width/1.1,
                                height: MediaQuery.of(context).size.height/5,
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
            Icons.holiday_village,
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







],),),


                                Container(
                                  margin: EdgeInsets.all(20),
                                    alignment: Alignment.topRight,
                                    child: Text(LanguageProvider.Llanguage('vacations'), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),


Card(
  child:   Row(children: [
  Spacer(),
    Column(children: [
      Text(LanguageProvider.Llanguage('sickleave'), style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),)
  ,
      Text('3', style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold, color: HexColor(Globalvireables.basecolor)),)
  
    ],)
    , Spacer(),
     Spacer(),
    Column(children: [
      Text(LanguageProvider.Llanguage('sickleave'), style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
      Text('6', style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold, color: HexColor(Globalvireables.basecolor)),)
  
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


                        SizedBox(height: 22,),
                        Column(children: [
                              Text(LanguageProvider.Llanguage('Attendancetoday'),style: TextStyle(fontSize: 18,),),
                              Text('8:13:00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                             Text(LanguageProvider.Llanguage('defaultend'),style: TextStyle(fontSize: 18,),),
                              Text('17:00:00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                              ,
                              SizedBox(height: 15,),
                             Text(LanguageProvider.Llanguage('previoustime'),style: TextStyle(fontSize: 18,),),
                              Text('17:03:00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)

                        ],)

                        ,
                        SizedBox(height: 20,),


                        ]),
                            ),
                          ),


                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width/1.1,
                            margin: EdgeInsets.only(
                                top: 22, bottom: 30),
                            color: HexColor(Globalvireables.white),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: HexColor(Globalvireables.white),
                                ),
                                child: Row(children: [
                                  Spacer(),
                                  Text(
                                    "المهام",
                                    style: TextStyle(
                                        color: HexColor(
                                            Globalvireables.black),
                                        fontSize: 15),
                                  ),
                                  Spacer(),
                                  Icon(Icons.task_alt,color: Colors.green,)
                                ],),
                                onPressed: () async {
                                  Fluttertoast.showToast(
                                      msg: 'لا يتوفر لديك مهام الان',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      textColor: HexColor(Globalvireables.white),
                                      fontSize: 16.0);
                                }

                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left:20,right: 20,bottom: 20),
                            alignment: Alignment.topRight,
                            child: Text(LanguageProvider.Llanguage('myrequest'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                        Row(
                          children: [
                            Spacer(),
                            Column(children: [
                              Text(LanguageProvider.Llanguage('leaverequest'),style: TextStyle(fontSize: 18,),),
                              Text('3',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: HexColor(Globalvireables.basecolor)),),
                            ],),
                            Spacer(),

                            Column(children: [
                              Text(LanguageProvider.Llanguage('vacationrequest'),style: TextStyle(fontSize: 18,),),
                              Text('2',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: HexColor(Globalvireables.basecolor)),),
                            ],),
                            Spacer(),

                          ],
                        )



                      ],






    ),
                  ),
                );



      } else {
      return Center(child: CircularProgressIndicator());
      }
    }),
    ),
            ),
        ),
        );

  }}