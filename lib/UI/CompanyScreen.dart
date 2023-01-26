import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:provider/provider.dart';

import '../Provider/ThemeProvider.dart';

class CompanyScreen extends StatefulWidget {
  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  var check = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //double defaultSize = SizeConfig.defaultSize;
    final themep = context.watch<ThemeProvider>();
    return Scaffold(

     backgroundColor: themep.themeMode.backgroundColor,
      body: Center(
        child: Column(children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(33),
              width: 100,
                  child: Image(image: new AssetImage("assest/galaxylogo.png"),),
            ),
          ),
          Container(margin: EdgeInsets.all(10),
            child: Center(
                child: Text(textAlign: TextAlign.center,'Galaxy International Group is an information technology company established in 1992, with different')),
          )
        ],),
      ),
    );
  }}