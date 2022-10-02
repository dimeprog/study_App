import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_papers/data_uploader_controller.dart';

class DataUploadingScreen extends StatelessWidget {
  DataUploadingScreen({super.key});
  DataUploaderController dataUploadingController =
      Get.put(DataUploaderController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Uploading')),
    );
  }
}
