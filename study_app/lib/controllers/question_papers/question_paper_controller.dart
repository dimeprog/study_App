import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/material/progress_indicator.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/services/firebase_storage_services.dart';

class QuestionPaperController extends GetxController {
  List<String> _questionPapersImg = <String>[].obs;
  List<String> get questionPapersImg => _questionPapersImg;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<int?> getNoItems(String folderName) async {
    if (folderName == null) {
      return 0;
    }
    try {
      final items = storage.child(folderName).bucket;
    } catch (err) {
      return 0;
    }
  }

  Future<void> getAllPapers() async {
    List<String> paperImg = [
      'chemistry',
      'math',
      'physics',
      'biology',
    ];
    for (var image in paperImg) {
      final String? url =
          await Get.put(FirebaseStorageServices()).getImage(image);
      print(url);
      _questionPapersImg.add(url!);
    }
  }
}
