import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_theme/ui_parameter.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:study_app/screens/home/question_card.dart';
import 'package:study_app/widgets/custom_Scaffold_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questionPapers = Get.find<QuestionPaperController>();
    // print(questionPapers.questionPapersImg.toString());
    return Scaffold(
      body: Obx(
        () {
          return questionPapers.questionPapersImg.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : CustomScaffoldWiget(
                  addPadding: false,
                  child: ListView.separated(
                    padding: UiParameter.mobileScreenPadding,
                    itemBuilder: (BuildContext context, index) {
                      return QuestionCard(
                          questionPaper: questionPapers.allPapers[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: questionPapers.questionPapersImg.length,
                  ),
                );
        },
      ),
    );
  }
}
