import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_theme/app_icon.dart';
import 'package:study_app/configs/app_theme/custom_textstyle.dart';
import 'package:study_app/configs/app_theme/ui_parameter.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/widgets/App_icon&text_widget.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.questionPaper,
  });
  final QuestionPaper questionPaper;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: UiParameter.cardBorderRadius,
          color: Theme.of(context).cardColor),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColoredBox(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    child: SizedBox(
                      height: Get.width * 0.15,
                      width: Get.width * 0.15,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FadeInImage(
                          image: NetworkImage(
                            questionPaper.imageUrl!,
                          ),
                          placeholder: const AssetImage(
                              'assets/images/app_splash_logo.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questionPaper.title,
                        style: cartTitles(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          questionPaper.description,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          AppIconAndTextWidget(
                            icon: Icon(
                              Icons.help_outline_sharp,
                              size: 20,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                            ),
                            text: Text(
                              "${questionPaper.questionCount} questions",
                              style: detailTextStyle.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppIconAndTextWidget(
                            icon: Icon(
                              Icons.timer,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                            ),
                            text: Text(
                              questionPaper.timeInMint(),
                              style: detailTextStyle.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: -10,
              right: -10,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cardBorderRadius),
                      bottomRight: Radius.circular(cardBorderRadius),
                    ),
                  ),
                  child: const Icon(
                    AppIcons.trophyLine,
                    // color: Colors.w,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
