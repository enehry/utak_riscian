// enum position left & right
enum Align { left, right }

class Researcher {
  final Align algin;
  final String name;
  final String avatar;
  final String? position;
  final String? text;

  Researcher({
    required this.algin,
    required this.name,
    required this.avatar,
    this.position,
    this.text,
  });
}
