class ChordDefinition {
  final List<int> fret; // 해당 줄의 프렛 번호
  final List<String> degrees; // 해당 줄의 도
  final List<int> fingering; // 해당 줄의 손가락 번호
  final List<int> colors; // 노드의 색

  const ChordDefinition({
    required this.fret,
    required this.degrees,
    required this.fingering,
    required this.colors,
  });
}

const cmaj1 = ChordDefinition(
  fret: [0, 1, 0, 2, 3, -1],
  degrees: ['3', 'R', '5', '3', 'R', 'X'],
  fingering: [0, 1, 0, 2, 3, 4],
  colors: [1, 0, 1, 1, 0, 1],
);

const cmaj2 = ChordDefinition(
  fret: [3, 5, 5, 5, 3, -1],
  degrees: ['5', '3', 'R', '5', 'R', 'X'],
  fingering: [1, 4, 3, 2, 1, 0],
  colors: [1, 1, 0, 1, 0, 1],
);

const cmajs = [cmaj1, cmaj2];

const Map<String, List<ChordDefinition>> scales = {'cmaj': cmajs};
