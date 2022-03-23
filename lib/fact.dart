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
          'The earliest microscopes were known as “flea glasses” because they were used to study small insects.',
      description: 'PARTS OF A MICROSCOPE'),
  Fact(
      id: 2,
      text:
          'Robert Hooke is credited with the discovery of cells, after studying a cork under the microscope.',
      description: 'PARTS OF A MICRSOCOPE PART 2'),
  Fact(
      id: 3,
      text:
          'Since DNA is not found in the Nucleus, it is instead concentrated in one area called the nuclear region.',
      description: 'CELL STRUCTURE'),
  Fact(
      id: 4,
      text:
          'The cell nucleus was given its name by Scottish Botanist Robert Brown.',
      description: 'CELL STRUCTURE PART 2'),
  Fact(
      id: 5,
      text:
          'Unlike the cells of plants and fungi, animal cells lack a cell wall.',
      description: 'CELL STRUCTURE PART 3'),
  Fact(
      id: 6,
      text:
          'There are More Bacterial Cells in the Body than Human Cells.',
      description: 'TYPES OF CELL'),
  Fact(
      id: 7,
      text:
          'Prokaryotes were the earliest and most basic forms of life on Earth.',
      description: 'TYPES OF CELL PART 2'),
  Fact(
      id: 8,
      text:
          'Walther Flemming was the first person to conduct a systematic study of chromosomes during division and called this process mitosis.',
      description: 'CELL CYCLE'),
  Fact(
      id: 9,
      text:
          'The major purpose of mitosis is for growth and to replace worn out cells.',
      description: 'CELL CYCLE PART 2'),
  Fact(
      id: 10,
      text:
          'Moving things in and out of the cell is an important role of the plasma membrane.',
      description: 'TRANSPORT MECHANISMS'),
  Fact(
      id: 11,
      text:
          'The brain is the only carbohydrate-dependent organ in the body.',
      description: 'BOLOGICAL MOLECULES'),
  Fact(
      id: 12,
      text:
          'Nucleic acids are the most important macromolecules for the continuity of life.',
      description: 'BOLOGICAL MOLECULES PART 2'),
  Fact(
      id: 13,
      text:
          'One type of food that provides a source of ATP are meat and fish. These foods contain several animal cells, with each cell containing preformed ATP.',
      description: 'ATP-ADP CYCLES'),
  Fact(
      id: 14,
      text:
          'The green color of leaves is due to chlorophyll.',
      description: 'PLANT'),
  Fact(
      id: 15,
      text: 'If we don't breathe in more during exercises, our body produces lactic acid, which causes terrible pain in our muscles and joints.',
      description: 'RESPIRATION'),
];
