import 'package:get/instance_manager.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/controllers/theme_controller.dart';

class InitailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
