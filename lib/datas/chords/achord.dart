import 'package:my_app/datas/chords.dart';
import 'package:my_app/datas/chords/basic_form.dart';

final a0maj1 = ChordDefinition(
  fret: [-1, 0, 2, 2, 2, 0],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 0, 1, 2, 3, 0],
  colors: [1, 0, 1, 0, 1, 1],
);
final a0maj2 = keyUp(maj3, 1);
final a0maj3 = keyUp(maj4, 4);
final a0maj4 = keyUp(maj5, 6);
final a0maj5 = keyUp(maj1, 8);
final a0maj6 = keyUp(maj2, 11);

final a0majs = [a0maj1, a0maj2, a0maj3, a0maj4, a0maj5, a0maj6];

final a0m1 = ChordDefinition(
  fret: [-1, 0, 2, 2, 1, 0],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 0, 2, 3, 1, 0],
  colors: [1, 0, 1, 0, 1, 1],
);
final a0m2 = keyUp(m2, 4);
final a0m3 = keyUp(m1, 6);
final a0m4 = keyUp(m3, 11);

final a0ms = [a0m1, a0m2, a0m3, a0m4];

final a071 = ChordDefinition(
  fret: [-1, 0, 2, 0, 2, 0],
  degrees: ['X', 'R', '5', 'b7', '3', '5'],
  fingering: [0, 0, 1, 0, 2, 0],
  colors: [1, 0, 1, 1, 1, 1],
);
final a072 = keyUp(d77, 1);
final a073 = keyUp(d74, 4);
final a074 = keyUp(d76, 4);
final a075 = keyUp(d75, 4);
final a076 = keyUp(d73, 6);
final a077 = keyUp(d71, 9);
final a078 = keyUp(d72, 9);
final a079 = keyUp(d78, 11);
final a0710 = keyUp(d77, 13);

final a07s = [a071, a072, a073, a074, a075, a076, a077, a078, a079, a0710];

final a0m71 = ChordDefinition(
  fret: [-1, 0, 2, 0, 1, 0],
  degrees: ['X', 'R', '5', 'b7', 'b3', '5'],
  fingering: [0, 0, 2, 0, 1, 0],
  colors: [1, 0, 1, 1, 1, 1],
);
final a0m72 = keyUp(m77, 0);
final a0m73 = keyUp(m74, 4);
final a0m74 = keyUp(m75, 4);
final a0m75 = keyUp(m76, 4);
final a0m76 = keyUp(m73, 6);
final a0m77 = keyUp(m71, 9);
final a0m78 = keyUp(m72, 9);
final a0m79 = keyUp(m78, 11);
final a0m710 = keyUp(m77, 12);

final a0m7s = [
  a0m71,
  a0m72,
  a0m73,
  a0m74,
  a0m75,
  a0m76,
  a0m77,
  a0m78,
  a0m79,
  a0m710,
];
