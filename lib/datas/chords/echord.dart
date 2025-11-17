import 'package:my_app/datas/chords.dart';
import 'package:my_app/datas/chords/basic_form.dart';

final e0maj1 = ChordDefinition(
  fret: [0, 2, 2, 1, 0, 0],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [0, 3, 2, 1, 0, 0],
  colors: [0, 1, 0, 1, 1, 0],
);
final e0maj2 = keyUp(maj5, 1);
final e0maj3 = keyUp(maj1, 3);
final e0maj4 = keyUp(maj2, 6);
final e0maj5 = keyUp(maj3, 8);
final e0maj6 = keyUp(maj4, 11);

final e0majs = [e0maj1, e0maj2, e0maj3, e0maj4, e0maj5, e0maj6];

final e0m1 = ChordDefinition(
  fret: [0, 2, 2, 0, 0, 0],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [0, 2, 3, 0, 0, 0],
  colors: [0, 1, 0, 1, 1, 0],
);
final e0m2 = keyUp(m1, 1);
final e0m3 = keyUp(m3, 6);
final e0m4 = keyUp(m2, 11);

final e0ms = [e0m1, e0m2, e0m3, e0m4];

final e071 = ChordDefinition(
  fret: [0, 2, 0, 1, 0, 0],
  degrees: ['R', '5', 'b7', '3', '5', 'R'],
  fingering: [0, 2, 0, 1, 0, 0],
  colors: [0, 1, 1, 1, 1, 0],
);
final e072 = ChordDefinition(
  fret: [-1, -1, 0, 1, 0, 0],
  degrees: ['X', 'X', 'b7', '3', '5', 'R'],
  fingering: [0, 0, 0, 1, 0, 0],
  colors: [1, 1, 1, 1, 1, 0],
);
final e073 = ChordDefinition(
  fret: [0, -1, 0, 1, 0, -1],
  degrees: ['R', 'X', 'b7', '3', '5', 'X'],
  fingering: [0, 0, 0, 1, 0, 0],
  colors: [0, 1, 1, 1, 1, 1],
);
final e074 = keyUp(d73, 1);
final e075 = keyUp(d72, 4);
final e076 = keyUp(d71, 4);
final e077 = keyUp(d78, 6);
final e078 = keyUp(d77, 8);
final e079 = keyUp(d74, 11);
final e0710 = keyUp(d76, 11);
final e0711 = keyUp(d75, 11);

final e07s = [
  e071,
  e072,
  e073,
  e074,
  e075,
  e076,
  e077,
  e078,
  e079,
  e0710,
  e0711,
];

final e0m71 = ChordDefinition(
  fret: [0, 2, 0, 0, 0, 0],
  degrees: ['R', '5', 'b7', 'b3', '5', 'R'],
  fingering: [0, 1, 0, 0, 0, 0],
  colors: [0, 1, 1, 1, 1, 0],
);
final e0m72 = ChordDefinition(
  fret: [-1, -1, 0, 0, 0, 0],
  degrees: ['X', 'X', 'b7', 'b3', '5', 'R'],
  fingering: [0, 0, 0, 0, 0, 0],
  colors: [1, 1, 1, 1, 1, 0],
);
final e0m73 = ChordDefinition(
  fret: [0, -1, 0, 0, 0, -1],
  degrees: ['R', 'X', 'b7', 'b3', '5', 'X'],
  fingering: [0, 0, 0, 0, 0, 0],
  colors: [0, 1, 1, 1, 1, 1],
);
final e0m74 = keyUp(m73, 1);
final e0m75 = keyUp(m71, 4);
final e0m76 = keyUp(m72, 4);
final e0m77 = keyUp(m78, 6);
final e0m78 = keyUp(m77, 7);
final e0m79 = keyUp(m74, 11);
final e0m710 = keyUp(m75, 11);
final e0m711 = keyUp(m76, 11);

final e0m7s = [
  e0m71,
  e0m72,
  e0m73,
  e0m74,
  e0m75,
  e0m76,
  e0m77,
  e0m78,
  e0m79,
  e0m710,
  e0m711,
];
