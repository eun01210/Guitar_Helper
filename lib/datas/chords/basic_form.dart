import 'package:my_app/datas/chords.dart';

ChordDefinition keyUp(ChordDefinition chord, int key) {
  final newFrets =
      chord.fret.map((fret) {
        return fret == -1 ? fret : fret + key;
      }).toList();

  return ChordDefinition(
    fret: newFrets,
    degrees: chord.degrees,
    fingering: chord.fingering,
    colors: chord.colors,
  );
}

// major =====================================

// C# 1번폼
const maj1 = ChordDefinition(
  fret: [-1, 4, 3, 1, 2, 1],
  degrees: ['X', 'R', '3', '5', 'R', '3'],
  fingering: [0, 4, 3, 1, 2, 1],
  colors: [1, 0, 1, 1, 0, 1],
);

// A# 1번폼
const maj2 = ChordDefinition(
  fret: [-1, 1, 3, 3, 3, 1],
  degrees: ['X', 'R', '5', 'R', '3', '5'],
  fingering: [0, 1, 2, 3, 4, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

// G# 1번폼
const maj3 = ChordDefinition(
  fret: [-1, -1, 1, 1, 1, 4],
  degrees: ['X', 'X', '5', 'R', '3', 'R'],
  fingering: [0, 0, 1, 1, 1, 4],
  colors: [1, 1, 1, 0, 1, 0],
);

// F 1번폼
const maj4 = ChordDefinition(
  fret: [1, 3, 3, 2, 1, 1],
  degrees: ['R', '5', 'R', '3', '5', 'R'],
  fingering: [1, 3, 4, 2, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

// D# 1번폼
const maj5 = ChordDefinition(
  fret: [-1, -1, 1, 3, 4, 3],
  degrees: ['X', 'X', 'R', '5', 'R', '3'],
  fingering: [0, 0, 1, 2, 4, 3],
  colors: [1, 1, 0, 1, 0, 1],
);

// minor =====================================

// D#m 1번폼
const m1 = ChordDefinition(
  fret: [-1, -1, 1, 3, 4, 2],
  degrees: ['X', 'X', 'R', '5', 'R', 'b3'],
  fingering: [0, 0, 1, 3, 4, 2],
  colors: [1, 1, 0, 1, 0, 1],
);

// Fm 1번폼
const m2 = ChordDefinition(
  fret: [1, 3, 3, 1, 1, 1],
  degrees: ['R', '5', 'R', 'b3', '5', 'R'],
  fingering: [1, 3, 4, 1, 1, 1],
  colors: [0, 1, 0, 1, 1, 0],
);

// A#m 1번폼
const m3 = ChordDefinition(
  fret: [-1, 1, 3, 3, 2, 1],
  degrees: ['X', 'R', '5', 'R', 'b3', '5'],
  fingering: [0, 1, 3, 4, 2, 1],
  colors: [1, 0, 1, 0, 1, 1],
);

// 7 =========================================

// C7 1(3)번폼
const d71 = ChordDefinition(
  fret: [-1, 3, 2, 3, 1, -1],
  degrees: ['X', 'R', '3', 'b7', 'R', 'X'],
  fingering: [0, 3, 2, 4, 1, 0],
  colors: [1, 0, 1, 1, 0, 1],
);

// C7 2번폼
const d72 = ChordDefinition(
  fret: [-1, -1, 2, 3, 1, 3],
  degrees: ['X', 'X', '3', 'b7', 'R', '5'],
  fingering: [0, 0, 2, 3, 1, 4],
  colors: [1, 1, 1, 1, 0, 1],
);

// D#7 1번폼
const d73 = ChordDefinition(
  fret: [-1, -1, 1, 3, 2, 3],
  degrees: ['X', 'X', 'R', '5', 'b7', '3'],
  fingering: [0, 0, 1, 3, 2, 4],
  colors: [1, 1, 0, 1, 1, 1],
);

// F7 1번폼
const d74 = ChordDefinition(
  fret: [1, 3, 1, 2, 1, 1],
  degrees: ['R', '5', 'b7', '3', '5', 'R'],
  fingering: [1, 3, 1, 2, 1, 1],
  colors: [0, 1, 1, 1, 1, 0],
);

// F7 2번폼
const d75 = ChordDefinition(
  fret: [-1, -1, 1, 2, 1, 1],
  degrees: ['X', 'X', 'b7', '3', '5', 'R'],
  fingering: [0, 0, 1, 2, 1, 1],
  colors: [1, 1, 1, 1, 1, 0],
);

// F7 3번폼
const d76 = ChordDefinition(
  fret: [1, -1, 1, 2, 1, -1],
  degrees: ['R', 'X', 'b7', '3', '5', 'X'],
  fingering: [1, 0, 2, 4, 3, 0],
  colors: [0, 1, 1, 1, 1, 1],
);

// G#7 1번폼
const d77 = ChordDefinition(
  fret: [-1, -1, 1, 1, 1, 2],
  degrees: ['X', 'X', '5', 'R', '3', 'b7'],
  fingering: [0, 0, 1, 1, 1, 2],
  colors: [1, 1, 1, 0, 1, 1],
);

// A#7 1번폼
const d78 = ChordDefinition(
  fret: [-1, 1, 3, 1, 3, 1],
  degrees: ['X', 'R', '5', 'b7', '3', '5'],
  fingering: [0, 1, 3, 1, 4, 1],
  colors: [1, 0, 1, 1, 1, 1],
);
