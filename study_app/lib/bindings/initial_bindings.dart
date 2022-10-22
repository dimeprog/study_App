import 'package:get/instance_manager.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:study_app/controllers/theme_controller.dart';

class InitailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put<AuthController>(AuthController(), permanent: true);
    // Get.put<QuestionPaperController>(QuestionPaperController(),
    //     permanent: true);
  }
}
