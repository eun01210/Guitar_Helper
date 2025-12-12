import 'package:guitar_helper/datas/chords.dart';
import 'package:guitar_helper/datas/chords/basic_form.dart';

final a1maj1 = keyUp(maj2, 0);
final a1maj2 = keyUp(maj3, 2);
final a1maj3 = keyUp(maj4, 5);
final a1maj4 = keyUp(maj5, 7);
final a1maj5 = keyUp(maj1, 9);
final a1maj6 = keyUp(maj2, 12);

final a1majs = [a1maj1, a1maj2, a1maj3, a1maj4, a1maj5, a1maj6];

final a1m1 = keyUp(m3, 0);
final a1m2 = keyUp(m2, 5);
final a1m3 = keyUp(m1, 7);
final a1m4 = keyUp(m3, 12);

final a1ms = [a1m1, a1m2, a1m3, a1m4];

final a171 = keyUp(d78, 0);
final a172 = keyUp(d77, 2);
final a173 = keyUp(d74, 5);
final a174 = keyUp(d76, 5);
final a175 = keyUp(d75, 5);
final a176 = keyUp(d73, 7);
final a177 = keyUp(d71, 10);
final a178 = keyUp(d72, 10);
final a179 = keyUp(d78, 12);

final a17s = [a171, a172, a173, a174, a175, a176, a177, a178, a179];

final a1m71 = keyUp(m78, 0);
final a1m72 = keyUp(m77, 1);
final a1m73 = keyUp(m74, 5);
final a1m74 = keyUp(m75, 5);
final a1m75 = keyUp(m76, 5);
final a1m76 = keyUp(m73, 7);
final a1m77 = keyUp(m71, 10);
final a1m78 = keyUp(m72, 10);
final a1m79 = keyUp(m78, 12);

final a1m7s = [a1m71, a1m72, a1m73, a1m74, a1m75, a1m76, a1m77, a1m78, a1m79];

final a1maj71 = keyUp(maj78, 0);
final a1maj72 = keyUp(maj79, 0);
final a1maj73 = keyUp(maj77, 2);
final a1maj74 = keyUp(maj76, 4);
final a1maj75 = keyUp(maj710, 5);
final a1maj76 = keyUp(maj74, 5);
final a1maj77 = keyUp(maj75, 5);
final a1maj78 = keyUp(maj73, 7);
final a1maj79 = keyUp(maj72, 9);
final a1maj710 = keyUp(maj71, 10);
final a1maj711 = keyUp(maj78, 12);
final a1maj712 = keyUp(maj79, 12);

final a1maj7s = [
  a1maj71,
  a1maj72,
  a1maj73,
  a1maj74,
  a1maj75,
  a1maj76,
  a1maj77,
  a1maj78,
  a1maj79,
  a1maj710,
  a1maj711,
  a1maj712,
];

final a1sus741 = keyUp(sus743, 0);
final a1sus742 = keyUp(sus742, 5);
final a1sus743 = keyUp(sus741, 7);

final a1sus74s = [a1sus741, a1sus742, a1sus743];

final a1m7b51 = ChordDefinition(
  fret: [-1, 1, -1, 1, 2, 0],
  degrees: ['X', 'R', 'X', 'b7', 'b3', 'b5'],
  fingering: [0, 1, 0, 2, 3, 0],
  colors: [1, 0, 1, 1, 1, 1],
);
final a1m7b52 = keyUp(m7b52, 0);
final a1m7b53 = keyUp(m7b51, 1);
final a1m7b54 = keyUp(m7b58, 4);
final a1m7b55 = keyUp(m7b59, 4);
final a1m7b56 = keyUp(m7b57, 5);
final a1m7b57 = keyUp(m7b56, 7);
final a1m7b58 = keyUp(m7b54, 10);
final a1m7b59 = keyUp(m7b55, 10);
final a1m7b510 = keyUp(m7b53, 11);
final a1m7b511 = keyUp(m7b52, 12);

final a1m7b5s = [
  a1m7b51,
  a1m7b52,
  a1m7b53,
  a1m7b54,
  a1m7b55,
  a1m7b56,
  a1m7b57,
  a1m7b58,
  a1m7b59,
  a1m7b510,
  a1m7b511,
];
