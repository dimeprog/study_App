import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study_app/app_state/uploading_state_enum.dart';
import 'package:study_app/controllers/question_papers/data_uploader_controller.dart';

class DataUploadingScreen extends StatelessWidget {
  DataUploadingScreen({super.key});
  final DataUploaderController dataUploadingController =
      Get.put(DataUploaderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => dataUploadingController.uplaadingState == UploadingState.complete
            ? const Center(
                child: Text('Uploading Completed'),
              )
            : const Center(
                child: Text('Uploading.....'),
              ),
      ),
    );
  }
}
