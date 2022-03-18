class Fact {
  final int id;
  final String text;

  Fact({required this.id, required this.text});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      id: json['id'] as int,
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'text': text,
    };
  }

  @override
  String toString() {
    return 'Fact{id: $id, text: $text}';
  }
}

List<Fact> facts = [
  Fact(id: 1, text: 'A cat has 32 muscles in each ear.'),
  Fact(id: 2, text: 'A cat can jump up to seven times its length.'),
  Fact(id: 3, text: 'A cat can’t see directly under its nose.'),
  Fact(id: 4, text: 'A cat can’t see well in the dark.'),
];
