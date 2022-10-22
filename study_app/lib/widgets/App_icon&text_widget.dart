import 'package:flutter/cupertino.dart';

class AppIconAndTextWidget extends StatelessWidget {
  final Icon icon;
  final Widget text;
  const AppIconAndTextWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 12,
        ),
        text,
      ],
    );
  }
}
