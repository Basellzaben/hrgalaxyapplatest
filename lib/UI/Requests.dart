import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../Models/WorkInfo.dart';
import '../Provider/LoginProvider.dart';
import '../Provider/languageProvider.dart';
import 'dart:math' as math;
class Requests extends StatefulWidget {
  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  var check = false;

  @override
  void dispose() {
    super.dispose();
  }
  int selectedRequests = 0;

  Future<List<WorkInfo>> getWorkInfos() async {
   try {
     var USER_ID = Provider.of<LoginProvider>(context, listen: false)
         .getUsername()
         .toString();
     Uri WorkInfoURL = Uri.parse(Globalvireables.workstateapi + USER_ID);

     Response res = await get(WorkInfoURL);
     if (res.statusCode == 200) {
       print("object11");

       List<dynamic> body = jsonDecode(res.body);
       if (body.toString().contains('error'))
         body = jsonDecode(
             '[{"Id":2,"Description":"  الدوام كامل","Count":9},{"Id":3,"Description":"التاخير الصباحي","Count":3},{"Id":4,"Description":"المغادرة باكرا","Count":0},{"Id":5,"Description":"  المهمات الرسمية","Count":0},{"Id":6,"Description":"عدم ختم بداية الدوام","Count":0},{"Id":7,"Description":"عدم ختم نهاية الدوام","Count":1},{"Id":10,"Description":"الدورات التدريبية","Count":0},{"Id":1,"Description":"غياب بدون عذر","Count":2},{"Id":8,"Description":"عدد ايام الاجازات","Count":0},{"Id":9,"Description":"ايام العمل الفعلية","Count":9},{"Id":10,"Description":" نسبة ايام العمل الفعلية","Count":40}]');

       List<WorkInfo> WorkInfos = body
           .map(
             (dynamic item) => WorkInfo.fromJson(item),
       ).toList();

       if (WorkInfos.length < 1) {
         body = jsonDecode(
             '[{"Id":2,"Description":"  الدوام كامل","Count":9},{"Id":3,"Description":"التاخير الصباحي","Count":3},{"Id":4,"Description":"المغادرة باكرا","Count":0},{"Id":5,"Description":"  المهمات الرسمية","Count":0},{"Id":6,"Description":"عدم ختم بداية الدوام","Count":0},{"Id":7,"Description":"عدم ختم نهاية الدوام","Count":1},{"Id":10,"Description":"الدورات التدريبية","Count":0},{"Id":1,"Description":"غياب بدون عذر","Count":2},{"Id":8,"Description":"عدد ايام الاجازات","Count":0},{"Id":9,"Description":"ايام العمل الفعلية","Count":9},{"Id":10,"Description":" نسبة ايام العمل الفعلية","Count":40}]');

         WorkInfos = body
             .map(
               (dynamic item) => WorkInfo.fromJson(item),
         ).toList();
       }


       return WorkInfos;
     } else {
       throw "Unable to retrieve WorkInfos.";
       print("object");
     }
   }catch(_){

     List<dynamic> body = jsonDecode(
         '[{"Id":2,"Description":"  الدوام كامل","Count":9},{"Id":3,"Description":"التاخير الصباحي","Count":3},{"Id":4,"Description":"المغادرة باكرا","Count":0},{"Id":5,"Description":"  المهمات الرسمية","Count":0},{"Id":6,"Description":"عدم ختم بداية الدوام","Count":0},{"Id":7,"Description":"عدم ختم نهاية الدوام","Count":1},{"Id":10,"Description":"الدورات التدريبية","Count":0},{"Id":1,"Description":"غياب بدون عذر","Count":2},{"Id":8,"Description":"عدد ايام الاجازات","Count":0},{"Id":9,"Description":"ايام العمل الفعلية","Count":9},{"Id":10,"Description":" نسبة ايام العمل الفعلية","Count":40}]');

     List<WorkInfo> WorkInfos = body
         .map(
           (dynamic item) => WorkInfo.fromJson(item),
     ).toList();
     return WorkInfos;

   }
  }
  @override
  Widget build(BuildContext context) {
    var lang = Provider.of<Language>(context, listen: false);
    return Scaffold(
      backgroundColor: HexColor(Globalvireables.white2),
      //appBar: null,
        body:FutureBuilder(
        future: getWorkInfos(),
    builder: (BuildContext context, AsyncSnapshot<List<WorkInfo>> snapshot) {
    if (snapshot.hasData) {
    List<WorkInfo>? WorkInfos = snapshot.data;
    return  Column(
        children: [
          SafeArea(
           // padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10),
                child: Align(
                    alignment: lang.getLanguage()=='AR'?Alignment.topRight:Alignment.topLeft,
                    child: Text(lang.Llanguage('workingstate'),style: TextStyle(fontSize: 20),)
                )
            ),

          ),

    Expanded(
      child: ListView(
                children: WorkInfos!
                    .map(
                (WorkInfo WorkInfo) => Container(
                    padding: EdgeInsets.all(15),
                    color: HexColor(Globalvireables.white),
                    width: MediaQuery.of(context).size.width/1.1,
                    height: MediaQuery.of(context).size.height/WorkInfos.length,
                    child: Row(
                      children: <Widget>[
                     /*   Container(
                          width:100,
                          height: 100,
                          color:HexColor(Globalvireables.basecolor),
                          child: Center(
                            child: Text(
                              WorkInfo.count.toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 17),
                            ),),),

*/
                        Container(
                          width:100,
                          height: 100,
                          child: MaterialButton(
                            onPressed: () {},
                            elevation: 1.0,
                            hoverElevation: 0,
                            focusElevation: 0,
                            highlightElevation: 0,
                            color: HexColor(Globalvireables.basecolor),
                            textColor: Colors.white,
                            child:Text(
        WorkInfo.count.toString(),
        textAlign: TextAlign.right,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 17),
        ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ),


                        Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                WorkInfo.description,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),
                              )),)
                      ],
                    )
                ),
                )
                    .toList(),
                ),
    ),






        ],
      );
    } else {
    return Center(child: CircularProgressIndicator());
    }
    },
    ),
     /* body: Center(
       child: Column(children: [
         SizedBox(height: 40,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
               child: Align(
                   alignment: lang.getLanguage()=='AR'?Alignment.topRight:Alignment.topLeft,
                   child: Text(lang.Llanguage('workingstate'),style: TextStyle(fontSize: 20),)
               )
           ),

         ),
         SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.all(9.0),
           child: Row(
             children: [
               Container(height: 60,width: 60,color: Colors.green,
               child: Center(child: Text('33',style: TextStyle(color: Colors.white),)),
               )
               , Spacer(),
               Text('ايام الدوام الفعليه',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
             ],

           ),
         )


       ],),
      )*/);}}

