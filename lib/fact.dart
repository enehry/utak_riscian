class Fact {
  final int id;
  final String text;
  final String description;

  Fact({required this.id, required this.text, required this.description});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      id: json['id'] as int,
      text: json['text'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Fact{id: $id, text: $text} $description';
  }
}

List<Fact> facts = [
  Fact(
      id: 1,
      text: 'A cat has 32 muscles in each ear.',
      description: 'A cat has 32 muscles in each ear.'),
  Fact(
      id: 2,
      text: 'A cat can jump up to seven times its length.',
      description: 'A cat can jump up to seven times its length.'),
  Fact(
      id: 3,
      text: 'A cat can’t see directly under its nose.',
      description: 'A cat can’t see directly under its nose.'),
  Fact(
      id: 4,
      text: 'A cat can’t see well in the dark.',
      description: 'A cat can’t see well in the dark.'),
];
