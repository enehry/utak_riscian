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
    return 'Facts{id: $id, text: $text} $description';
  }
}

List<Fact> facts = [
  Fact(
      id: 1,
      text:
          'The earliest microscopes were known as “flea glasses” because they were used to study small insects!',
      description: 'PARTS OF A MICROSCOPE'),
  Fact(
      id: 2,
      text:
          'The earliest microscopes were known as “flea glasses” because they were used to study small insects!',
      description: 'STRUCTURE OF A CELL'),
  Fact(
      id: 3,
      text: 'Cell is Too Small to be Seen Without Magnification.',
      description: 'PARTS OF A CELL'),
  Fact(
      id: 4,
      text: 'There are More Bacterial Cells in the Body than Human Cells!',
      description: 'PARTS OF A CELL PART 2'),
];
