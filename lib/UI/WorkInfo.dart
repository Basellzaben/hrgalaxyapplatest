import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:hrgalaxyapplatest/Provider/LoginProvider.dart';
import 'package:hrgalaxyapplatest/UI/LoginScreen.dart';
import 'package:hrgalaxyapplatest/UI/LoginScreen.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Provider/ThemeProvider.dart';
import '../Provider/languageProvider.dart';
import 'Home.dart';

class WorkInfoScreen extends StatefulWidget {
  @override
  State<WorkInfoScreen> createState() => _WorkInfoScreenState();
}

class _WorkInfoScreenState extends State<WorkInfoScreen> {
  var check = false;
  DateTime? selectedDate;
  DateTime? _selected;
  String month='1';

  @override
  void initState() {
    _selected = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var LoginP = Provider.of<LoginProvider>(context, listen: false);
    final themep = context.watch<ThemeProvider>();
    var lang = Provider.of<Language>(context, listen: false);


    return Scaffold( appBar:AppBar(title: Text(
      lang.Llanguage('WorkInfoScreen').toString(),
      /*   textDirection: TextDirection.ltr*/),
      backgroundColor:  themep.themeMode.primaryColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: HexColor(Globalvireables.white)),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),),),
      // goBackToPreviousScreen();
    ),
      backgroundColor: themep.themeMode.backgroundColor,
      body: Container(
        color:    themep.themeMode.backgroundColor,
child: SingleChildScrollView(
  child: Column(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Align(
            child: Container(
                alignment: lang.Align(),
                margin: const EdgeInsets.only(
                    top: 18, left: 5, right: 5
                ),
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
                      lang.getDirection(),
                      style: new TextStyle(
                        fontSize: 15.0,
                        //#e7e7df
                      ),
                    ),
                  ]),
                  SizedBox(width: 10,),
                  Text(
                    _selected.toString().substring(0,11)??'',
                    textDirection:
                    lang.getDirection(),
                    style: new TextStyle(
                      fontSize: 15.0, //#e7e7df
                    ),
                  ),
                  Spacer(),
  
  
                  Text(
                    lang.Llanguage('workinmonth'),
                    textDirection:
                    lang.getDirection(),
                    style: new TextStyle(
                      fontSize: 15.0, //#e7e7df
                    ),
                  ),
  
  
                ])),
          ),
        ),
      ),
    ),
    
  SingleChildScrollView(
    child:   Column(children: [
     Padding(
       padding: const EdgeInsets.all(15),
       child: Card(
         child: Container
           (
           width: MediaQuery.of(context).size.width,
           height: 80,
    child: Row(children: [
        Container(width: 10,height: 120,color: themep.themeMode.primaryColor,),
    
        Column(children: [
    
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width/1.2,
            child: Row(children: [
              Spacer(),
              Row(
                children: [
                  Text('   ساعات',style: TextStyle(color: Colors.black45,fontSize: 14),),
                  Text('  8.55 ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                ],
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
              Text('الخميس ، 01 يونيو',style: TextStyle(fontSize: 18),),
            ],),
          ),
          Spacer(),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            child: Row(children: [
              Spacer(),
              Row(
                children: [
                  Text('       ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                  Text('  متاخر',style: TextStyle(color: Colors.black45,fontSize: 14),),
                ],
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
              Text('8:5:22 AM - 5:00:01 PM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),),
            ],),
          ),
          Spacer(),
    
    
        ],)
    ],),
    
    
    
         ),
    
    
       ),
     ),
      Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Card(
          child: Container
            (
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(children: [
              Container(width: 10,height: 120,color: themep.themeMode.primaryColor,),
    
              Column(children: [
    
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('   ساعات',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  0 ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('الاحد ، 01 يونيو',style: TextStyle(fontSize: 18),),
                  ],),
                ),
                Spacer(),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('       ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  الغياب بدون عذر',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('00:00:00 - 00:00:00 PM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),),
                  ],),
                ),
                Spacer(),
              ],)
            ],),
    
    
    
          ),
    
    
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Card(
          child: Container
            (
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(children: [
              Container(width: 10,height: 120,color: themep.themeMode.primaryColor,),
    
              Column(children: [
    
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('   ساعات',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  9.16 ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('الاثنين ، 05 يونيو',style: TextStyle(fontSize: 18),),
                  ],),
                ),
                Spacer(),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('       ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  دوام كامل',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('8:00:00 AM - 5:16:01 PM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),),
                  ],),
                ),
                Spacer(),
    
    
              ],)
            ],),
    
    
    
          ),
    
    
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Card(
          child: Container
            (
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(children: [
              Container(width: 10,height: 120,color: themep.themeMode.primaryColor,),
    
              Column(children: [
    
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('   ساعات',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  8.55 ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('الخميس ، 01 يونيو',style: TextStyle(fontSize: 18),),
                  ],),
                ),
                Spacer(),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('       ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  متاخر',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('8:5:22 AM - 5:00:01 PM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),),
                  ],),
                ),
                Spacer(),
    
    
              ],)
            ],),
    
    
    
          ),
    
    
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Card(
          child: Container
            (
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(children: [
              Container(width: 10,height: 120,color: themep.themeMode.primaryColor,),
    
              Column(children: [
    
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('   ساعات',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  8.55 ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('الخميس ، 01 يونيو',style: TextStyle(fontSize: 18),),
                  ],),
                ),
                Spacer(),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('       ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  متاخر',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('8:5:22 AM - 5:00:01 PM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),),
                  ],),
                ),
                Spacer(),
    
    
              ],)
            ],),
    
    
    
          ),
    
    
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Card(
          child: Container
            (
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(children: [
              Container(width: 10,height: 120,color: themep.themeMode.primaryColor,),
    
              Column(children: [
    
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('   ساعات',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  8.55 ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('الخميس ، 01 يونيو',style: TextStyle(fontSize: 18),),
                  ],),
                ),
                Spacer(),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('       ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  متاخر',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('8:5:22 AM - 5:00:01 PM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),),
                  ],),
                ),
                Spacer(),
    
    
              ],)
            ],),
    
    
    
          ),
    
    
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Card(
          child: Container
            (
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(children: [
              Container(width: 10,height: 120,color: themep.themeMode.primaryColor,),
    
              Column(children: [
    
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('   ساعات',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  8.55 ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('الخميس ، 01 يونيو',style: TextStyle(fontSize: 18),),
                  ],),
                ),
                Spacer(),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('       ',style: TextStyle(color: Colors.black45,fontSize: 14),),
                        Text('  متاخر',style: TextStyle(color: Colors.black45,fontSize: 14),),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Text('8:5:22 AM - 5:00:01 PM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),),
                  ],),
                ),
                Spacer(),
    
    
              ],)
            ],),
    
    
    
          ),
    
    
        ),
      ),
    
    ],),
  )
  
    
  ],),
),
       
      ),
    );
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
