import 'package:get/instance_manager.dart';
import 'package:study_app/controllers/auth_controller.dart';

class InitailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
