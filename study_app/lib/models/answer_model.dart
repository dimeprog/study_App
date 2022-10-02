class Answer {
  Answer({
    this.identifier,
    required this.answer,
  });

  String? identifier;
  String answer;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        identifier: json["identifier"] as String,
        answer: json["Answer"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "Answer": answer,
      };
}
