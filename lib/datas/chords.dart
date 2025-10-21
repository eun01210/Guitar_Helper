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

// 6번줄부터 표시
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

const c0maj4 = ChordDefinition(
  fret: [8, 10, 9, 9, 8, 8],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const c0maj5 = ChordDefinition(
  fret: [-1, -1, 10, 12, 13, 12],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 0],
);

const c0majs = [c0maj1, c0maj2, c0maj3, c0maj4, c0maj5];

const d0maj1 = ChordDefinition(
  fret: [-1, -1, 0, 2, 3, 2], // c0maj1 fret + 2 (if > -1)
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 0, 1, 3, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const d0maj2 = ChordDefinition(
  fret: [-1, 5, 4, 2, 3, 2], // c0maj1 fret + 2 (if > -1)
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const d0maj3 = ChordDefinition(
  fret: [-1, 5, 7, 7, 7, 5], // c0maj2 fret + 2 (if > -1)
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const d0maj4 = ChordDefinition(
  fret: [-1, -1, 7, 7, 7, 10], // c0maj3 fret + 2 (if > -1)
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const d0maj5 = ChordDefinition(
  fret: [10, 12, 11, 11, 10, 10], // c0maj4 fret + 2
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const d0maj6 = ChordDefinition(
  fret: [-1, -1, 12, 14, 15, 14], // c0maj5 fret + 2 (if > -1)
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 0],
);

const d0majs = [d0maj1, d0maj2, d0maj3, d0maj4, d0maj5, d0maj6];

const Map<String, List<ChordDefinition>> chords = {
  'C0maj': c0majs,
  'D0maj': d0majs,
};
