import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_app/configs/app_theme/app_color.dart';

mixin SubThemeData {
  // text theme
  TextTheme getTextTheme() => GoogleFonts.quicksandTextTheme(
        const TextTheme(
          bodyText1: TextStyle(
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      );

  // iconTheme
  IconThemeData getIconThemeData() => const IconThemeData(
        size: 16,
        color: onSurfaceTextColor,
      );
}
