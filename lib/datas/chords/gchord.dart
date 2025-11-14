import 'package:my_app/datas/chords.dart';
import 'package:my_app/datas/chords/basic_form.dart';

final g0maj1 = ChordDefinition(
  fret: [3, 2, 0, 0, 0, 3],
  degrees: ['R', '3', '5', 'R', '3', 'R'],
  fingering: [2, 1, 0, 0, 0, 3],
  colors: [0, 1, 1, 0, 1, 0],
);
final g0maj2 = keyUp(maj4, 2);
final g0maj3 = keyUp(maj5, 4);
final g0maj4 = keyUp(maj1, 6);
final g0maj5 = keyUp(maj2, 9);

final g0majs = [g0maj1, g0maj2, g0maj3, g0maj4, g0maj5];

final g0m1 = keyUp(m2, 2);
final g0m2 = keyUp(m1, 4);
final g0m3 = keyUp(m3, 9);

final g0ms = [g0m1, g0m2, g0m3];

final g071 = ChordDefinition(
  fret: [3, 2, 0, 0, 0, 1],
  degrees: ['R', '3', '5', 'R', '3', 'b7'],
  fingering: [3, 2, 0, 0, 0, 1],
  colors: [0, 1, 1, 0, 1, 1],
);
final g072 = ChordDefinition(
  fret: [-1, -1, 0, 0, 0, 1],
  degrees: ['X', 'X', '5', 'R', '3', 'b7'],
  fingering: [0, 0, 0, 0, 0, 1],
  colors: [1, 1, 1, 0, 1, 1],
);
final g073 = keyUp(d74, 2);
final g074 = keyUp(d76, 2);
final g075 = keyUp(d75, 2);
final g076 = keyUp(d73, 4);
final g077 = keyUp(d72, 7);
final g078 = keyUp(d71, 7);
final g079 = keyUp(d78, 9);
final g0710 = keyUp(d77, 11);

final g07s = [g071, g072, g073, g074, g075, g076, g077, g078, g079, g0710];
