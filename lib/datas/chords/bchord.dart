import 'package:my_app/datas/chords.dart';
import 'package:my_app/datas/chords/basic_form.dart';

final b0maj1 = keyUp(maj2, 1);
final b0maj2 = keyUp(maj3, 3);
final b0maj3 = keyUp(maj4, 6);
final b0maj4 = keyUp(maj5, 8);
final b0maj5 = keyUp(maj1, 10);

final b0majs = [b0maj1, b0maj2, b0maj3, b0maj4, b0maj5];

final b0m1 = keyUp(m3, 1);
final b0m2 = keyUp(m2, 6);
final b0m3 = keyUp(m1, 8);

final b0ms = [b0m1, b0m2, b0m3];

final b071 = ChordDefinition(
  fret: [-1, 2, 1, 2, 0, 2],
  degrees: ['X', 'R', '3', 'b7', 'R', '5'],
  fingering: [0, 2, 1, 3, 0, 4],
  colors: [1, 0, 1, 1, 0, 1],
);

final b072 = ChordDefinition(
  fret: [-1, -1, 1, 2, 0, 2],
  degrees: ['X', 'X', '3', 'b7', 'R', '5'],
  fingering: [0, 0, 1, 2, 0, 3],
  colors: [1, 1, 1, 1, 0, 1],
);

final b073 = ChordDefinition(
  fret: [-1, 2, 1, 2, 0, -1],
  degrees: ['X', 'R', '3', 'b7', 'R', 'X'],
  fingering: [0, 2, 1, 3, 0, 0],
  colors: [1, 0, 1, 1, 0, 1],
);

final b074 = keyUp(d78, 1);
final b075 = keyUp(d77, 3);
final b076 = keyUp(d74, 6);
final b077 = keyUp(d76, 6);
final b078 = keyUp(d75, 6);
final b079 = keyUp(d73, 8);
final b0710 = keyUp(d71, 11);
final b0711 = keyUp(d72, 11);

final b07s = [
  b071,
  b072,
  b073,
  b074,
  b075,
  b076,
  b077,
  b078,
  b079,
  b0710,
  b0711,
];
