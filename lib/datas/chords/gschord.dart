import 'package:my_app/datas/chords.dart';

const g1maj1 = ChordDefinition(
  fret: [-1, -1, 1, 1, 1, 4],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const g1maj2 = ChordDefinition(
  fret: [4, 6, 6, 5, 4, 4],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const g1maj3 = ChordDefinition(
  fret: [-1, -1, 6, 8, 9, 8],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 1],
);

const g1maj4 = ChordDefinition(
  fret: [-1, 11, 10, 8, 9, 8],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const g1maj5 = ChordDefinition(
  fret: [-1, 11, 13, 13, 13, 11],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const g1majs = [g1maj1, g1maj2, g1maj3, g1maj4, g1maj5];

const g1m1 = ChordDefinition(
  fret: [4, 6, 6, 4, 4, 4],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const g1m2 = ChordDefinition(
  fret: [-1, -1, 6, 8, 9, 7],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

const g1m3 = ChordDefinition(
  fret: [-1, 11, 13, 13, 12, 11],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const g1ms = [g1m1, g1m2, g1m3];
