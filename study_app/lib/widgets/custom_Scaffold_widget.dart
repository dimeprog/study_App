import 'package:flutter/material.dart';
import 'package:study_app/configs/app_theme/app_color.dart';
import 'package:study_app/configs/app_theme/ui_parameter.dart';

class CustomScaffoldWiget extends StatelessWidget {
  final Widget child;
  final bool addPadding;
  const CustomScaffoldWiget({
    super.key,
    this.addPadding = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(color: customScaffoldWidgetColor()),
        padding: addPadding
            ? EdgeInsets.only(
                top: mobileScreenPadding,
                left: mobileScreenPadding,
                right: mobileScreenPadding,
              )
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
