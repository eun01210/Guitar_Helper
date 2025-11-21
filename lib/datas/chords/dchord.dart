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

const d0m71 = ChordDefinition(
  fret: [-1, -1, 0, 2, 1, 1],
  degrees: ['X', 'X', 'R', '5', 'b7', 'b3'],
  fingering: [0, 0, 0, 3, 1, 2],
  colors: [1, 1, 0, 1, 1, 1],
);
final d0m72 = keyUp(m71, 2);
final d0m73 = keyUp(m72, 2);
final d0m74 = keyUp(m78, 4);
final d0m75 = keyUp(m77, 5);
final d0m76 = keyUp(m74, 9);
final d0m77 = keyUp(m75, 9);
final d0m78 = keyUp(m76, 9);
final d0m79 = keyUp(m73, 11);

final d0m7s = [d0m71, d0m72, d0m73, d0m74, d0m75, d0m76, d0m77, d0m78, d0m79];

final d0maj71 = ChordDefinition(
  fret: [-1, -1, 0, 2, 2, 2],
  degrees: ['X', 'X', 'R', '5', '7', '3'],
  fingering: [0, 0, 0, 1, 1, 1],
  colors: [1, 1, 0, 1, 1, 1],
);
final d0maj72 = keyUp(maj72, 1);
final d0maj73 = keyUp(maj71, 2);
final d0maj74 = keyUp(maj78, 4);
final d0maj75 = keyUp(maj79, 4);
final d0maj76 = keyUp(maj77, 6);
final d0maj77 = keyUp(maj76, 8);
final d0maj78 = keyUp(maj710, 9);
final d0maj79 = keyUp(maj74, 9);
final d0maj710 = keyUp(maj75, 9);
final d0maj711 = keyUp(maj73, 11);

final d0maj7s = [
  d0maj71,
  d0maj72,
  d0maj73,
  d0maj74,
  d0maj75,
  d0maj76,
  d0maj77,
  d0maj78,
  d0maj79,
  d0maj710,
  d0maj711,
];

final d0sus741 = ChordDefinition(
  fret: [-1, -1, 0, 2, 1, 3],
  degrees: ['X', 'X', 'R', '5', 'b7', '4'],
  fingering: [0, 0, 0, 2, 1, 4],
  colors: [1, 1, 0, 1, 1, 1],
);
final d0sus742 = keyUp(sus743, 4);
final d0sus743 = keyUp(sus742, 9);
final d0sus744 = keyUp(sus741, 11);

final d0sus74s = [d0sus741, d0sus742, d0sus743, d0sus744];
