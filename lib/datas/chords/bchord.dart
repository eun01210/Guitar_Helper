import 'package:guitar_helper/datas/chords.dart';
import 'package:guitar_helper/datas/chords/basic_form.dart';

final b0maj1 = keyUp(maj2, 1);
final b0maj2 = keyUp(maj3, 3);
final b0maj3 = keyUp(maj4, 6);
final b0maj4 = keyUp(maj5, 8);
final b0maj5 = keyUp(maj1, 10);

final b0majs = [b0maj1, b0maj2, b0maj3, b0maj4, b0maj5];

final b0m1 = keyUp(m3, 1);
final b0m2 = keyUp(m2, 6);
final b0m3 = keyUp(m1, 8);

final b0ms = [b0m1, b0m2, b0m3];

final b071 = ChordDefinition(
  fret: [-1, 2, 1, 2, 0, 2],
  degrees: ['X', 'R', '3', 'b7', 'R', '5'],
  fingering: [0, 2, 1, 3, 0, 4],
  colors: [1, 0, 1, 1, 0, 1],
);
final b072 = ChordDefinition(
  fret: [-1, -1, 1, 2, 0, 2],
  degrees: ['X', 'X', '3', 'b7', 'R', '5'],
  fingering: [0, 0, 1, 2, 0, 3],
  colors: [1, 1, 1, 1, 0, 1],
);
final b073 = ChordDefinition(
  fret: [-1, 2, 1, 2, 0, -1],
  degrees: ['X', 'R', '3', 'b7', 'R', 'X'],
  fingering: [0, 2, 1, 3, 0, 0],
  colors: [1, 0, 1, 1, 0, 1],
);
final b074 = keyUp(d78, 1);
final b075 = keyUp(d77, 3);
final b076 = keyUp(d74, 6);
final b077 = keyUp(d76, 6);
final b078 = keyUp(d75, 6);
final b079 = keyUp(d73, 8);
final b0710 = keyUp(d71, 11);
final b0711 = keyUp(d72, 11);

final b07s = [
  b071,
  b072,
  b073,
  b074,
  b075,
  b076,
  b077,
  b078,
  b079,
  b0710,
  b0711,
];

final b0m71 = ChordDefinition(
  fret: [-1, 0, 0, 2, 0, 2],
  degrees: ['X', 'b7', 'b3', 'b7', 'R', '5'],
  fingering: [0, 0, 0, 1, 0, 2],
  colors: [1, 1, 1, 1, 0, 1],
);
final b0m72 = keyUp(m78, 1);
final b0m73 = keyUp(m77, 2);
final b0m74 = keyUp(m74, 6);
final b0m75 = keyUp(m75, 6);
final b0m76 = keyUp(m76, 6);
final b0m77 = keyUp(m73, 8);
final b0m78 = keyUp(m71, 11);
final b0m79 = keyUp(m72, 11);

final b0m7s = [b0m71, b0m72, b0m73, b0m74, b0m75, b0m76, b0m77, b0m78, b0m79];

final b0maj71 = ChordDefinition(
  fret: [-1, -1, 1, 3, 0, 2],
  degrees: ['X', 'X', '3', '7', 'R', '5'],
  fingering: [0, 0, 1, 4, 0, 3],
  colors: [1, 1, 1, 1, 0, 1],
);
final b0maj72 = keyUp(maj78, 1);
final b0maj73 = keyUp(maj79, 1);
final b0maj74 = keyUp(maj77, 3);
final b0maj75 = keyUp(maj76, 5);
final b0maj76 = keyUp(maj710, 6);
final b0maj77 = keyUp(maj74, 6);
final b0maj78 = keyUp(maj75, 6);
final b0maj79 = keyUp(maj73, 8);
final b0maj710 = keyUp(maj72, 10);
final b0maj711 = keyUp(maj71, 11);

final b0maj7s = [
  b0maj71,
  b0maj72,
  b0maj73,
  b0maj74,
  b0maj75,
  b0maj76,
  b0maj77,
  b0maj78,
  b0maj79,
  b0maj710,
  b0maj711,
];

final b0sus741 = keyUp(sus743, 1);
final b0sus742 = keyUp(sus742, 6);
final b0sus743 = keyUp(sus741, 8);

final b0sus74s = [b0sus741, b0sus742, b0sus743];

final b0m7b51 = ChordDefinition(
  fret: [-1, 0, 0, 2, 0, 1],
  degrees: ['X', 'b7', 'b3', 'b7', 'R', 'b5'],
  fingering: [0, 0, 0, 2, 0, 1],
  colors: [1, 1, 1, 1, 0, 1],
);
final b0m7b52 = ChordDefinition(
  fret: [-1, -1, 0, 2, 0, 1],
  degrees: ['X', 'X', 'b3', 'b7', 'R', 'b5'],
  fingering: [0, 0, 0, 2, 0, 1],
  colors: [1, 1, 1, 1, 0, 1],
);
final b0m7b53 = keyUp(m7b53, 0);
final b0m7b54 = keyUp(m7b52, 1);
final b0m7b55 = keyUp(m7b51, 2);
final b0m7b56 = keyUp(m7b58, 5);
final b0m7b57 = keyUp(m7b59, 5);
final b0m7b58 = keyUp(m7b57, 6);
final b0m7b59 = keyUp(m7b56, 8);
final b0m7b510 = keyUp(m7b54, 11);
final b0m7b511 = keyUp(m7b55, 11);
final b0m7b512 = keyUp(m7b53, 12);
final b0m7b513 = keyUp(m7b53, 13);

final b0m7b5s = [
  b0m7b51,
  b0m7b52,
  b0m7b53,
  b0m7b54,
  b0m7b55,
  b0m7b56,
  b0m7b57,
  b0m7b58,
  b0m7b59,
  b0m7b510,
  b0m7b511,
  b0m7b512,
  b0m7b513,
];
