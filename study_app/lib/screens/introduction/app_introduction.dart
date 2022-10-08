import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widgets/app_circle_button.dart';

import '../../configs/app_theme/app_color.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'This is a study App. You can use it it as you like, if you  understand how it works you have to scale it. With this you will be able to master firrebase backend and flutter frontend',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AppCircleButton(
                onPress: () => Get.offNamed('/home'),
                width: 35,
                child: const Icon(
                  Icons.arrow_forward,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
