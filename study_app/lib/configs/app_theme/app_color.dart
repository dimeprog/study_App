import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    UiParameter.isDarkMode(context)
        ? mainDarkLinearGradient
        : mainLightLinearGradient;
