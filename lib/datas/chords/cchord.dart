import 'package:my_app/datas/chords.dart';
import 'package:my_app/datas/chords/basic_form.dart';

// 6번줄부터 표시
final c0maj1 = ChordDefinition(
  fret: [-1, 3, 2, 0, 1, 0],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [4, 3, 2, 0, 1, 0],
  colors: [1, 0, 1, 1, 0, 1],
);

final c0maj2 = keyUp(maj2, 2);
final c0maj3 = keyUp(maj3, 4);
final c0maj4 = keyUp(maj4, 7);
final c0maj5 = keyUp(maj5, 9);

final c0majs = [c0maj1, c0maj2, c0maj3, c0maj4, c0maj5];

final c0m1 = ChordDefinition(
  fret: [-1, 3, 1, 0, 1, 3],
  degrees: ['X', 'R', 'b3', '5', 'R', '5'],
  fingering: [0, 3, 1, 0, 2, 4],
  colors: [1, 0, 1, 1, 0, 1],
);

final c0m2 = keyUp(m3, 2);
final c0m3 = keyUp(m2, 7);
final c0m4 = keyUp(m1, 9);

final c0ms = [c0m1, c0m2, c0m3, c0m4];

final c071 = ChordDefinition(
  fret: [-1, 3, 2, 3, 1, 0],
  degrees: ['X', 'R', '3', 'b7', 'R', '3'],
  fingering: [0, 3, 2, 4, 1, 0],
  colors: [1, 0, 1, 1, 0, 1],
);

final c072 = keyUp(d72, 0);
final c073 = keyUp(d71, 0);
final c074 = keyUp(d78, 2);
final c075 = keyUp(d77, 4);
final c076 = keyUp(d74, 7);
final c077 = keyUp(d76, 7);
final c078 = keyUp(d75, 7);
final c079 = keyUp(d73, 9);
final c0710 = keyUp(d71, 12);
final c0711 = keyUp(d72, 12);

final c07s = [
  c071,
  c072,
  c073,
  c074,
  c075,
  c076,
  c077,
  c078,
  c079,
  c0710,
  c0711,
];

final c0m71 = keyUp(m71, 0);
final c0m72 = keyUp(m72, 0);
final c0m73 = keyUp(m78, 2);
final c0m74 = keyUp(m77, 3);
final c0m75 = keyUp(m74, 7);
final c0m76 = keyUp(m75, 7);
final c0m77 = keyUp(m76, 7);
final c0m78 = keyUp(m73, 9);
final c0m79 = keyUp(m71, 12);
final c0m710 = keyUp(m72, 12);

final c0m7s = [
  c0m71,
  c0m72,
  c0m73,
  c0m74,
  c0m75,
  c0m76,
  c0m77,
  c0m78,
  c0m79,
  c0m710,
];
