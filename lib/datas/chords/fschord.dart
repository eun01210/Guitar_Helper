import 'package:my_app/datas/chords.dart';

const f1maj1 = ChordDefinition(
  fret: [2, 4, 4, 3, 2, 2],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const f1maj2 = ChordDefinition(
  fret: [-1, -1, 4, 6, 7, 6],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 1],
);

const f1maj3 = ChordDefinition(
  fret: [-1, 9, 8, 6, 7, 6],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const f1maj4 = ChordDefinition(
  fret: [-1, 9, 11, 11, 11, 9],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const f1maj5 = ChordDefinition(
  fret: [-1, -1, 11, 11, 11, 14],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const f1majs = [f1maj1, f1maj2, f1maj3, f1maj4, f1maj5];

const f1m1 = ChordDefinition(
  fret: [2, 4, 4, 2, 2, 2],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const f1m2 = ChordDefinition(
  fret: [-1, -1, 4, 6, 7, 5],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const f1m3 = ChordDefinition(
  fret: [-1, 9, 11, 11, 10, 9],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const f1ms = [f1m1, f1m2, f1m3];
