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
class MyRequest extends StatefulWidget {
  @override
  State<MyRequest> createState() => _MyRequestState();
}

class _MyRequestState extends State<MyRequest> {
  var check = false;
  DateTime? selectedDate;
  DateTime? _selected;
  String month = '1';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.Llanguage('MyRequest')
              .toString(), /*   textDirection: TextDirection.ltr*/
        ),
        backgroundColor: themep.themeMode.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: HexColor(Globalvireables.white)),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          ),
        ),
        // goBackToPreviousScreen();
      ),
      backgroundColor: themep.themeMode.backgroundColor,
      body: Container(
        color: themep.themeMode.backgroundColor,
        child: Column(
          children: [

            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left:20,right: 20,bottom: 0,top: 20),
                      alignment: lang.langg=='AR'?Alignment.topRight:Alignment.topLeft,
                      child: Text(lang.Llanguage('vacations'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('22/1/2023',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                          Container(
                            alignment: Alignment.topRight,
                            child: Row(children: [
                              Spacer(),
                              Text(lang.Llanguage('acceptable')
              .toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                              Spacer(),
                              Spacer(),
                              Text(lang.Llanguage('sickleave'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Text('  -  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)


                            ],),
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('22/1/2023',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                        ],),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('01/1/2023',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                          Container(
                            alignment: Alignment.topRight,
                            child: Row(children: [
                              Spacer(),
                              Text(lang.Llanguage('pending'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.orange),),
                              Spacer(),
                              Spacer(),
                              Text(lang.Llanguage('annual'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Text('  -  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)


                            ],),
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('01/1/2023',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                        ],),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('24/12/2023',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                          Container(
                            alignment: Alignment.topRight,
                            child: Row(children: [
                              Spacer(),
                              Text(lang.Llanguage('rejected')
              .toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.red),),
                              Spacer(),
                              Spacer(),
                              Text(lang.Llanguage('sickleave'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Text('  -  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)
                            ],),
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('24/12/2023',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                        ],),
                      ),
                    ),
                  ),


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
                      margin: EdgeInsets.only(left:20,right: 20,bottom: 0,top: 20),
                      alignment: lang.langg=='AR'?Alignment.topRight:Alignment.topLeft,
                      child: Text(lang.Llanguage('departures'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('17/1/2023',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                          Container(
                            alignment: Alignment.topRight,
                            child: Row(children: [
                              Spacer(),
                              Text(lang.Llanguage('acceptable')
              .toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                              Spacer(),
                              Spacer(),
                              Text(lang.Llanguage('Leaving')
              .toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Text('     ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)


                            ],),
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('8:00 AM - 8:55 AM',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                        ],),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('14/1/2023',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                          Container(
                            alignment: Alignment.topRight,
                            child: Row(children: [
                              Spacer(),
                              Text(lang.Llanguage('acceptable')
              .toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                              Spacer(),
                              Spacer(),
                              Text(lang.Llanguage('Leaving')
              .toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Text('     ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)


                            ],),
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('11:00 AM - 2:33 PM',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                        ],),
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
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
