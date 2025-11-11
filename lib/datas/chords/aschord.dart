import 'package:my_app/datas/chords.dart';

const a1maj1 = ChordDefinition(
  fret: [-1, 1, 3, 3, 3, 1],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const a1maj2 = ChordDefinition(
  fret: [-1, -1, 3, 3, 3, 6],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const a1maj3 = ChordDefinition(
  fret: [6, 8, 8, 7, 6, 6],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const a1maj4 = ChordDefinition(
  fret: [-1, -1, 8, 10, 11, 10],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 1],
);

const a1maj5 = ChordDefinition(
  fret: [-1, 13, 12, 10, 11, 10],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const a1maj6 = ChordDefinition(
  fret: [-1, 13, 15, 15, 15, 13],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const a1majs = [a1maj1, a1maj2, a1maj3, a1maj4, a1maj5, a1maj6];

const a1m1 = ChordDefinition(
  fret: [-1, 1, 3, 3, 2, 1],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const a1m2 = ChordDefinition(
  fret: [6, 8, 8, 6, 6, 6],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const a1m3 = ChordDefinition(
  fret: [-1, -1, 8, 10, 11, 9],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const a1m4 = ChordDefinition(
  fret: [-1, 13, 15, 15, 14, 13],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const a1ms = [a1m1, a1m2, a1m3, a1m4];
