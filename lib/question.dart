import 'dart:convert';

class Question {
  final int id;
  final List<String> answer;
  final String definition;

  Question({required this.id, required this.answer, required this.definition});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'answer': answer,
      'definition': definition,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      answer: List<String>.from(map['answer'].split(''))
          .map((e) => e.toUpperCase())
          .toList(),
      definition: map['definition'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));
}
