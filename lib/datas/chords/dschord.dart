import 'package:my_app/datas/chords.dart';

const d1maj1 = ChordDefinition(
  fret: [-1, -1, 1, 3, 4, 3],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 1],
);

const d1maj2 = ChordDefinition(
  fret: [-1, 6, 5, 3, 4, 3],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const d1maj3 = ChordDefinition(
  fret: [-1, 6, 8, 8, 8, 6],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const d1maj4 = ChordDefinition(
  fret: [-1, -1, 8, 8, 8, 11],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const d1maj5 = ChordDefinition(
  fret: [11, 13, 13, 12, 11, 11],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const d1majs = [d1maj1, d1maj2, d1maj3, d1maj4, d1maj5];

const d1m1 = ChordDefinition(
  fret: [-1, -1, 1, 3, 4, 2],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const d1m2 = ChordDefinition(
  fret: [-1, 6, 8, 8, 7, 6],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const d1m3 = ChordDefinition(
  fret: [11, 13, 13, 11, 11, 11],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const d1ms = [d1m1, d1m2, d1m3];
