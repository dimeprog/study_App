import 'package:get/get.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/introduction/app_introduction.dart';
import 'package:study_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/introduction', page: () => AppIntroductionScreen()),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
          }),
        ),
      ];
}
