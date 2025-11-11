import 'package:my_app/datas/chords.dart';

const b0maj1 = ChordDefinition(
  fret: [-1, 2, 4, 4, 4, 2],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const b0maj2 = ChordDefinition(
  fret: [-1, -1, 4, 4, 4, 7],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const b0maj3 = ChordDefinition(
  fret: [7, 9, 9, 8, 7, 7],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const b0maj4 = ChordDefinition(
  fret: [-1, -1, 9, 11, 12, 11],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 0],
);

const b0maj5 = ChordDefinition(
  fret: [-1, 14, 13, 11, 12, 11],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const b0majs = [b0maj1, b0maj2, b0maj3, b0maj4, b0maj5];

const b0m1 = ChordDefinition(
  fret: [-1, 2, 4, 4, 3, 2],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const b0m2 = ChordDefinition(
  fret: [7, 9, 9, 7, 7, 7],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const b0m3 = ChordDefinition(
  fret: [-1, -1, 9, 11, 12, 10],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const b0ms = [b0m1, b0m2, b0m3];
