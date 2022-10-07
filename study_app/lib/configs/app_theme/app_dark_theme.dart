import 'package:flutter/material.dart';
import 'package:study_app/configs/app_theme/sub_theme_data_mixin.dart';

const Color primaryDarkColorLight = Color(0xff2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColorDark = Color.fromARGB(255, 40, 40, 40);

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconThemeData(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      ),
    );
  }
}
