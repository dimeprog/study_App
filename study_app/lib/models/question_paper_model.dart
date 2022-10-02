// To parse this JSON data, do
//
//     final questionPaper = questionPaperFromJson(jsonString);

import 'dart:convert';

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
  });

  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Question>? questions;

  factory QuestionPaper.fromJson(Map<String, dynamic> json) => QuestionPaper(
        id: json["id"] as String,
        title: json["title"] as String,
        imageUrl: json["image_url"] as String,
        description: json["Description"] as String,
        timeSeconds: json["time_seconds"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
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
