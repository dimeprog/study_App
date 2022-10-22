import 'package:flutter/material.dart';
import 'package:get/get.dart';

const _mobileScreenPadding = 25.0;
const _cardBorderRadius = 10.0;
double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;

class UiParameter {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);
  static bool isDarkMode() => Get.isDarkMode ? true : false;
  // Theme.of(context).brightness == Brightness.dark: Theme.of(context).brightness == Brightness.light;
}
