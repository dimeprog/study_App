import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_app/models/question_model.dart';

QuestionPaper questionPaperFromJson(String str) =>
    QuestionPaper.fromJson(json.decode(str));

String questionPaperToJson(QuestionPaper data) => json.encode(data.toJson());

class QuestionPaper {
  QuestionPaper({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.description,
    required this.timeSeconds,
    this.questions,
    required this.questionCount,
  });

  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  int questionCount;
  List<Question>? questions;
  String timeInMint() => "${(timeSeconds / 60).ceil()} mins";
  factory QuestionPaper.fromJson(Map<String, dynamic> json) => QuestionPaper(
        id: json["id"] as String,
        title: json["title"] as String,
        imageUrl: json["image_url"] as String,
        description: json["Description"] as String,
        timeSeconds: json["time_seconds"],
        questionCount: json['question_count'] as int,
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  factory QuestionPaper.fromSnapShot(
    DocumentSnapshot<Map<String, dynamic>> json,
  ) =>
      QuestionPaper(
        id: json.id,
        title: json["title"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        timeSeconds: json["timeSeconds"],
        questionCount: json['question_count'],
        questions: [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "Description": description,
        "time_seconds": timeSeconds,
        "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}
