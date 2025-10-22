import 'package:my_app/datas/chords.dart';

const a0maj1 = ChordDefinition(
  fret: [-1, 0, 2, 2, 2, 0],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 0, 1, 2, 3, 0],
  colors: [1, 0, 1, 0, 1, 1],
);

const a0maj2 = ChordDefinition(
  fret: [-1, -1, 2, 2, 2, 5],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

const a0maj3 = ChordDefinition(
  fret: [5, 7, 7, 6, 5, 5],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const a0maj4 = ChordDefinition(
  fret: [-1, -1, 7, 9, 10, 9],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 1],
);

const a0maj5 = ChordDefinition(
  fret: [-1, 12, 11, 9, 10, 9],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const a0maj6 = ChordDefinition(
  fret: [-1, 12, 14, 14, 14, 12],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const a0majs = [a0maj1, a0maj2, a0maj3, a0maj4, a0maj5, a0maj6];
