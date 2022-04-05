// enum position left & right
enum AlignPos { left, right }

class Researcher {
  final AlignPos align;
  final String name;
  final String avatar;
  final String position;
  final String section;

  Researcher({
    required this.align,
    required this.name,
    required this.avatar,
    required this.position,
    required this.section,
  });
}

List<Researcher> researchers = [
  // copy paste lng to
  Researcher(
    align: AlignPos.left,
    name: 'Juan Dela Cruz',
    avatar: 'assets/avatars/logo.png',
    position: 'Position',
    section: 'Section',
  ),
  // hanggang dito tas palitan ung nakalagay
  Researcher(
    align: AlignPos.right,
    name: 'Juana Garcia',
    avatar: 'assets/avatars/logo.png',
    position: 'Position',
    section: 'Section',
  ),
  Researcher(
    align: AlignPos.left,
    name: 'John Doe',
    avatar: 'assets/avatars/logo.png',
    position: 'Position',
    section: 'Section',
  ),
];
