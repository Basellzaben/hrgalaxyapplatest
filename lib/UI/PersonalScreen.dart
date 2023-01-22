import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:provider/provider.dart';

import '../Provider/UserProvider.dart';

class PersonalScreen extends StatefulWidget {
  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  var check = false;
String name='';
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    name= Provider.of<UserProvider>(context, listen: false).getname();
    return Scaffold(
      //backgroundColor: HexColor(Globalvireables.white2),
      //appBar: null,
      body: Container(
        child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 33,
                ),
              /*  Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assest/profile.png',
                    ),
                  ),
                ),*/
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
                    size: 65,
                  ),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    name??'',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    Provider.of<UserProvider>(context, listen: false).getjob()??'',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                  ),
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Card(
                      child: Column(
                        children: [

                          Row(children: [
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Provider.of<UserProvider>(context, listen: false).getdepdesc()??'',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),


                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ': الادارة ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                            ),

                          ],)
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Card(
                      child: Column(
                        children: [

                          Row(children: [
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Provider.of<UserProvider>(context, listen: false).getsection()??'',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),


                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ': القسم ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                            ),

                          ],)


                        ],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Card(
                      child: Column(
                        children: [

                          Row( mainAxisSize: MainAxisSize.max,children: [
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),

                            Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Flexible(
                                  child: Text(
                                      Provider.of<UserProvider>(context, listen: false).getmangername()??'',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                ),
                            ),


                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),

                            Container(
                              width: MediaQuery.of(context).size.width/3,
                              child: Flexible(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                        ': المسؤول المباشر',
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.w200),
                               ),
                                  ),
                            ),

                          ],)


                        ],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Card(
                      child: Column(
                        children: [

                          Row(children: [
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Provider.of<UserProvider>(context, listen: false).getworkstate()??'',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),


                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ': حالة الموظف ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                            ),

                          ],)


                        ],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Card(
                      child: Column(
                        children: [

                          Row(children: [
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Provider.of<UserProvider>(context, listen: false).getyears()??'',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),


                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ': عدد سنوات الخدمة ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                            ),

                          ],)


                        ],
                      ),
                    ),
                  ),
                ),


                Container(
                     margin:EdgeInsets.only(top: 20),child: Text(textAlign: TextAlign.center,'V 1.0.0'))

              ],
            ),

        ),
      ),
    );
  }}