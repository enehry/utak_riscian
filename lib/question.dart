import 'dart:convert';

class Question {
  final int id;
  final List<String> answer;
  final String definition;
  final int stage;
  final int level;

  Question({
    required this.id,
    required this.answer,
    required this.definition,
    required this.level,
    required this.stage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'answer': answer,
      'definition': definition,
      'level': level,
      'stage': stage,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      answer: List<String>.from(map['answer'].split(''))
          .map((e) => e.toUpperCase())
          .toList(),
      definition: map['definition'] ?? '',
      level: map['level'] ?? 0,
      stage: map['stage'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));
}
