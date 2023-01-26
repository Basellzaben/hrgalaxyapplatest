import 'dart:async';
import 'dart:convert';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:hrgalaxyapplatest/Provider/LocationProvider.dart';
import 'package:hrgalaxyapplatest/UI/Settings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import '../Models/LocationM.dart';
import '../Models/Time.dart';
import '../Provider/LoginProvider.dart';
import '../Provider/ThemeProvider.dart';
import 'Index.dart';
import 'Profile.dart';
import 'Requests.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class FngetPrint extends StatefulWidget {
  @override
  State<FngetPrint> createState() => _FngetPrintState();
}
var prefs;
bool transtype=true;
String IOType='I';
class _FngetPrintState extends State<FngetPrint> {
  var activecheck;
  double distanceInMeters = 0.0;
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
     // debugPrint(e);
    });
  }
  Future<Time> getTime() async {
    prefs = await SharedPreferences.getInstance();

    Uri apiUrl = Uri.parse(Globalvireables.urltime);
    http.Response response = await http.get(apiUrl);
    var jsonResponse = json.decode(response.body);
    print("mohh = " + jsonResponse);

    var parsedJson = json.decode(jsonResponse);
    var time = Time.fromJson(parsedJson);
    print("mohh = " + time.Date);
    return time;
  }
   getLocationCompany() async {
try {
  late Uri apiUrl = Uri.parse(Globalvireables.GetLocation);
  http.Response response = await http.get(apiUrl);
  late var jsonResponse = jsonDecode(response.body);
  print(jsonResponse.toString() + "jsonResponse");
  Provider.of<LocationProvider>(context, listen: false).setCLat(LocationM
      .fromJson(jsonResponse)
      .LAT ?? '0.00');
  Provider.of<LocationProvider>(context, listen: false).setCLong(LocationM
      .fromJson(jsonResponse)
      .LANG ?? '0.00');
  Provider.of<LocationProvider>(context, listen: false).setsaefdistance(
      LocationM
          .fromJson(jsonResponse)
          .Distination ?? '20.00');
}catch(_){}
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    activecheck = true;
  }
  var date, time;
  String timee = "00:00:00";
  String datee = "";
  bool fingeraccess=false;
  @override
  Widget build(BuildContext context) {
    final themep = context.watch<ThemeProvider>();

    DateTime now = DateTime.now();
    String formattedDate2 = DateFormat('EEE d MMM').format(now);

    String formattedDate = DateFormat('kk:mm:ss').format(now);
    timee=formattedDate;
    datee=formattedDate2;
    getLocationCompany();
    _getCurrentPosition();
    getDistanceBetwenINM( Provider.of<LocationProvider>(context, listen: false).getCLat()??'0.0'
        , Provider.of<LocationProvider>(context, listen: false).getCLong()??'0.0'
        ,  _currentPosition?.latitude??0.0,_currentPosition?.longitude??0.0);

    return Scaffold(
        backgroundColor: themep.themeMode.backgroundColor,

        body: /*StreamBuilder(
    stream: Stream.periodic(Duration(seconds: 1)).asyncMap((i) => getTime()),
    builder: (context, snapshot) {
    if (snapshot.hasData &&
    prefs != null *//*&& snapshot.data!.Timee.toString().length > 4*//*) {
    date = snapshot.data!.Date.toString();
    time = snapshot.data!.Timee.toString();
    if (snapshot.data!.Timee.toString().length > 4) {
    timee = snapshot.data!.Timee.toString();
    datee = snapshot.data!.Date.toString().substring(0, 10);
    }

    return*/ Stack(children: <Widget>[
    Image.asset(
    "assest/shape3.png",
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
    ),
    Scaffold(
    backgroundColor: Colors.transparent,
    body: Container(
    child: SingleChildScrollView(
    child: SingleChildScrollView(
    child: Container(
    child: Column(children: <Widget>[
    Row(
    children: [
    Container(
    margin: EdgeInsets.only(top: 80, left: 20),
    child: GestureDetector(
    onTap: () {
    setState(() {
      Navigator.of(context).pop();
    });
    },
    child: Icon(
    Icons.arrow_back_ios,
    size: 30.0,
    color: HexColor(Globalvireables.white),
    ))),
    Spacer(),
    Container(
    margin: EdgeInsets.only(top: 40, left: 5, right: 5),
    child: Text(
      transtype
    ? "تسجيل الدخول"
        : "تسجيل الخروج",
    style: TextStyle(
    color: HexColor(Globalvireables.white),
    fontSize: 33,
    fontWeight: FontWeight.w500),
    ),
    ),
      GestureDetector(
      onTap: () {


        setState(() {
          transtype=!transtype;
        });
      },
      child: Container(
      margin: EdgeInsets.only(top: 30, left: 10, right: 10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
      color:
      transtype
      ? (Colors.green)
          : (Colors.red),
      borderRadius: BorderRadius.circular(100)
      //more than 50% of width makes circle
      ),
        child: Icon(Icons.cached,color:                                   HexColor(Globalvireables.white)
          ,),
      ),
    )
    ],
    ),
    Row(
    children: [
    Spacer(),
    Container(
    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
    child: Text(
    datee,
    //   "الخميس - 22/8/2022",
    /* snapshot.data!.date_time_txt.toString().length > 26
                                ? snapshot.data!.date_time_txt
                                    .toString()
                                    .substring(0, 27)
                                : snapshot.data!.date_time_txt.toString(),*/
    style: TextStyle(
    color: HexColor(Globalvireables.white),
    fontSize: 18,
    ),
    ),
    ),
    ],
    ),
    Row(
    children: [
    Spacer(),

    Container(
    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
    child: SizedBox(
    width: MediaQuery.of(context).size.width / 1.3,
    ),
    ),

    ],
    ),
    Center(
    child: Container(
    decoration: BoxDecoration(
    color: HexColor(Globalvireables.white2),
    borderRadius:BorderRadius.all(Radius.circular(77))),
    margin: EdgeInsets.only(top: 100),
    height: MediaQuery.of(context).size.height / 1.5,
    width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(
    child: Column(
    children: [
    Center(
    child: Container(
    margin: EdgeInsets.only(top: 10),
    child: Text(
    timee,
//atkinsonHyperlegible
    style: GoogleFonts.asar(
    textStyle: Theme.of(context)
        .textTheme
        .displayMedium,
    fontSize: 50,
    fontWeight: FontWeight.w800,
    color:
    themep.themeMode.backgroundColor),
    ),
    ),
    ),
    Center(
    child: Container(
    child: Container(
    margin: EdgeInsets.only(top: 30, left: 20),
    child: fingeraccess ?GestureDetector(
    onTap: () {
    setState(() {
    if (activecheck &&
    !(time.toString() == "00:00:00")) {
   // checWork();
    } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
    content: Text(
    "يجب الانتظار لحين جلب الوقت..."),
    ));
    }
    });
    },
    child: GestureDetector(
    onTap: () {
      if(transtype)
        CheckInCheckOut('1');
        else
      CheckInCheckOut('O');},
      child: Container(
        margin: EdgeInsets.only(top: 49),
        child: Icon(
        Icons.fingerprint,
        size: 200.0,
        color: transtype
            ? (Colors.green)
            : (Colors.red),
        ),
      ),
    )

    ):

    GestureDetector(
    onTap: () {
      Fluttertoast.showToast(
          msg: 'يجب ان تكون ضمن نطاق المسافه المسموح بها '
          ,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: HexColor(Globalvireables.white),
          fontSize: 16.0);
    },
        child: Container(
          child: Column(
            children: [
              Icon(
                Icons.fingerprint,
                size: 200.0,
                color: (Colors.black12),
              ),
              Text('يجب ان تكون ضمن نطاق المسافه المسموح بها وهي '+Provider.of<LocationProvider>(context, listen: false).getsaefdistance()+' متر '
              ),
            ],
          ),

        ),
      ),
    ),
    ),
    ),

    Center(
    child: Container(
    margin: EdgeInsets.only(top: 20),
    child: Container(
    child: Text(
    prefs.getString('TransType').toString() ==
    "1"
    ? " "
        : "  ",
    style: TextStyle(
    color: HexColor(
    Globalvireables.basecolor),
    fontSize: 30,
    fontWeight: FontWeight.bold),
    ),
    ),
    ),
    )

    ],
    ),
    ),
    ),
    )
    ]))))))
    ])
    /*} else {
    return Stack(children: <Widget>[
    Image.asset(
    "assest/shape3.png",
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
    ),
    Scaffold(
    backgroundColor: Colors.transparent,
    body: Container(
    child: SingleChildScrollView(
    child: SingleChildScrollView(
    child: Container(
    child: Column(children: <Widget>[
    Row(
    children: [
    Container(
    margin: EdgeInsets.only(top: 30, left: 20),
    child: GestureDetector(
    onTap: () {
    setState(() {
    Navigator.of(context).pop();
    });
    },
    child: Icon(
    Icons.arrow_back_ios,
    size: 30.0,
    color: HexColor(Globalvireables.white),
    ))),
    Spacer(),
    Container(
    margin: EdgeInsets.only(top: 25, left: 5, right: 5),
    child: Text(
    "الدوام",
    style: TextStyle(
    color: HexColor(Globalvireables.white),
    fontSize: 33,
    fontWeight: FontWeight.w500),
    ),
    ),
    Container(
    margin: EdgeInsets.only(top: 25, left: 10, right: 10),
    height: 30,
    width: 30,
    decoration: BoxDecoration(
    color:  themep.themeMode.primaryColor,
    borderRadius: BorderRadius.circular(100)
    //more than 50% of width makes circle
    ),
    )
    ],
    ),
    Row(
    children: [
    Spacer(),
    Container(
    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
    child: Text(
    //   "الخميس - 22/8/2022",
    "",
    style: TextStyle(
    color: HexColor(Globalvireables.white),
    fontSize: 18,
    ),
    ),
    ),
    ],
    ),
    Row(
    children: [
    Spacer(),
    Container(
    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
    child: SizedBox(
    width: MediaQuery.of(context).size.width / 1.3,
    child: Text(
    '',
    style: TextStyle(
    color: HexColor(Globalvireables.white),
    fontSize: 18,
    ),
    ),
    ),
    ),
    ],
    ),
    Center(
    child: Container(
    decoration: BoxDecoration(
    color: HexColor(Globalvireables.white),
    borderRadius:
    BorderRadius.all(Radius.circular(77))),
    margin: EdgeInsets.only(top: 100),
    height: MediaQuery.of(context).size.height / 1.5,
    width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(
    child: Column(
    children: [
    Center(
    child: Container(
    margin: EdgeInsets.only(top: 10),
    child: Text(
    "00:00:00",
//atkinsonHyperlegible
    style: GoogleFonts.asar(
    textStyle: Theme.of(context)
        .textTheme
        .displayMedium,
    fontSize: 50,
    fontWeight: FontWeight.w800,
    color: HexColor(
    Globalvireables.basecolor)),
    ),
    ),
    ),
    Center(
    child: Container(
    child: Container(
    margin: EdgeInsets.only(top: 10),
    child: Container(
    margin: EdgeInsets.all(20),
    child: Center(
    child:
    Column(
    children: [

    CircularProgressIndicator(),
    ],
    )))),
    ),
    ),
    Center(
    child: Container(
    margin: EdgeInsets.only(top: 20),
    child: Container(
    child: Text(
    "جاري الاتصال بالشبكه",
    style: TextStyle(
    color: HexColor(
    Globalvireables.basecolor),
    fontSize: 30,
    fontWeight: FontWeight.bold),
    ),
    ),
    ),
    )
    ],
    ),
    ),
    ),
    )
    ]))))))
    ]);
    }
    }),*/


    );}

