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
    final themep = context.watch<ThemeProvider>();

    init();
    var lang = Provider.of<Language>(context, listen: false);
    return Scaffold(
      backgroundColor: themep.themeMode.backgroundColor,

      //appBar: null,
      body: Container(
        color:    themep.themeMode.backgroundColor,

        child: (SettingsList(

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
                      showLoaderDialog(context);
                   /* setState(() {
                        if (context.read<ThemeProvider>().getTheme ==
                            context.read<ThemeProvider>().darkTheme) {
                          context.read<ThemeProvider>().setTheme('light');
                        } else {
                          context.read<ThemeProvider>().setTheme('dark');
                        }
                      });*/
                    },
                    leading: context.read<ThemeProvider>().getThemeIcon,
                    title: Text(lang.Llanguage('light'))


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
      ),
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
      content: Container(
        height: 200,
        child: Column(
          children: [

       Row(children: [

         Container(
           child: GestureDetector(
               onTap: () {
                 Navigator.pop(context);
               }, child: Container(child: Icon(Icons.clear))),
         ),
Spacer(),
         Container(
           alignment: Alignment.topLeft,
             child: Text('اختيار الالوان')
         ),

       ],),
            Spacer(),
            Spacer(),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                    onTap: () {
                      context.read<ThemeProvider>().setTheme('them1');
                      Navigator.pop(context);

                    }, child: Container(
                  width: 50,
                  height: 50,
                    decoration: BoxDecoration(
                      color: HexColor(Globalvireables.themsc1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100.0),
                          bottomRight: Radius.circular(100.0),
                          topLeft: Radius.circular(100.0),
                          bottomLeft: Radius.circular(100.0)),
                    ),
                  )),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      context.read<ThemeProvider>().setTheme('them2');
                      Navigator.pop(context);

                    }, child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color:HexColor(Globalvireables.themsc2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100.0),
                        bottomRight: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomLeft: Radius.circular(100.0)),
                  ),
                )),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      context.read<ThemeProvider>().setTheme('them5');
                      Navigator.pop(context);

                    }, child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: HexColor(Globalvireables.themsc5),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100.0),
                        bottomRight: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomLeft: Radius.circular(100.0)),
                  ),
                )),
                Spacer(),
              ],
            ),
            Spacer(),

            Row(
              children: [
                Spacer(),
                GestureDetector(
                    onTap: () {
                      context.read<ThemeProvider>().setTheme('them3');
                      Navigator.pop(context);


                    }, child:Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: HexColor(Globalvireables.themsc3),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100.0),
                        bottomRight: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomLeft: Radius.circular(100.0)),
                  ),
                )),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      context.read<ThemeProvider>().setTheme('them4');
                      Navigator.pop(context);

                    }, child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: HexColor(Globalvireables.themsc4),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100.0),
                        bottomRight: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomLeft: Radius.circular(100.0)),
                  ),
                )),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      context.read<ThemeProvider>().setTheme('darkthem');
                      Navigator.pop(context);

                    }, child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: HexColor(Globalvireables.black2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100.0),
                        bottomRight: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomLeft: Radius.circular(100.0)),
                  ),
                )),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }




}
