import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:hrgalaxyapplatest/Provider/UserProvider.dart';
import 'package:hrgalaxyapplatest/UI/Leave_Request.dart';
import 'package:hrgalaxyapplatest/UI/VacationScreen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
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
  int selectedIndex = 0;
  Future<Personalinfo> getUserInfo() async {
    try{
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

    }
    var  jsonResponse= jsonDecode('{"EmployeeDisplayName":"باسل خلف جليل خلف","JobTitle":"مبرمج","EmployeeDepartmentDescription":"الادارة العامة","EmployeeSectionDescription":"قسم الدعم الفني","ManagerName":"جهاد عبد الكريم عبد الله السعدي","Education_Desc":"-","AttStatus":"دوام","YearsOfExp":"1 سنة 9 شهر ","Email":""}');
    var username = Personalinfo.fromJson(jsonResponse);

    return username;


  }
  @override
  Widget build(BuildContext context) {
    var LoginP = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
       // backgroundColor:HexColor(Globalvireables.white2),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assest/back5.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: FutureBuilder<Personalinfo>(
        future: getUserInfo(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    var data = snapshot.data;
try {
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
}catch(_){

}

           return Container(
           // color: HexColor(Globalvireables.white2),
            /* decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assest/back5.png"),
                 fit: BoxFit.cover,
               ),
             ),*/
                child: SafeArea(
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
                              Spacer(),

                              //  Icon(Icons.person,color: Colors.white,size: 70,),
                              Text(data!.EmployeeDisplayName??'',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),

                              MaterialButton(
                                onPressed: () {},
                                elevation: 0.0,
                                hoverElevation: 0,
                                focusElevation: 0,
                                highlightElevation: 0,
                                color: HexColor(Globalvireables.basecolor),
                                textColor: Colors.white,
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

                        Container(
                          margin: EdgeInsets.only(left: 10,right: 10,top: 15),
                          width: MediaQuery.of(context).size.width/1.1,
                          height: MediaQuery.of(context).size.height/5,
child: Card(child: Row(children: [
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
        textColor: Colors.white,
        elevation: 0.0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        child: Icon(
          Icons.holiday_village,
          size: 24,
        ),
        padding: EdgeInsets.all(16),
        shape: CircleBorder(),
      ),
      // Image(image: new AssetImage("assest/holy.png"),height: 40,width: 40,),
      Text('طلب اجازه',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black)),
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
            textColor: Colors.white,
            child: Icon(
              Icons.fingerprint,
              size: 24,
            ),
            padding: EdgeInsets.all(16),
            shape: CircleBorder(),
          ),
         // Image(image: new AssetImage("assest/finger2.png"),height: 40,width: 40,),
          Text('البصمه',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black)),
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
          textColor: Colors.white,
          child: Icon(
            Icons.outbond,
            size: 24,
          ),
          padding: EdgeInsets.all(16),
          shape: CircleBorder(),
        ),
       // Image(image: new AssetImage("assest/leave.png"),height: 40,width: 40,),
        Text('طلب مغادره',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black)),
        Spacer(),
      ],),
    ),
  )







],),),),






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



                      SizedBox(height: 22,),
                      Column(children: [
                        Text('وقت الحضور اليوم',style: TextStyle(fontSize: 18,),),
                        Text('8:13:00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        Text('وقت نهايه الدوام المفترض',style: TextStyle(fontSize: 18,),),
                        Text('17:00:00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                        ,
                        SizedBox(height: 15,),
                        Text('وقت الانصراف السابق',style: TextStyle(fontSize: 18,),),
                        Text('17:03:00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)

                      ],)

                      ,
                      SizedBox(height: 20,),

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
        );

  }}