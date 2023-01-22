import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrgalaxyapplatest/GlobalVar.dart';
import 'package:hrgalaxyapplatest/HexaColor.dart';
import 'package:hrgalaxyapplatest/Provider/LoginProvider.dart';
import 'package:hrgalaxyapplatest/UI/LoginScreen.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/ThemeProvider.dart';
import '../Provider/languageProvider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var check = false;
  var prefs;
  int selectedSettings = 0;
  List<String> languages = ['AR', 'EN'];
  String _selectedLanguage = '';
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  @override
  void initState() {
    _selectedLanguage = //context.read<Language>().getLanguage();
        Provider.of<Language>(context, listen: false).getLanguage();
    _selectedLanguage = _selectedLanguage.isNotEmpty ? _selectedLanguage : 'EN';
    // init();
    isSwitched =
        Provider.of<LoginProvider>(context, listen: false).getRemember();
    print(Provider.of<LoginProvider>(context, listen: false)
            .getRemember()
            .toString() +
        "isSwitched");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var LoginP = Provider.of<LoginProvider>(context, listen: false);
    init();
    var lang = Provider.of<Language>(context, listen: false);
    return Scaffold(
      //appBar: null,
      body: (SettingsList(
        sections: [
          SettingsSection(
            title: Container(
                margin: EdgeInsets.only(top: 10),
                child: Align(
                    alignment: _selectedLanguage == 'AR'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Text(
                      lang.Llanguage('settings'),
                      style: TextStyle(fontSize: 20),
                    ))),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: Text(lang.Llanguage('language')),
                trailing: DropdownButton(
                  hint: Text(lang.Llanguage('language')),
                  value:
                      _selectedLanguage.isNotEmpty ? _selectedLanguage : 'EN',
                  onChanged: (newValue) async {
                    print(newValue.toString() + " selectedLanguagenewww");
                    setLan(newValue ?? 'Ar');
                    setState(() {
                      _selectedLanguage = newValue.toString();
                      Provider.of<Language>(context, listen: false)
                          .setLanguage(_selectedLanguage);
                      print(_selectedLanguage + "   _selectedLanguage");
                    });
                  },
                  items: languages.map((lang) {
                    return DropdownMenuItem(
                      child: Text(lang),
                      value: lang ?? '',
                    );
                  }).toList(),
                ),
              ),

              ////

              SettingsTile.navigation(
                  leading: const Icon(Icons.fingerprint),
                  title: Text(lang.Llanguage('finget')),
                  trailing: Switch(
                    onChanged: toggleSwitch,
                    value: isSwitched,
                    activeColor: HexColor(Globalvireables.white),
                    activeTrackColor: Colors.blueAccent,
                    inactiveThumbColor: HexColor(Globalvireables.white),
                    inactiveTrackColor: Colors.white12,
                  )),

              SettingsTile.navigation(
                  onPressed: (_) {
                    setState(() {
                      if (context.read<ThemeProvider>().getTheme ==
                          context.read<ThemeProvider>().darkTheme) {
                        context.read<ThemeProvider>().setTheme('light');
                      } else {
                        context.read<ThemeProvider>().setTheme('dark');
                      }
                    });
                  },
                  leading: context.read<ThemeProvider>().getThemeIcon,
                  title: context.read<ThemeProvider>().getTheme ==
                      context.read<ThemeProvider>().lightTheme
                      ? Text(lang.Llanguage('light'))
                      : Text(lang.Llanguage('dark'))


              ),
              
              SettingsTile.navigation(
                  leading: null,
                  title: Text(lang.Llanguage('Logout')),
                  trailing: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(lang.Llanguage('wanttologout')),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                      (Route<dynamic> route) => false);
                                },
                                child: Text('نعم'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: Text('لا'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Icon(
                        Icons.login_outlined,
                        color: Colors.red,
                      ))),
            ],
          ),
        ],
      )),
    );
  }

  setLan(String l) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('language', l).toString();
  }

  RememberFun(bool check) async {
    var LoginP = Provider.of<LoginProvider>(context, listen: false);

    prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberme', check);
    LoginP.setRemember(check);
    if (check) {
      prefs.setString('usename', LoginP.getUsername());
      prefs.setString('password', LoginP.getPassword());
    } else {
      prefs.setString('usename', '');
      prefs.setString('password', '');
    }
  }

  void toggleSwitch(bool x) {
    setState(() {
      isSwitched = !isSwitched;
    });
    //RememberFun(isSwitched,context);
    RememberFun(isSwitched);
  }

  init() async {
    try {
      prefs = await SharedPreferences.getInstance();
      print(prefs.getBool('rememberme').toString() + "seetingvv");
      if (prefs.getBool('rememberme') == true) {
        isSwitched = false;
      } else {
        isSwitched = true;
      }
    } catch (_) {
      isSwitched = true;
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          Image.asset('assest/loading.gif',
              height: 100, width: MediaQuery.of(context).size.width / 3),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text("...جار تسجيل الدخول")),
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
