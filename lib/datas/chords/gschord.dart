import 'package:guitar_helper/datas/chords.dart';
import 'package:guitar_helper/datas/chords/basic_form.dart';

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

final g1maj71 = keyUp(maj77, 0);
final g1maj72 = keyUp(maj76, 2);
final g1maj73 = keyUp(maj710, 3);
final g1maj74 = keyUp(maj74, 3);
final g1maj75 = keyUp(maj75, 3);
final g1maj76 = keyUp(maj73, 5);
final g1maj77 = keyUp(maj72, 7);
final g1maj78 = keyUp(maj71, 8);
final g1maj79 = keyUp(maj78, 10);
final g1maj710 = keyUp(maj79, 10);
final g1maj711 = keyUp(maj77, 12);

final g1maj7s = [
  g1maj71,
  g1maj72,
  g1maj73,
  g1maj74,
  g1maj75,
  g1maj76,
  g1maj77,
  g1maj78,
  g1maj79,
  g1maj710,
  g1maj711,
];

final g1sus741 = keyUp(sus742, 3);
final g1sus742 = keyUp(sus741, 5);
final g1sus743 = keyUp(sus743, 10);

final g1sus74s = [g1sus741, g1sus742, g1sus743];

final g1m7b51 = keyUp(m7b58, 2);
final g1m7b52 = keyUp(m7b59, 2);
final g1m7b53 = keyUp(m7b57, 3);
final g1m7b54 = keyUp(m7b56, 5);
final g1m7b55 = keyUp(m7b54, 8);
final g1m7b56 = keyUp(m7b55, 8);
final g1m7b57 = keyUp(m7b53, 9);
final g1m7b58 = keyUp(m7b52, 10);
final g1m7b59 = keyUp(m7b51, 11);

final g1m7b5s = [
  g1m7b51,
  g1m7b52,
  g1m7b53,
  g1m7b54,
  g1m7b55,
  g1m7b56,
  g1m7b57,
  g1m7b58,
  g1m7b59,
];
