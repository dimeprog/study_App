import 'answer_model.dart';

class Question {
  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  String id;
  String question;
  List<Answer> answers;
  String correctAnswer;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        correctAnswer: json["correct_answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "correct_answer": correctAnswer,
      };
}
