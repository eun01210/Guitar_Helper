import 'package:my_app/datas/chords.dart';

const g0maj1 = ChordDefinition(
  fret: [3, 2, 0, 0, 0, 3],
  degrees: ['R', '3', '5', 'R', '3', 'R'],
  fingering: [2, 1, 0, 0, 0, 3],
  colors: [0, 1, 1, 0, 1, 0],
);

const g0maj2 = ChordDefinition(
  fret: [3, 5, 5, 4, 3, 3],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

const g0maj3 = ChordDefinition(
  fret: [-1, -1, 5, 7, 8, 7],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 1],
);

const g0maj4 = ChordDefinition(
  fret: [-1, 10, 9, 7, 8, 7],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

const g0maj5 = ChordDefinition(
  fret: [-1, 10, 12, 12, 12, 10],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

const g0majs = [g0maj1, g0maj2, g0maj3, g0maj4, g0maj5];
