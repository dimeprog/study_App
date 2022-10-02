import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:study_app/models/question_paper_model.dart';

class DataUploaderController extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  void uploadData() async {
    // intializing firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // loading data for assets
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final paperInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/papers') && path.contains('.json'))
        .toList();
    List<QuestionPaper> questionPapers = [];
    for (var paper in paperInAssets) {
      final stringPaperContent = await rootBundle.loadString(paper);
      print(stringPaperContent);
      questionPapers.add(
        QuestionPaper.fromJson(
          json.decode(stringPaperContent),
        ),
      );
    }
    // print('this is the item ${questionPapers.length}');var
    var batch = firestore.batch();
  }
}
