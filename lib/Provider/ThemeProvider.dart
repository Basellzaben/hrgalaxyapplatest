import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData themeMode;
  bool valueOfNotification = true;
  bool valueOfTheme = false;



   String basecolor="#024A80";
   String secondcolor="#D09A64";
   String white2="#F5F5F5";
   String white="#ffffff";
   String black="#000000";
   String black2="#191919";

  String basecolord="#024A80";
  String secondcolord="#D09A64";
  String white2d="#F5F5F5";
  String whited="#ffffff";
  String blackd="#000000";
  String black2d="#191919";


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
    themeMode = isDarkMode ? darkTheme : lightTheme;
  }




  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        .copyWith(secondary: Colors.deepPurple, brightness: Brightness.light),
  );
  final darkTheme = ThemeData(
    colorScheme: const ColorScheme(
        tertiaryContainer: Colors.grey,
        onTertiaryContainer: Colors.white,
        secondaryContainer: Colors.grey,
        onSecondaryContainer: Colors.white,
        tertiary: Colors.grey,
        onTertiary: Colors.white,
        surfaceVariant: Colors.grey,
        onSurfaceVariant: Colors.white,
        inversePrimary: Colors.grey,
        onInverseSurface: Colors.white,
        primaryContainer: Colors.grey,
        onPrimaryContainer: Colors.white,
        surface: Colors.grey,
        onSurface: Colors.white,
        background: Colors.grey,
        onBackground: Colors.white,
        error: Colors.red,
        onError: Colors.grey,
        primary: Colors.grey,
        secondary: Colors.white,
        onSecondary: Colors.white,
        onPrimary: Colors.white,
        brightness: Brightness.dark),
  );

  Future setTheme(String str) async {
    final prefs = await SharedPreferences.getInstance();
    if (str == 'dark') {
      themeMode = darkTheme;
      prefs.setBool('isDark', true);
    } else {
      themeMode = lightTheme;
      prefs.setBool('isDark', false);
    }
    notifyListeners();
  }

  Icon get getThemeIcon => themeMode == darkTheme
      ? const Icon(Icons.dark_mode)
      : const Icon(Icons.light_mode);
  ThemeData get getTheme => themeMode;
}
