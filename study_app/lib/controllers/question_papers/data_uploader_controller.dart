import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:study_app/app_state/uploading_state_enum.dart';
import 'package:study_app/firebase_reference/firebase_ref.dart';
import 'package:study_app/models/question_paper_model.dart';

class DataUploaderController extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final uplaadingState = UploadingState.loading.obs;
  void uploadData() async {
    uplaadingState.value = UploadingState.loading;
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
      // print(stringPaperContent);
      questionPapers.add(
        QuestionPaper.fromJson(
          json.decode(stringPaperContent),
        ),
      );
    }
    // print('this is the item ${questionPapers.length}');var
    var batch = firestore.batch();

    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        'title': paper.title,
        'imageUrl': paper.imageUrl,
        'description': paper.description,
        'timeSeconds': paper.timeSeconds,
        'question_count': paper.questions == null ? 0 : paper.questions!.length,
      });

      for (var question in paper.questions!) {
        final questionPath =
            questionRF(paperID: paper.id, questionID: question.id);
        batch.set(questionPath, {
          'question': question.question,
          'correct_answer': question.correctAnswer
        });

        for (var answer in question.answers) {
          batch.set(questionPath.collection('answer').doc(answer.identifier), {
            'identifier': answer.identifier,
            'answer': answer.answer,
          });
        }
      }
    }
    await batch.commit();
    uplaadingState.value = UploadingState.complete;
  }
}
