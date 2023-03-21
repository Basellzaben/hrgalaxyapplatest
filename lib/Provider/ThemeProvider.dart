import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData themeMode;
  bool valueOfNotification = true;
  bool valueOfTheme = false;


  String white2="#F5F5F5";
  String white="#ffffff";
  String black="#000000";
  String black2="#191919";

  //basic a
   String basecolor="#024A80";
   String secondcolor="#D09A64";

  getbasecolor() {

    return basecolor;
  }
  getsecondcolor() {
    return secondcolor;
  }
  getwhite2() {
    return white2;
  }
  getwhite() {
    return white;
  }
  getblack2() {
    return black2;
  }


  getblack() {
    return black;
  }
  ThemeProvider(bool isDarkMode) {
    themeMode = isDarkMode ? them1 : them2;
  }




  final them1 = ThemeData(
    primaryColor: HexColor(Globalvireables.themsc1),
    brightness: Brightness.light,
    backgroundColor: HexColor(Globalvireables.white3),
    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        .copyWith(secondary: Colors.indigo, brightness: Brightness.light),
  );

  final them2 = ThemeData(
    primaryColor: HexColor(Globalvireables.themsc2),
    brightness: Brightness.light,
    backgroundColor: HexColor(Globalvireables.white3),
    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        .copyWith(secondary: Colors.indigo, brightness: Brightness.light),
  );


  final them3 = ThemeData(
    primaryColor: HexColor(Globalvireables.themsc3),
    brightness: Brightness.light,
    backgroundColor: HexColor(Globalvireables.white3),
    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        .copyWith(secondary: Colors.indigo, brightness: Brightness.light),
  );



  final them4 = ThemeData(
    primaryColor: HexColor(Globalvireables.themsc4),
    brightness: Brightness.light,
    backgroundColor: HexColor(Globalvireables.white3),
    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        .copyWith(secondary: Colors.indigo, brightness: Brightness.light),
  );

  final them5 = ThemeData(
    primaryColor: HexColor(Globalvireables.themsc5),
    brightness: Brightness.light,
    backgroundColor: HexColor(Globalvireables.white3),

    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        .copyWith(secondary: Colors.indigo, brightness: Brightness.light),
  );



  final darkthem = ThemeData(
    primaryColor: Colors.deepOrange,
    brightness: Brightness.light,
    backgroundColor: HexColor(Globalvireables.white3),
    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
        .copyWith(secondary: Colors.indigo, brightness: Brightness.light),
  );


  Future setTheme(String str) async {
    final prefs = await SharedPreferences.getInstance();
    if (str == 'them1') {
      themeMode = them1;
      prefs.setBool('isDark', false);
      notifyListeners();
    } else  if (str == 'them2'){
      themeMode = them2;
      notifyListeners();
      prefs.setBool('isDark', false);
    }else  if (str == 'them3'){
  themeMode = them3;
  notifyListeners();
  prefs.setBool('isDark', false);
  }else if (str == 'them4'){
      themeMode = them4;
      notifyListeners();
      prefs.setBool('isDark', false);
    }else if (str == 'them5'){
      themeMode = them5;
      notifyListeners();
      prefs.setBool('isDark', false);
    }else{
      themeMode = darkthem;
        prefs.setBool('isDark', true);
      notifyListeners();
    }
  }

  Icon get getThemeIcon => geticonthem();/*themeMode == them1
      ? const Icon(Icons.dark_mode)
      : const Icon(Icons.light_mode);*/
  ThemeData get getTheme => themeMode;



  geticonthem(){
    if(themeMode==them1)
    return Icon(Icons.light_mode,color: HexColor(Globalvireables.themsc1),);
    else if(themeMode==them2)
    return Icon(Icons.light_mode,color: HexColor(Globalvireables.themsc2),);
    else if(themeMode==them3)
      return Icon(Icons.light_mode,color: HexColor(Globalvireables.themsc3),);
else if(themeMode==them4)
      return Icon(Icons.light_mode,color: HexColor(Globalvireables.themsc4),);
    else if(themeMode==them5)
      return Icon(Icons.light_mode,color: HexColor(Globalvireables.themsc5),);
else
      return Icon(Icons.light_mode,color: Colors.deepOrange,);
  }


}
