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
    return 'DID YOU KNOW?{id: $id, text: $text} $description';
  }
}

List<Fact> facts = [
  Fact(
      id: 1,
      text: 'PARTS OF MICRSOCOPE',
      description:
          'The earliest microscopes were known as “flea glasses” because they were used to study small insects!'),
  Fact(
      id: 2,
      text: 'STRUCTURE OF A CELL',
      description: 'Cell is Too Small to be Seen Without Magnification.'),
  Fact(
      id: 3,
      text: 'PARTS OF A CELL',
      description:
          'There are More Bacterial Cells in the Body than Human Cells!'),
  Fact(
      id: 4,
      text: 'PARTS OF A CELL PART 2',
      description: 'Cells Commit Suicide'),
];
