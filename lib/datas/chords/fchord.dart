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

final f0maj71 = ChordDefinition(
  fret: [-1, -1, 3, 2, 1, 0],
  degrees: ['X', 'X', 'R', '3', '5', '7'],
  fingering: [0, 0, 3, 2, 1, 0],
  colors: [1, 1, 0, 1, 1, 1],
);
final f0maj72 = keyUp(maj710, 0);
final f0maj73 = keyUp(maj74, 0);
final f0maj74 = keyUp(maj75, 0);
final f0maj75 = keyUp(maj73, 2);
final f0maj76 = keyUp(maj72, 4);
final f0maj77 = keyUp(maj71, 5);
final f0maj78 = keyUp(maj78, 7);
final f0maj79 = keyUp(maj79, 7);
final f0maj710 = keyUp(maj77, 9);
final f0maj711 = keyUp(maj76, 11);
final f0maj712 = keyUp(maj710, 12);
final f0maj713 = keyUp(maj74, 12);
final f0maj714 = keyUp(maj75, 12);

final f0maj7s = [
  f0maj71,
  f0maj72,
  f0maj73,
  f0maj74,
  f0maj75,
  f0maj76,
  f0maj77,
  f0maj78,
  f0maj79,
  f0maj710,
  f0maj711,
  f0maj712,
  f0maj713,
  f0maj714,
];

final f0sus741 = keyUp(sus742, 0);
final f0sus742 = keyUp(sus741, 2);
final f0sus743 = keyUp(sus743, 7);
final f0sus744 = keyUp(sus742, 12);

final f0sus74s = [f0sus741, f0sus742, f0sus743, f0sus744];
