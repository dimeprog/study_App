import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Icon(Icons.star),
            SizedBox(
              height: Get.width * 0.2,
            ),
            Text(
                'This is a study App. You can use it it as you like, if you  understand how it works you have to scale it. With this you will be able to master firrebase backend and flutter frontend'),
          ],
        ),
      ),
    );
  }
}