getDistanceBetwenINM(String latc,String longc,double lat,double long){
  distanceInMeters = GeolocatorPlatform.instance.
  distanceBetween(
      double.parse(latc), double.parse(longc), lat, long)-10;
  fingeraccess=distanceInMeters<=double.parse(Provider.of<LocationProvider>(context, listen: false).getsaefdistance());

  print('distanceInMeters = '+distanceInMeters.toString());
  print('LocationProviderdistanceInMeters = '+Provider.of<LocationProvider>(context, listen: false).getsaefdistance().toString());
  print('latc = '+latc.toString());
  print('longc = '+longc.toString());

  print('lat = '+lat.toString());
  print('long = '+long.toString());

  ////////
  if(Provider.of<LoginProvider>(context, listen: false).getUsername()=='23')
    fingeraccess=true;
  ////////
}


CheckInCheckOut(String IO) async {
  //  O check out
  //  1 check in
  var apiUrl = Uri.parse(Globalvireables.check);
  showLoaderDialog(context);
  final json = {
    "Emp_NO": Provider.of<LoginProvider>(context, listen: false).getUsername().toString(),
    "Check_Type": IO,
    "Check_Time": "08/02/2021"
  };
  http.Response response = await http.post(apiUrl, body: json).whenComplete(() => {
  Navigator.of(context).pop()
  });

  var jsonResponse = jsonDecode(response.body);
  if(response.statusCode==200) {
    if(jsonResponse.toString().contains('1')){
      Fluttertoast.showToast(
          msg: 'تم تسجيل الحركة بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: HexColor(Globalvireables.white),
          fontSize: 16.0);
    }else{
      Fluttertoast.showToast(
          msg: 'يوجد مشكله ، حاول مره اخرى',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: HexColor(Globalvireables.white),
          fontSize: 16.0);
    }
  }else{
    Fluttertoast.showToast(
        msg: 'تاكد من اتصال الانترنت',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: HexColor(Globalvireables.white),
        fontSize: 16.0);
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


}
