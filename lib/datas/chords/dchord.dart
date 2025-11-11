import 'package:my_app/datas/chords.dart';

const d0maj1 = ChordDefinition(
  fret: [-1, -1, 0, 2, 3, 2],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 0, 1, 3, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const d0maj2 = ChordDefinition(
  fret: [-1, 5, 4, 2, 3, 2],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const d0maj3 = ChordDefinition(
  fret: [-1, 5, 7, 7, 7, 5],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const d0maj4 = ChordDefinition(
  fret: [-1, -1, 7, 7, 7, 10],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const d0maj5 = ChordDefinition(
  fret: [10, 12, 12, 11, 10, 10],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const d0maj6 = ChordDefinition(
  fret: [-1, -1, 12, 14, 15, 14],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 0],
);

const d0majs = [d0maj1, d0maj2, d0maj3, d0maj4, d0maj5, d0maj6];

const d0m1 = ChordDefinition(
  fret: [-1, -1, 0, 2, 3, 1],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 0, 2, 3, 1],
  colors: [1, 1, 0, 1, 0, 1],
);

const d0m2 = ChordDefinition(
  fret: [-1, 5, 7, 7, 6, 5],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const d0m3 = ChordDefinition(
  fret: [10, 12, 12, 10, 10, 10],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const d0m4 = ChordDefinition(
  fret: [-1, -1, 12, 14, 15, 13],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const d0ms = [d0m1, d0m2, d0m3, d0m4];
