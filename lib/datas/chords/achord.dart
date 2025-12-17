import 'package:guitar_helper/datas/chords.dart';
import 'package:guitar_helper/datas/chords/basic_form.dart';

final a0maj1 = ChordDefinition(
  fret: [-1, 0, 2, 2, 2, 0],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 0, 1, 2, 3, 0],
  colors: [1, 0, 1, 0, 1, 1],
);
final a0maj2 = keyUp(maj3, 1);
final a0maj3 = keyUp(maj4, 4);
final a0maj4 = keyUp(maj5, 6);
final a0maj5 = keyUp(maj1, 8);
final a0maj6 = keyUp(maj2, 11);

final a0majs = [a0maj1, a0maj2, a0maj3, a0maj4, a0maj5, a0maj6];

final a0m1 = ChordDefinition(
  fret: [-1, 0, 2, 2, 1, 0],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 0, 2, 3, 1, 0],
  colors: [1, 0, 1, 0, 1, 1],
);
final a0m2 = keyUp(m2, 4);
final a0m3 = keyUp(m1, 6);
final a0m4 = keyUp(m3, 11);

final a0ms = [a0m1, a0m2, a0m3, a0m4];

final a071 = ChordDefinition(
  fret: [-1, 0, 2, 0, 2, 0],
  degrees: ['X', 'R', '5', 'b7', '3', '5'],
  fingering: [0, 0, 1, 0, 2, 0],
  colors: [1, 0, 1, 1, 1, 1],
);
final a072 = keyUp(d77, 1);
final a073 = keyUp(d74, 4);
final a074 = keyUp(d76, 4);
final a075 = keyUp(d75, 4);
final a076 = keyUp(d73, 6);
final a077 = keyUp(d71, 9);
final a078 = keyUp(d72, 9);
final a079 = keyUp(d78, 11);
final a0710 = keyUp(d77, 13);

final a07s = [a071, a072, a073, a074, a075, a076, a077, a078, a079, a0710];

final a0m71 = ChordDefinition(
  fret: [-1, 0, 2, 0, 1, 0],
  degrees: ['X', 'R', '5', 'b7', 'b3', '5'],
  fingering: [0, 0, 2, 0, 1, 0],
  colors: [1, 0, 1, 1, 1, 1],
);
final a0m72 = keyUp(m77, 0);
final a0m73 = keyUp(m74, 4);
final a0m74 = keyUp(m75, 4);
final a0m75 = keyUp(m76, 4);
final a0m76 = keyUp(m73, 6);
final a0m77 = keyUp(m71, 9);
final a0m78 = keyUp(m72, 9);
final a0m79 = keyUp(m78, 11);
final a0m710 = keyUp(m77, 12);

final a0m7s = [
  a0m71,
  a0m72,
  a0m73,
  a0m74,
  a0m75,
  a0m76,
  a0m77,
  a0m78,
  a0m79,
  a0m710,
];

final a0maj71 = ChordDefinition(
  fret: [-1, 0, 2, 1, 2, 0],
  degrees: ['X', 'R', '5', '7', '3', '5'],
  fingering: [0, 0, 2, 1, 3, 0],
  colors: [1, 0, 1, 1, 1, 1],
);
final a0maj72 = ChordDefinition(
  fret: [0, 0, 2, 1, 2, 0],
  degrees: ['5', 'R', '5', '7', '3', '5'],
  fingering: [0, 0, 2, 1, 3, 0],
  colors: [1, 0, 1, 1, 1, 1],
);
final a0maj73 = keyUp(maj77, 1);
final a0maj74 = keyUp(maj76, 3);
final a0maj75 = keyUp(maj710, 4);
final a0maj76 = keyUp(maj74, 4);
final a0maj77 = keyUp(maj75, 4);
final a0maj78 = keyUp(maj73, 6);
final a0maj79 = keyUp(maj72, 8);
final a0maj710 = keyUp(maj71, 9);
final a0maj711 = keyUp(maj78, 11);
final a0maj712 = keyUp(maj79, 11);

final a0maj7s = [
  a0maj71,
  a0maj72,
  a0maj73,
  a0maj74,
  a0maj75,
  a0maj76,
  a0maj77,
  a0maj78,
  a0maj79,
  a0maj710,
  a0maj711,
  a0maj712,
];

final a0sus741 = ChordDefinition(
  fret: [-1, 0, 2, 0, 3, 0],
  degrees: ['X', 'R', '5', 'b7', '4', '5'],
  fingering: [0, 0, 2, 0, 4, 0],
  colors: [1, 0, 1, 1, 1, 1],
);
final a0sus742 = keyUp(sus742, 4);
final a0sus743 = keyUp(sus741, 6);
final a0sus744 = keyUp(sus743, 11);

final a0sus74s = [a0sus741, a0sus742, a0sus743, a0sus744];

final a0m7b51 = ChordDefinition(
  fret: [-1, 0, 1, 0, 1, -1],
  degrees: ['X', 'R', 'b5', 'b7', 'b3', 'X'],
  fingering: [0, 0, 1, 0, 2, 0],
  colors: [1, 0, 1, 1, 1, 1],
);
final a0m7b52 = keyUp(m7b51, 0);
final a0m7b53 = keyUp(m7b58, 3);
final a0m7b54 = keyUp(m7b59, 3);
final a0m7b55 = keyUp(m7b57, 4);
final a0m7b56 = keyUp(m7b56, 6);
final a0m7b57 = keyUp(m7b54, 9);
final a0m7b58 = keyUp(m7b55, 9);
final a0m7b59 = keyUp(m7b53, 10);
final a0m7b510 = keyUp(m7b52, 11);
final a0m7b511 = keyUp(m7b51, 12);

final a0m7b5s = [
  a0m7b51,
  a0m7b52,
  a0m7b53,
  a0m7b54,
  a0m7b55,
  a0m7b56,
  a0m7b57,
  a0m7b58,
  a0m7b59,
  a0m7b510,
  a0m7b511,
];
