import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_theme/app_color.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _questionPapers = Get.find<QuestionPaperController>();
    print(_questionPapers.questionPapersImg.toString());
    return Scaffold(
      body: Obx(
        () {
          return Container(
            decoration: BoxDecoration(
              gradient: mainGradient(context),
            ),
            child: _questionPapers.questionPapersImg.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (BuildContext context, index) {
                      return ClipRRect(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: FadeInImage(
                            image: NetworkImage(
                              _questionPapers.questionPapersImg[index],
                            ),
                            placeholder:
                                AssetImage('assets/images/app_splash_logo.png'),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: _questionPapers.questionPapersImg.length,
                  ),
          );
        },
      ),
    );
  }
}
