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

const c0maj1 = ChordDefinition(
  fret: [-1, 3, 2, 0, 1, 0],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [4, 3, 2, 0, 1, 0],
  colors: [1, 0, 1, 1, 0, 1],
);

const c0maj2 = ChordDefinition(
  fret: [-1, 3, 5, 5, 5, 3],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const c0maj3 = ChordDefinition(
  fret: [-1, -1, 5, 5, 5, 8],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const c0majs = [c0maj1, c0maj2, c0maj3];

const Map<String, List<ChordDefinition>> chords = {'C0maj': c0majs};
