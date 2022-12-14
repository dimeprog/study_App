import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton(
      {super.key,
      required this.child,
      this.color,
      this.width = 35,
      required this.onPress});
  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPress,
        child: child,
      ),
    );
  }
}
