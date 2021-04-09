import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopx/core/constants.dart';
import 'package:shopx/core/constants/AppStyles.dart';

import 'package:shopx/features/splash/presentation/pages/Splash.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:shopx/features/info/presentation/widgets/ChangeLang.dart';
import 'package:shopx/features/user/presentation/pages/ChangePassword.dart';



class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool visibilityLang = false;
  bool visibilityTheme = false;
  bool iconLang = false;
  bool iconTheme = false;
  int selectedRadioTile;

  @override
  void initState() {
    selectedRadioTile = 0;
    super.initState();
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "Lang") {
        visibilityLang = visibility;
        visibilityTheme = false;
        iconTheme = false;
      }
      if (field == "Theme") {
        visibilityTheme = visibility;
        visibilityLang = false;
        iconLang = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
        child: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
        padding: EdgeInsets.only(
        top: h * 0.1, left: w * 0.03, bottom: h * 0.01),
    child: Text(
    'General Settings',
    style: TextStyle(fontSize: 25),
    ),
    ),
    Container(
    margin: EdgeInsets.only(left: w * 0.03, right: w * 0.03),
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
    children: [
    Column(
    children: [
    FlatButton(
    materialTapTargetSize:
    MaterialTapTargetSize.shrinkWrap,
    color: Colors.white,
    onPressed: () {},
    child: InkWell(
    onTap: () {
    iconLang = !iconLang;
    visibilityTheme
    ? _changed(false, "Theme")
        : _changed(true, "Theme");
    },
    child: Row(
    children: [
    Padding(
    padding: EdgeInsets.only(right: w * 0.02),
    child: Icon(Icons.language),
    ),
    Expanded(
    child: InkWell(
    onTap: () {
    iconLang = !iconLang;
    visibilityLang
    ? _changed(false, "Lang")
        : _changed(true, "Lang");
    },
    child: Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    Align(
    alignment: Alignment.centerLeft,
    child: Text(
    'Change Language',
    style: TextStyle(fontSize: 17),
    ),
    ),
    IconButton(alignment: Alignment.centerRight,
    onPressed: () {
    iconLang = !iconLang;
    visibilityLang
    ? _changed(false, "Lang")
        : _changed(true, "Lang");
    },
    icon: Icon(iconLang
    ? Icons.keyboard_arrow_down
        : Icons.keyboard_arrow_right),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    visibilityLang
    ? Container(
    child: Column(
    children: [
    Divider(
    thickness: 1.5,
    height: 0,
    endIndent: 30.0,
    indent: 30.0,
    ),
    Padding(
    padding: EdgeInsets.all(w * 0.02),
    child: ChangeLang(
    onPress: () {
    context.locale = Locale(LANG_AR);
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Spalsh(),
    ));
    },
    country: "العربية",
    flag: "assets/images/Arabic.png",
    ),
    ),
    Divider(
    thickness: 1.5,
    height: 0,
    endIndent: 30.0,
    indent: 30.0,
    ),
    Padding(
    padding: EdgeInsets.all(w * 0.02),
    child: ChangeLang(
    onPress: () {
    context.locale = Locale(LANG_EN);
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Spalsh(),
    ));
    },
    country: "English",
    flag: "assets/images/English.png",
    ),
    ),
    Divider(
    thickness: 1.5,
    height: 0,
    endIndent: 30.0,
    indent: 30.0,
    ),
    Padding(
    padding: EdgeInsets.all(w * 0.02),
    child: ChangeLang(
    onPress: () {
    context.locale = Locale(LANG_FR);
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    Spalsh(),
    ));
    },
    country: "français",
    flag: "assets/images/France.png"),
    ),
    Divider(
    thickness: 1.5,
    height: 0,
    endIndent: 30.0,
    indent: 30.0,
    ),
    Padding(
    padding: EdgeInsets.all(w * 0.02),
    child: ChangeLang(
    onPress: () {
    context.locale = Locale(LANG_ES);
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    Spalsh(),
    ));
    },
    country: "Español",
    flag: "assets/images/Spain.png"),
    )
    ],
    ),
    )
        : Container(),
    ],
    ),
    Divider(
    thickness: 1.5,
    ),
    Column(
    children: [
    MaterialButton(
    materialTapTargetSize:
    MaterialTapTargetSize.shrinkWrap,
    color: Colors.white,
    onPressed: () {},
    child: InkWell(
    onTap: () {
    iconTheme = !iconTheme;
    visibilityTheme
    ? _changed(false, "Theme")
        : _changed(true, "Theme");
    },
    child: Row(
    children: [
    Padding(
    padding: EdgeInsets.only(right: 10),
    child: Icon(Icons.color_lens),
    ),
    Expanded(
    child: InkWell(
    onTap: () {
    iconTheme = !iconTheme;
    visibilityTheme
    ? _changed(false, "Theme")
        : _changed(true, "Theme");
    },
    child: Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    Align(
    alignment: Alignment.centerLeft,
    child: Text(
    'Change Theme',
    style: TextStyle(fontSize: 17),
    ),
    ),IconButton(
        alignment: Alignment.centerRight,
        onPressed: () {
          iconTheme = !iconTheme;
          visibilityTheme
              ? _changed(false, "Theme")
              : _changed(true, "Theme");
        },
        icon: Icon(iconTheme
            ? Icons.keyboard_arrow_down
            : Icons.keyboard_arrow_right),
      ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    ),
      visibilityTheme
          ? Container(
        child: Column(
          children: [
            Divider(
              thickness: 1.5,
              height: 0,
            ),
            RadioListTile(
              value: 1,
              groupValue: selectedRadioTile,
              title: Text("Light"),
              onChanged: (val) {
                setSelectedRadioTile(val);
              },
              activeColor: Colors.grey,
              selected:
              selectedRadioTile == 1 ? true : false,
            ),
            RadioListTile(
              value: 2,
              groupValue: selectedRadioTile,
              title: Text("Dark"),
              onChanged: (val) {
                setSelectedRadioTile(val);
              },
              activeColor: Colors.black,
              selected:
              selectedRadioTile == 2 ? true : false,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text("Change"),
                  splashColor: Colors.grey,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Cancel"),
                  splashColor: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      )
          : Container(),

    ],

    ),
      SizedBox(
        height: 20,
      ),
      Column(
        children: [
          MaterialButton(
            materialTapTargetSize:
            MaterialTapTargetSize.shrinkWrap,
            color: Colors.white,
            onPressed: () {},
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: w * 0.02),
                    child: Icon(FontAwesomeIcons.question),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                      },
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Change Password'.tr(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ],
    ),
    ),

        ],
        ),
        ),
        ),
    );
  }
}
