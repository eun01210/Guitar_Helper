import 'package:my_app/datas/chords.dart';

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
  fret: [8, 10, 10, 9, 8, 8],
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

const c0m1 = ChordDefinition(
  fret: [-1, 3, 1, 0, 1, 3],
  degrees: ['X', 'R', 'b3', '5', 'R', '5'],
  fingering: [0, 3, 1, 0, 2, 4],
  colors: [1, 0, 1, 1, 0, 1],
);

const c0m2 = ChordDefinition(
  fret: [-1, 3, 5, 5, 4, 3],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const c0m3 = ChordDefinition(
  fret: [8, 10, 10, 8, 8, 8],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const c0m4 = ChordDefinition(
  fret: [-1, -1, 10, 12, 13, 11],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const c0ms = [c0m1, c0m2, c0m3, c0m4];
