import 'package:my_app/datas/chords.dart';
import 'package:my_app/datas/chords/basic_form.dart';

final f0maj1 = keyUp(maj4, 0);
final f0maj2 = ChordDefinition(
  fret: [-1, -1, 3, 2, 1, 1],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 4, 3, 1, 2],
  colors: [1, 1, 0, 1, 0, 1],
);
final f0maj3 = keyUp(maj5, 2);
final f0maj4 = keyUp(maj1, 4);
final f0maj5 = keyUp(maj2, 7);
final f0maj6 = keyUp(maj3, 9);
final f0maj7 = keyUp(maj4, 12);

final f0majs = [f0maj1, f0maj2, f0maj3, f0maj4, f0maj5, f0maj6];

final f0m1 = keyUp(m2, 0);
final f0m2 = keyUp(m1, 2);
final f0m3 = keyUp(m3, 7);
final f0m4 = keyUp(m2, 12);

final f0ms = [f0m1, f0m2, f0m3, f0m4];

final f071 = keyUp(d74, 0);
final f072 = keyUp(d76, 0);
final f073 = keyUp(d75, 0);
final f074 = keyUp(d73, 2);
final f075 = keyUp(d72, 5);
final f076 = keyUp(d71, 5);
final f077 = keyUp(d78, 7);
final f078 = keyUp(d77, 9);
final f079 = keyUp(d74, 12);
final f0710 = keyUp(d76, 12);
final f0711 = keyUp(d75, 12);

final f07s = [
  f071,
  f072,
  f073,
  f074,
  f075,
  f076,
  f077,
  f078,
  f079,
  f0710,
  f0711,
];

final f0m71 = keyUp(m74, 0);
final f0m72 = keyUp(m75, 0);
final f0m73 = keyUp(m76, 0);
final f0m74 = keyUp(m73, 2);
final f0m75 = keyUp(m71, 5);
final f0m76 = keyUp(m72, 5);
final f0m77 = keyUp(m78, 7);
final f0m78 = keyUp(m77, 8);
final f0m79 = keyUp(m74, 12);
final f0m710 = keyUp(m75, 12);
final f0m711 = keyUp(m76, 12);

final f0m7s = [
  f0m71,
  f0m72,
  f0m73,
  f0m74,
  f0m75,
  f0m76,
  f0m77,
  f0m78,
  f0m79,
  f0m710,
  f0m711,
];
