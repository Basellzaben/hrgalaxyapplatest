import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:provider/provider.dart';

import '../Provider/UserProvider.dart';
import 'CompanyScreen.dart';
import 'PersonalScreen.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var check = false;

  @override
  void dispose() {
    super.dispose();
  }

  int selectedProfile = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.width / 3),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: HexColor(Globalvireables.basecolor),
              title: Container(
                child: Row(
                  children: [
                    Spacer(),
                    Center(
                      child: Text(
                        Provider.of<UserProvider>(context, listen: false).getname()??'',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: HexColor(Globalvireables.white2)),
                      ),
                    ),
                    Center(
                      child:Icon(Icons.person,color: Colors.white,size: 30,)
                    ),


                  ],
                ),
              ),
              bottom: TabBar(
                indicatorWeight: 6,
                indicatorColor: HexColor(Globalvireables.secondcolor),

                tabs: [
                  Tab(icon: Icon(Icons.person), text: "الملف الشخصي"),
                  Tab(icon: Icon(Icons.account_balance), text: "المؤسسة")
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              PersonalScreen(),
              CompanyScreen(),
            ],
          ),
        ),
      ),
    );
  }
/* @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(Globalvireables.white2),
      //appBar: null,
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(

            ),
            child: Column(
              children: [
                SizedBox(
                  height: 33,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assest/profile.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
       */ /*         Center(
                  child: Text(
                    'باسل خلف جليل خلف',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    'مبرمج',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                  ),
                ),*/ /*
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
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
                         Text(
                              'باسل خلف جليل خلف',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w200),
                            ),
                            Spacer(),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.person,color: Colors.black,),
                            )

                          */ /*  Text(
                              ': الادارة ',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w200),
                            ),*/ /*

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
                            Text(
                              'مبرمج',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w200),
                            ),
                            Spacer(),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.work_outline,color: Colors.black,),
                            )

                            */ /*  Text(
                              ': الادارة ',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w200),
                            ),*/ /*

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
                            Text(
                              'الادارة العامة',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),


                              Text(
                              ': الادارة ',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w400),
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
                            Text(
                              'قسم الدعم الفني',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),


                              Text(
                              ': القسم ',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w400),
                            ),

                          ],)
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }*/
}
