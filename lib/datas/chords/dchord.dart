import 'package:my_app/datas/chords.dart';
import 'package:my_app/datas/chords/basic_form.dart';

final d0maj1 = ChordDefinition(
  fret: [-1, -1, 0, 2, 3, 2],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 0, 1, 3, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

final d0maj2 = keyUp(maj1, 1);
final d0maj3 = keyUp(maj2, 4);
final d0maj4 = keyUp(maj3, 6);
final d0maj5 = keyUp(maj4, 9);
final d0maj6 = keyUp(maj5, 11);

final d0majs = [d0maj1, d0maj2, d0maj3, d0maj4, d0maj5, d0maj6];

final d0m1 = ChordDefinition(
  fret: [-1, -1, 0, 2, 3, 1],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 0, 2, 3, 1],
  colors: [1, 1, 0, 1, 0, 1],
);

final d0m2 = keyUp(m3, 4);
final d0m3 = keyUp(m2, 9);
final d0m4 = keyUp(m1, 11);

final d0ms = [d0m1, d0m2, d0m3, d0m4];

final d071 = ChordDefinition(
  fret: [-1, -1, 0, 2, 1, 2],
  degrees: ['X', 'X', 'R', '5', 'b7', '3'],
  fingering: [0, 0, 0, 2, 1, 3],
  colors: [1, 1, 0, 1, 1, 1],
);

final d072 = keyUp(d72, 2);
final d073 = keyUp(d71, 2);
final d074 = keyUp(d78, 4);
final d075 = keyUp(d77, 6);
final d076 = keyUp(d74, 9);
final d077 = keyUp(d76, 9);
final d078 = keyUp(d75, 9);
final d079 = keyUp(d73, 11);

final d07s = [d071, d072, d073, d074, d075, d076, d077, d078, d079];
