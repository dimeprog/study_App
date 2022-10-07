import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:study_app/configs/app_theme/app_dark_theme.dart';
import 'package:study_app/configs/app_theme/app_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}
