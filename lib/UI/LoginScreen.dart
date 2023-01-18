import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrgalaxyapplatest/Provider/LoginProvider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../AuthenticationService/LocalAuthApi.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'FngetPrint.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  var check = false;
  final LocalAuthentication localAuth = LocalAuthentication();
  late bool canCheckBiometrics;
  late List<BiometricType> availableBiometrics;
  var RE=false;

  
  @override
  void initState() {
    // TODO: implement initState
    inisial();

    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var LoginP = Provider.of<LoginProvider>(context, listen: false);
    print(check.toString() +"  ccccheck");
    return Scaffold(
      backgroundColor: Colors.transparent,
      //appBar: null,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/back1.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:[



                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width/1,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(33.0),),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width/2.6,
                                  height: MediaQuery.of(context).size.width/2.6,
                                  child: Image(image: new AssetImage("assest/galaxylogo.png"))
                              ),
                            ),

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width/1.2,
                                margin: EdgeInsets.only(
                                    top: 22, bottom: 30),
                                color: HexColor(Globalvireables.white),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),


                                  child: Row(children: [
Spacer(),
                                    Text(
                                      "تسجيل الدخول باستخدام البصمه",
                                      style: TextStyle(
                                          color: HexColor(
                                              Globalvireables.black),
                                          fontSize: 20),
                                    ),
                                    Spacer(),
                                    Icon(Icons.fingerprint,color: Colors.black,)
                                  ],),
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();

    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('rememberme')) {
      setproviders();
                                    final isAuthenticated = await LocalAuthApi.authenticate();

                                    if (isAuthenticated) {
                                       Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));}else{

                                      Fluttertoast.showToast(
                                          msg: 'ليس لديك الصلاحيات للدخول',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          textColor: Colors.white,
                                          fontSize: 16.0);


                                    }
                                    }else{
      Fluttertoast.showToast(
          msg: 'ليس لديك الصلاحيات للدخول',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          fontSize: 16.0);
                                    }

                                  },
                                ),
                              ),
                            ),


                            Center(
                              child: Text(
                                "او",
                                style: TextStyle(
                                    color: HexColor(
                                        Globalvireables.black),
                                    fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                            ),

                            Container(
                                margin: EdgeInsets.only(
                                    left: 25, right: 25, top: 30),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email,color: HexColor(Globalvireables.basecolor),),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: HexColor(
                                                Globalvireables
                                                    .basecolor),
                                            width: 0.0),
                                        borderRadius:
                                        BorderRadius.circular(
                                            10.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 0.0),
                                        borderRadius:
                                        BorderRadius.circular(
                                            10.0)),
                                    contentPadding: EdgeInsets.only(
                                        top: 18,
                                        bottom: 18,
                                        right: 20,
                                        left: 20),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'رقـم الموظف',
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 25, right: 25, top: 44),
                                child: TextField(
                                  controller: _passController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.password_sharp,color: HexColor(Globalvireables.basecolor)),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: HexColor(
                                                Globalvireables
                                                    .basecolor),
                                            width: 0.0),
                                        borderRadius:
                                        BorderRadius.circular(
                                            10.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 0.0),
                                        borderRadius:
                                        BorderRadius.circular(
                                            10.0)),
                                    contentPadding: EdgeInsets.only(
                                        top: 18,
                                        bottom: 18,
                                        right: 20,
                                        left: 20),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'كـلمة المرور',
                                  ),
                                )),

                            Container(
                              margin: EdgeInsets.only(left: 10,right: 10,top: 4),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Text("استخدام البصمه",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                          MediaQuery.of(context)
                                              .size
                                              .width >
                                              600
                                              ? 22
                                              : 15)),
                                  Checkbox(
                                      value: check,
                                      //set variable for value
                                      onChanged: (bool? value) async {
                                        setState(() {
                                          check = !check;
                                          //Provider.of<LoginProvider>(context, listen: false).setRemember(check);
                                       //   saveREstate(check.toString());
                                        });
                                      }),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 50,
                                width: 240,
                                margin: EdgeInsets.only(
                                    top: 60, bottom: 30),
                                color: HexColor(Globalvireables.white),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: HexColor(
                                        Globalvireables.basecolor),
                                  ),
                                  child: Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
                                        color: HexColor(
                                            Globalvireables.white),
                                        fontSize: 22),
                                  ),
                                  onPressed: () async {
                                 Login(context);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  /*Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width/6,
                    height: MediaQuery.of(context).size.width/6,
                    child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10.0),),
                          color: HexColor(Globalvireables.basecolor),
                          child: Column(
                              children: [

                                Expanded(
                                  child: Container(width: MediaQuery.of(context).size.width/6,
                                      height: MediaQuery.of(context).size.width/6,
                                      child: Image(image: new AssetImage("assest/faceid.png"))),
                                )
                              ])),
                  )*/

                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
  Login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    showLoaderDialog(context);
    var LoginP = Provider.of<LoginProvider>(context, listen: false);

    Uri apiUrl = Uri.parse(Globalvireables.loginapi);
    final json = {
      "User_ID": _emailController.text,
      "User_Password": _passController.text
    };

    http.Response response = await http.post(apiUrl, body: json).whenComplete(() => {
      Navigator.pop(context),
    FocusScope.of(context).unfocus()

    });
    var jsonResponse =await jsonDecode(response.body);
    print(response.statusCode.toString()+" response.statusCode");
    if(response.statusCode==200){
      if(jsonResponse.toString().contains('1')){
        RememberFun(check);
        setState(() {
          Provider.of<LoginProvider>(context,listen: false).setPassword(_passController.text.toString());
          Provider.of<LoginProvider>(context,listen: false).setUsername(_emailController.text.toString());
          Provider.of<LoginProvider>(context,listen: false).setRemember(check);
          });

           Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(),));

      }else{
        Fluttertoast.showToast(
            msg: 'رقم الموظف او كلمه المرور خطا',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }else{
      Fluttertoast.showToast(
          msg: 'تاكد من اتصال الانترنت',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }

  RememberFun(bool check) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberme',check);
    if(check){
    prefs.setString('usename',_emailController.text);
    prefs.setString('password',_passController.text);}
    else{
      prefs.setString('usename','');
      prefs.setString('password','');
    }
  }

  inisial() async {
    availableBiometrics = await localAuth.getAvailableBiometrics();
    canCheckBiometrics = await localAuth.canCheckBiometrics;
    try{
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('rememberme') == true) {
      setState(() {
        check = true;
      });
      // UserNameControler.text = prefs.getString('userlogin')!;
      // UserPasswordControler.text = prefs.getString('passwordlogin')!;
    } else {
      check = false;

    }}catch(_){
      check = false;
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          Image.asset('assest/loading.gif', height: 100, width: MediaQuery.of(context).size.width/3),
          //CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text("جار تسجيل الدخول...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  setproviders() async {
    try{
      prefs = await SharedPreferences.getInstance();

      var username=prefs.getString('usename');
      var password=prefs.getString('password');
      print(username+"   usernameshared");
      Provider.of<LoginProvider>(context,listen: false).setUsername(username);
      Provider.of<LoginProvider>(context,listen: false).setPassword(password);
   }catch(_){
      check = false;
    }
  }



  checkInternet() async {
    bool connect=false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect=true;
      }
    } on SocketException catch (_) {
      print('not connected');
    }
    return connect;
  }

}
