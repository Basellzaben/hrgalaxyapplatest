import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:hrgalaxyapplatest/UI/Settings.dart';
import 'package:provider/provider.dart';

import '../Provider/languageProvider.dart';
import 'Index.dart';
import 'Profile.dart';
import 'Requests.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var check = false;

  @override
  void dispose() {
    super.dispose();
  }
  int selectedIndex = 0;

  final List<Widget> nav = [
    Index(),
    Requests(),
    Profile(),
    Settings(),

  ];
  @override
  Widget build(BuildContext context) {
    var LanguageProvider = Provider.of<Language>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.transparent,
        //appBar: null,
        body: Center(
          child: nav.elementAt(selectedIndex),
        ),

      bottomNavigationBar: BottomNavigationBar(
           type: BottomNavigationBarType.fixed,

        selectedItemColor: HexColor(Globalvireables.basecolor),
        unselectedItemColor: Colors.grey,
        backgroundColor:HexColor(Globalvireables.white),
        items: [
          BottomNavigationBarItem(
            icon:  Icon(Icons.home,color: selectedIndex==0? HexColor(Globalvireables.basecolor):Colors.grey
              ,size:selectedIndex==0?21:26 ,),
            label: LanguageProvider.Llanguage('Home')),

          BottomNavigationBarItem(
            icon:  Icon(Icons.remove_from_queue,color: selectedIndex==1? HexColor(Globalvireables.basecolor):Colors.grey
              ,size:selectedIndex==1?21:26 ,),
            label: LanguageProvider.Llanguage('workingstate'),

          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.person,color: selectedIndex==2? HexColor(Globalvireables.basecolor):Colors.grey
              ,size:selectedIndex==2?21:26 ,),
            label: LanguageProvider.Llanguage('profile'),
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.settings,color: selectedIndex==3?HexColor(Globalvireables.basecolor): Colors.grey
              ,size:selectedIndex==3?21:26 ,),
            label:LanguageProvider.Llanguage('settings'),

          ),
        ],
        iconSize: 21,
        unselectedFontSize: 14,
        selectedFontSize: 18,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        selectedIconTheme: IconThemeData(color: HexColor(Globalvireables.basecolor)),
        onTap: _onItemTapped,
      )

    );}


_onItemTapped(int index) {
  setState(() {
    selectedIndex = index;
  });

}
}