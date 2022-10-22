import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/services/firebase_storage_services.dart';

import '../../firebase_reference/firebase_ref.dart';

class QuestionPaperController extends GetxController {
  final List<String> _questionPapersImg = <String>[].obs;
  final List<QuestionPaper> _allPapers = <QuestionPaper>[].obs;
  // getters
  List<String> get questionPapersImg => _questionPapersImg;
  List<QuestionPaper> get allPapers => _allPapers;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
    final paperList =
        data.docs.map((paper) => QuestionPaper.fromSnapShot(paper)).toList();
    print(paperList);
    _allPapers.assignAll(paperList);
    for (var paper in paperList) {
      final String? url =
          await Get.put(FirebaseStorageServices()).getImage(paper.title);
      print(url);
      paper.imageUrl = url;
      _questionPapersImg.add(url!);
    }
  }
}
