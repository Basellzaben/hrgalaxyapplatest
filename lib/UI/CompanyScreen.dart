import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';

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
    return Scaffold(
     // backgroundColor: HexColor(Globalvireables.white2),
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