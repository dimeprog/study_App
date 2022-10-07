import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UiParameter {
  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
