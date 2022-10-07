import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/bindings/initial_bindings.dart';
import 'package:study_app/configs/app_theme/app_light_theme.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/route/app_routes.dart';
import 'package:study_app/screens/data_uploading_screen.dart';
import 'package:study_app/firebase_options.dart';
import 'package:study_app/screens/introduction/app_introduction.dart';
import 'package:study_app/screens/splash/splash_screen.dart';
import 'configs/app_theme/app_dark_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  InitailBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().darkTheme,
      home: const SplashScreen(),
      getPages: AppRoutes.routes(),
    );
  }
}
