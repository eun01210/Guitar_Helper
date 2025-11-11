import 'package:my_app/datas/chords.dart';

const c1maj1 = ChordDefinition(
  fret: [-1, 4, 3, 1, 2, 1],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const c1maj2 = ChordDefinition(
  fret: [-1, 4, 6, 6, 6, 4],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const c1maj3 = ChordDefinition(
  fret: [-1, -1, 6, 6, 6, 9],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const c1maj4 = ChordDefinition(
  fret: [9, 11, 11, 10, 9, 9],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const c1maj5 = ChordDefinition(
  fret: [-1, -1, 11, 13, 14, 13],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 1],
);

const c1majs = [c1maj1, c1maj2, c1maj3, c1maj4, c1maj5];

const c1m1 = ChordDefinition(
  fret: [-1, 4, 6, 6, 5, 4],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const c1m2 = ChordDefinition(
  fret: [9, 11, 11, 9, 9, 9],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const c1m3 = ChordDefinition(
  fret: [-1, -1, 11, 13, 14, 12],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const c1ms = [c1m1, c1m2, c1m3];
