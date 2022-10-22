import 'package:flutter/material.dart';
import 'package:study_app/configs/app_theme/ui_parameter.dart';

TextStyle cartTitles(BuildContext context) => TextStyle(
      fontSize: 19,
      color: UiParameter.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
    );

const detailTextStyle = TextStyle(fontSize: 15);
