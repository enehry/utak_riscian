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
          'You have passed Level 1: PARTS OF A MICROSCOPE! You may now proceed to Level 2: PARTS OF A MICRSOCOPE PART 2',
      description: 'PARTS OF A MICROSCOPE'),
  Fact(
      id: 2,
      text:
          'You have passed Level 2: PARTS OF A MICROSCOPE PART 2! You may now proceed to Level 3: CELL STRUCTURE',
      description: 'PARTS OF A MICRSOCOPE PART 2'),
  Fact(
      id: 3,
      text:
          'You have passed Level 3: CELL STRUCTURE! You may now proceed to Level 4: CELL STRUCTURE PART 2',
      description: 'CELL STRUCTURE'),
  Fact(
      id: 4,
      text:
          'You have passed Level 4: CELL STRUCTURE PART 2! You may now proceed to Level 5: CELL STRUCTURE PART 3',
      description: 'CELL STRUCTURE PART 2'),
  Fact(
      id: 5,
      text:
          'You have passed Level 5: CELL STRUCTURE PART 3! You may now proceed to Level 6: TYPES OF CELL',
      description: 'CELL STRUCTURE PART 3'),
  Fact(
      id: 6,
      text:
          'You have passed Level 6: TYPES OF CELL! You may now proceed to Level 7: TYPES OF CELL PART 2',
      description: 'TYPES OF CELL'),
  Fact(
      id: 7,
      text:
          'You have passed Level 7: TYPES OF CELL PART 2! You may now proceed to Level 8: CELL CYCLE',
      description: 'TYPES OF CELL PART 2'),
  Fact(
      id: 8,
      text:
          'You have passed Level 8: CELL CYCLE! You may now proceed to Level 9: CELL CYCLE PART 2',
      description: 'CELL CYCLE'),
  Fact(
      id: 9,
      text:
          'You have passed Level 9: CELL CYCLE PART 2! You may now proceed to Level 10: TRANSPORT MECHANISMS',
      description: 'CELL CYCLE PART 2'),
  Fact(
      id: 10,
      text:
          'You have passed Level 10: TRANSPORT MECHANISMS! You may now proceed to Level 11: BOLOGICAL MOLECULES',
      description: 'TRANSPORT MECHANISMS'),
  Fact(
      id: 11,
      text:
          'TYou have passed Level 11: BOLOGICAL MOLECULES! You may now proceed to Level 12: BOLOGICAL MOLECULES PART 2',
      description: 'BOLOGICAL MOLECULES'),
  Fact(
      id: 12,
      text:
          'You have passed Level 12: BOLOGICAL MOLECULES PART 2! You may now proceed to Level 13: ATP-ADP',
      description: 'BOLOGICAL MOLECULES PART 2'),
  Fact(
      id: 13,
      text:
          'You have passed Level 13: ATP-ADP! You may now proceed to Level 14: PLANT',
      description: 'ATP-ADP CYCLES'),
  Fact(
      id: 14,
      text:
          'You have passed Level 14: PLANT! You may now proceed to Level 15: RESPIRATION!',
      description: 'PLANT'),
  Fact(
      id: 15,
      text: 'You have passed Level 15: RESPIRATION!',
      description: 'RESPIRATION'),
];
