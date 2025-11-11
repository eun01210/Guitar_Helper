import 'package:my_app/datas/chords.dart';

const f0maj1 = ChordDefinition(
  fret: [1, 3, 3, 2, 1, 1],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const f0maj2 = ChordDefinition(
  fret: [-1, -1, 3, 2, 1, 1],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 4, 3, 1, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const f0maj3 = ChordDefinition(
  fret: [-1, -1, 3, 5, 6, 5],
  degrees: ['X', 'X', '5', 'R', '3', '5'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 1, 0, 1, 1],
);

const f0maj4 = ChordDefinition(
  fret: [-1, 8, 7, 5, 6, 5],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const f0maj5 = ChordDefinition(
  fret: [-1, 8, 10, 10, 10, 8],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const f0maj6 = ChordDefinition(
  fret: [-1, -1, 10, 10, 10, 13],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const f0maj7 = ChordDefinition(
  fret: [13, 15, 15, 14, 13, 13],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const f0majs = [f0maj1, f0maj2, f0maj3, f0maj4, f0maj5, f0maj6];

const f0m1 = ChordDefinition(
  fret: [1, 3, 3, 1, 1, 1],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const f0m2 = ChordDefinition(
  fret: [-1, -1, 3, 5, 6, 4],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const f0m3 = ChordDefinition(
  fret: [-1, 8, 10, 10, 9, 8],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const f0m4 = ChordDefinition(
  fret: [13, 15, 15, 13, 13, 13],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const f0ms = [f0m1, f0m2, f0m3, f0m4];
