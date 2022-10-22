import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_theme/app_dark_theme.dart';
import 'package:study_app/configs/app_theme/app_light_theme.dart';
import 'package:study_app/configs/app_theme/ui_parameter.dart';

const Color onSurfaceTextColor = Colors.white;
LinearGradient mainLightLinearGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryColorLight, primaryLightColorLight],
);
LinearGradient mainDarkLinearGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryColorDark,
    primaryDarkColorLight,
  ],
);

LinearGradient mainGradient(BuildContext context) =>
    UiParameter.isDarkMode() ? mainDarkLinearGradient : mainLightLinearGradient;

Color customScaffoldWidgetColor() => Get.isDarkMode
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);
