import 'package:device_preview/device_preview.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:hrgalaxyapplatest/Provider/LoginProvider.dart';
import 'package:hrgalaxyapplatest/Provider/ThemeProvider.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Provider/LocationProvider.dart';
import 'Provider/UserProvider.dart';
import 'Provider/languageProvider.dart';
import 'UI/LoginScreen.dart';
String language='';
bool Remember = false;
String username = 'nn';
String password = 'nn';

Future<void> main() async {
  //final prefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Language>(create: (_) => Language()),
      ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ChangeNotifierProvider<LocationProvider>(create: (_) => LocationProvider()),
      ChangeNotifierProvider<ThemeProvider>(
              create: (_) => ThemeProvider(false)
          ),

    ],
    child:DevicePreview(enabled: true,builder:(context)=> const MyApp(),)
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  SetLanguage(BuildContext context) async {
    var language;
    SharedPreferences pref =
    await SharedPreferences.getInstance();
    language=pref.get('language') ?? 'AR';
    if(language==null ||language.isEmpty){
      language='AR';
    }
    pref.setString('language', language);
    Provider.of<Language>(context, listen: false)
        .setLanguage(language);
    print(language +" laaan");}
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SetLanguage(context);
    final themep = context.watch<ThemeProvider>();

    return MaterialApp(
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themep.getTheme,
      darkTheme: themep.darkthem,
locale: DevicePreview.locale(context),
     // builder: DevicePreview.appBuilder(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
     _counter++;
    });

  }
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundColor: HexColor(Globalvireables.white2),
      logoWidth: MediaQuery.of(context).size.width/3.5,
      loaderColor: Colors.black,
      logo: Image.asset(
        "assest/galaxylogo.png",
      ),
      showLoader: true,
      loadingText: const Text(
        '...',
        style: TextStyle(color: Color.fromARGB(255, 40, 148, 244)),
      ),
      navigator:  LoginScreen(),
      durationInSeconds: 3,
    );
  }
}
