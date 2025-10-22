import 'package:my_app/datas/chords/cchord.dart';
import 'package:my_app/datas/chords/dchord.dart';
import 'package:my_app/datas/chords/echord.dart';
import 'package:my_app/datas/chords/fchord.dart';
import 'package:my_app/datas/chords/gchord.dart';
import 'package:my_app/datas/chords/achord.dart';
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
  'C0maj': c0majs,
  'D0maj': d0majs,
  'E0maj': e0majs,
  'F0maj': f0majs,
  'G0maj': g0majs,
  'A0maj': a0majs,
  'B0maj': b0majs,
};
