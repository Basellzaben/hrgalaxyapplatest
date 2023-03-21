import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:http/http.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import '../Models/WorkInfo.dart';
import '../Provider/LoginProvider.dart';
import '../Provider/ThemeProvider.dart';
import '../Provider/languageProvider.dart';
import 'dart:math' as math;

import 'Home.dart';
class Requests extends StatefulWidget {
  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  var check = false;
  DateTime? selectedDate;
  DateTime? _selected;
String month='1';
  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    _selected = DateTime.now();
    super.initState();
  }
  int selectedRequests = 0;

  Future<List<WorkInfo>> getWorkInfos() async {
    List<dynamic> body = jsonDecode(
        '[{"Id":2,"Description":"  الدوام كامل","Count":9},{"Id":3,"Description":"التاخير الصباحي","Count":3},{"Id":4,"Description":"المغادرة باكرا","Count":0},{"Id":5,"Description":"  المهمات الرسمية","Count":0},{"Id":6,"Description":"عدم ختم بداية الدوام","Count":0},{"Id":7,"Description":"عدم ختم نهاية الدوام","Count":1},{"Id":10,"Description":"الدورات التدريبية","Count":0},{"Id":1,"Description":"غياب بدون عذر","Count":2},{"Id":8,"Description":"عدد ايام الاجازات","Count":0},{"Id":9,"Description":"ايام العمل الفعلية","Count":9},{"Id":10,"Description":" نسبة ايام العمل الفعلية","Count":40}]');

    List<WorkInfo> WorkInfos = body
        .map(
          (dynamic item) => WorkInfo.fromJson(item),
    ).toList();
    return WorkInfos;
  /* try {
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

   }*/
  }
  @override
  Widget build(BuildContext context) {
    final themep = context.watch<ThemeProvider>();

    var lang = Provider.of<Language>(context, listen: false);
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    return Scaffold(
      backgroundColor: themep.themeMode.backgroundColor,

      appBar:AppBar(title: Text(
        LanguageProvider.Llanguage('workingstate').toString(),
        /*   textDirection: TextDirection.ltr*/),
        backgroundColor:  themep.themeMode.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: HexColor(Globalvireables.white)),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),),),
        // goBackToPreviousScreen();
      ),
     // backgroundColor: HexColor(Globalvireables.white2),
      //appBar: null,
        body:FutureBuilder(
        future: getWorkInfos(),
    builder: (BuildContext context, AsyncSnapshot<List<WorkInfo>> snapshot) {
    if (snapshot.hasData) {
    List<WorkInfo>? WorkInfos = snapshot.data;
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Align(
                    child: Container(
                        alignment: LanguageProvider.Align(),
                        margin: const EdgeInsets.only(
                            top: 18, left: 5, right: 5),

                        //  alignment: Alignment.center,
                        child: Row(children: [
                          Row(children: <Widget>[
    GestureDetector(
    onTap: () {
      _onPressed(context: context, locale: 'ar');
      },
                              child: Icon(Icons.date_range,
                                  size: 25,),
                            ),
                             Text(
                              '',
                              textDirection:
                              LanguageProvider.getDirection(),
                              style: new TextStyle(
                                fontSize: 15.0,
                                //#e7e7df
                              ),
                            ),
                          ]),
SizedBox(width: 10,),
                          Text(
                            _selected.toString().substring(0,11),
                            textDirection:
                            LanguageProvider.getDirection(),
                            style: new TextStyle(
                              fontSize: 15.0, //#e7e7df
                            ),
                          ),
                          Spacer(),


                          Text(
                            LanguageProvider.Llanguage('workinmonth'),
                            textDirection:
                            LanguageProvider.getDirection(),
                            style: new TextStyle(
                              fontSize: 15.0, //#e7e7df
                            ),
                          ),


                        ])),
                  ),
                ),
              ),
            ),
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Card(
       child: Container(
           height: MediaQuery.of(context).size.height/1.3,
           width: MediaQuery.of(context).size.width/1.1,
           child: ListView(
                          children: WorkInfos!
                              .map(
                          (WorkInfo WorkInfo) => Container(
                              padding: EdgeInsets.all(15),
                              //color: HexColor(Globalvireables.white),
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/WorkInfos.length,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width:100,
                                    height: 100,
                                    child: MaterialButton(
                                      onPressed: () {},
                                      elevation: 1.0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      color:  themep.themeMode.primaryColor,
                                      textColor: HexColor(Globalvireables.white),
                                      child:Text(
                  WorkInfo.count.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold, color: HexColor(Globalvireables.white),fontSize: 17),
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
  );}

  void handleReadOnlyInputClick(context) {

/*    showBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width,
          child: MonthPicker(
            selectedDate: DateTime(2022),
            firstDate: DateTime(2023),
            lastDate: DateTime.now(),
            onChanged: (val) {
              print(val);
              setState(() {
                month=val.month.toString();
              });
              Navigator.pop(context);
            },
          ),
        )
    );*/
  }
  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2023),
      locale: localeObj,
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}

