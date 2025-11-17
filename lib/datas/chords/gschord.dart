import 'package:my_app/datas/chords.dart';
import 'package:my_app/datas/chords/basic_form.dart';

final g1maj1 = keyUp(maj3, 0);
final g1maj2 = keyUp(maj4, 3);
final g1maj3 = keyUp(maj5, 5);
final g1maj4 = keyUp(maj1, 7);
final g1maj5 = keyUp(maj2, 10);

final g1majs = [g1maj1, g1maj2, g1maj3, g1maj4, g1maj5];

final g1m1 = keyUp(m2, 3);
final g1m2 = keyUp(m1, 5);
final g1m3 = keyUp(m3, 10);

final g1ms = [g1m1, g1m2, g1m3];

final g171 = keyUp(d77, 0);
final g172 = keyUp(d74, 3);
final g173 = keyUp(d76, 3);
final g174 = keyUp(d75, 3);
final g175 = keyUp(d73, 5);
final g176 = keyUp(d72, 8);
final g177 = keyUp(d71, 8);
final g178 = keyUp(d78, 10);
final g179 = keyUp(d77, 12);

final g17s = [g171, g172, g173, g174, g175, g176, g177, g178, g179];

// Am7 1번폼
final g1m71 = ChordDefinition(
  fret: [-1, -1, 1, 1, 0, 2],
  degrees: ['X', 'X', '5', 'R', 'b3', 'b7'],
  fingering: [0, 0, 1, 2, 0, 4],
  colors: [1, 1, 1, 0, 1, 1],
);
final g1m72 = keyUp(m74, 3);
final g1m73 = keyUp(m75, 3);
final g1m74 = keyUp(m76, 3);
final g1m75 = keyUp(m73, 5);
final g1m76 = keyUp(m71, 8);
final g1m77 = keyUp(m72, 8);
final g1m78 = keyUp(m78, 10);
final g1m79 = keyUp(m77, 11);

final g1m7s = [g1m71, g1m72, g1m73, g1m74, g1m75, g1m76, g1m77, g1m78, g1m79];
