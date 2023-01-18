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
    var USER_ID=Provider.of<LoginProvider>(context, listen: false).getUsername().toString();
    Uri WorkInfoURL = Uri.parse(Globalvireables.workstateapi+USER_ID);

    Response res = await get(WorkInfoURL);

    if (res.statusCode == 200) {
      print("object11");

      List<dynamic> body = jsonDecode(res.body);

      List<WorkInfo> WorkInfos = body
          .map(
            (dynamic item) => WorkInfo.fromJson(item),
      )
          .toList();

      return WorkInfos;
    } else {
      throw "Unable to retrieve WorkInfos.";
      print("object");
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
    return SingleChildScrollView(
      child: Column(
        children: [

          SafeArea(
            minimum: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Align(
                      alignment: lang.getLanguage()=='AR'?Alignment.topRight:Alignment.topLeft,
                      child: Text(lang.Llanguage('workingstate'),style: TextStyle(fontSize: 20),)
                  )
              ),

            ),
          ),
          Container(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
              children: WorkInfos!
                  .map(
              (WorkInfo WorkInfo) => ListTile(
              leading : Container(
                padding: EdgeInsets.all(10),
                color: HexColor(Globalvireables.white),
              width: MediaQuery.of(context).size.width/1,
              height: MediaQuery.of(context).size.height/WorkInfos.length,
              child: Row(
              children: <Widget>[
              Container(
              width:70,
              height: 100,
              color:HexColor(Globalvireables.basecolor),
              child: Center(
              child: Text(
              WorkInfo.count.toString(),
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 17),
              ),),),
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
              ),
              )
                  .toList(),
              ),
            ),
          ),
        ],
      ),
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

