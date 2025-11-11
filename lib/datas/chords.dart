import 'package:my_app/datas/chords/cchord.dart';
import 'package:my_app/datas/chords/cschord.dart';
import 'package:my_app/datas/chords/dchord.dart';
import 'package:my_app/datas/chords/dschord.dart';
import 'package:my_app/datas/chords/echord.dart';
import 'package:my_app/datas/chords/fchord.dart';
import 'package:my_app/datas/chords/fschord.dart';
import 'package:my_app/datas/chords/gchord.dart';
import 'package:my_app/datas/chords/gschord.dart';
import 'package:my_app/datas/chords/achord.dart';
import 'package:my_app/datas/chords/aschord.dart';
import 'package:my_app/datas/chords/bchord.dart';

class ChordDefinition {
  final List<int> fret; // 해당 줄의 프렛 번호
  final List<String> degrees; // 해당 줄의 도
  final List<int> fingering; // 해당 줄의 손가락 번호
  final List<int> colors; // 노드의 색

  const ChordDefinition({
    required this.fret,
    required this.degrees,
    required this.fingering,
    required this.colors,
  });
}

const Map<String, List<ChordDefinition>> chords = {
  // 메이저
  'C-1maj': b0majs,
  'C0maj': c0majs,
  'C1maj': c1majs,

  'D-1maj': c1majs,
  'D0maj': d0majs,
  'D1maj': d1majs,

  'E-1maj': d1majs,
  'E0maj': e0majs,
  'E1maj': f0majs,

  'F-1maj': e0majs,
  'F0maj': f0majs,
  'F1maj': f1majs,

  'G-1maj': f1majs,
  'G0maj': g0majs,
  'G1maj': g1majs,

  'A-1maj': g1majs,
  'A0maj': a0majs,
  'A1maj': a1majs,

  'B-1maj': a1majs,
  'B0maj': b0majs,
  'B1maj': c0majs,

  // 마이너
  'C-1m': b0ms,
  'C0m': c0ms,
  'C1m': c1ms,

  'D-1m': c1ms,
  'D0m': d0ms,
  'D1m': d1ms,

  'E-1m': d1ms,
  'E0m': e0ms,
  'E1m': f0ms,

  'F-1m': e0ms,
  'F0m': f0ms,
  'F1m': f1ms,

  'G-1m': f1ms,
  'G0m': g0ms,
  'G1m': g1ms,

  'A-1m': g1ms,
  'A0m': a0ms,
  'A1m': a1ms,

  'B-1m': a1ms,
  'B0m': b0ms,
  'B1m': c0ms,
};
