import 'package:my_app/datas/chords.dart';

const e0maj1 = ChordDefinition(
  fret: [0, 2, 2, 1, 0, 0],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [0, 3, 2, 1, 0, 0],
  colors: [0, 1, 0, 1, 1, 0],
);

const e0maj2 = ChordDefinition(
  fret: [-1, -1, 1, 4, 5, 4],
  degrees: ['X', 'X', '5', 'R', '3', '5'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 1, 0, 1, 1],
);

const e0maj3 = ChordDefinition(
  fret: [-1, 7, 7, 9, 9, 9],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 4, 3, 1, 1, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const e0maj4 = ChordDefinition(
  fret: [-1, 7, 9, 9, 9, 7],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const e0maj5 = ChordDefinition(
  fret: [-1, -1, 9, 9, 9, 12],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const e0maj6 = ChordDefinition(
  fret: [12, 14, 14, 13, 12, 12],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 4, 3, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const e0majs = [e0maj1, e0maj2, e0maj3, e0maj4, e0maj5, e0maj6];

const e0m1 = ChordDefinition(
  fret: [0, 2, 2, 0, 0, 0],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [0, 2, 3, 0, 0, 0],
  colors: [0, 1, 0, 1, 1, 0],
);

const e0m2 = ChordDefinition(
  fret: [-1, -1, 2, 4, 5, 3],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const e0m3 = ChordDefinition(
  fret: [-1, 7, 9, 9, 8, 7],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const e0m4 = ChordDefinition(
  fret: [12, 14, 14, 12, 12, 12],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const e0ms = [e0m1, e0m2, e0m3, e0m4];
