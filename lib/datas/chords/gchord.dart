import 'package:guitar_helper/datas/chords.dart';
import 'package:guitar_helper/datas/chords/basic_form.dart';

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

final g0m71 = keyUp(m74, 2);
final g0m72 = keyUp(m75, 2);
final g0m73 = keyUp(m76, 2);
final g0m74 = keyUp(m73, 4);
final g0m75 = keyUp(m71, 7);
final g0m76 = keyUp(m72, 7);
final g0m77 = keyUp(m78, 9);
final g0m78 = keyUp(m77, 10);

final g0m7s = [g0m71, g0m72, g0m73, g0m74, g0m75, g0m76, g0m77, g0m78];

final g0maj71 = ChordDefinition(
  fret: [-1, 2, 0, 0, 0, 2],
  degrees: ['X', '3', '5', 'R', '3', '7'],
  fingering: [0, 2, 0, 0, 0, 3],
  colors: [1, 1, 1, 0, 1, 1],
);
final g0maj72 = keyUp(maj76, 1);
final g0maj73 = keyUp(maj710, 2);
final g0maj74 = keyUp(maj74, 2);
final g0maj75 = keyUp(maj75, 2);
final g0maj76 = keyUp(maj73, 4);
final g0maj77 = keyUp(maj72, 6);
final g0maj78 = keyUp(maj71, 7);
final g0maj79 = keyUp(maj78, 9);
final g0maj710 = keyUp(maj79, 9);
final g0maj711 = keyUp(maj77, 11);

final g0maj7s = [
  g0maj71,
  g0maj72,
  g0maj73,
  g0maj74,
  g0maj75,
  g0maj76,
  g0maj77,
  g0maj78,
  g0maj79,
  g0maj710,
  g0maj711,
];

final g0sus741 = keyUp(sus742, 2);
final g0sus742 = keyUp(sus741, 4);
final g0sus743 = keyUp(sus743, 9);

final g0sus74s = [g0sus741, g0sus742, g0sus743];

final g0m7b51 = keyUp(m7b58, 1);
final g0m7b52 = keyUp(m7b59, 1);
final g0m7b53 = keyUp(m7b57, 2);
final g0m7b54 = keyUp(m7b56, 4);
final g0m7b55 = keyUp(m7b54, 7);
final g0m7b56 = keyUp(m7b55, 7);
final g0m7b57 = keyUp(m7b53, 8);
final g0m7b58 = keyUp(m7b52, 9);
final g0m7b59 = keyUp(m7b51, 10);

final g0m7b5s = [
  g0m7b51,
  g0m7b52,
  g0m7b53,
  g0m7b54,
  g0m7b55,
  g0m7b56,
  g0m7b57,
  g0m7b58,
  g0m7b59,
];
