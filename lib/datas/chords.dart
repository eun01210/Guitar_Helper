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

final Map<String, List<ChordDefinition>> chords = {
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

  // 도미넌트 세븐스
  'C-17': b07s,
  'C07': c07s,
  'C17': c17s,

  'D-17': c17s,
  'D07': d07s,
  'D17': d17s,

  'E-17': d17s,
  'E07': e07s,
  'E17': f07s,

  'F-17': e07s,
  'F07': f07s,
  'F17': f17s,

  'G-17': f17s,
  'G07': g07s,
  'G17': g17s,

  'A-17': g17s,
  'A07': a07s,
  'A17': a17s,

  'B-17': a17s,
  'B07': b07s,
  'B17': c07s,

  // 마이너 세븐스
  'C-1m7': b0m7s,
  'C0m7': c0m7s,
  'C1m7': c1m7s,

  'D-1m7': c1m7s,
  'D0m7': d0m7s,
  'D1m7': d1m7s,

  'E-1m7': d1m7s,
  'E0m7': e0m7s,
  'E1m7': f0m7s,

  'F-1m7': e0m7s,
  'F0m7': f0m7s,
  'F1m7': f1m7s,

  'G-1m7': f1m7s,
  'G0m7': g0m7s,
  'G1m7': g1m7s,

  'A-1m7': g1m7s,
  'A0m7': a0m7s,
  'A1m7': a1m7s,

  'B-1m7': a1m7s,
  'B0m7': b0m7s,
  'B1m7': c0m7s,

  // 메이저 세븐스
  'C-1M7': b0maj7s,
  'C0M7': c0maj7s,
  'C1M7': c1maj7s,

  'D-1M7': c1maj7s,
  'D0M7': d0maj7s,
  'D1M7': d1maj7s,

  'E-1M7': d1maj7s,
  'E0M7': e0maj7s,
  'E1M7': f0maj7s,

  'F-1M7': e0maj7s,
  'F0M7': f0maj7s,
  'F1M7': f1maj7s,

  'G-1M7': f1maj7s,
  'G0M7': g0maj7s,
  'G1M7': g1maj7s,

  'A-1M7': g1maj7s,
  'A0M7': a0maj7s,
  'A1M7': a1maj7s,

  'B-1M7': a1maj7s,
  'B0M7': b0maj7s,
  'B1M7': c0maj7s,

  // 세븐스서스포
  'C-17sus4': b0sus74s,
  'C07sus4': c0sus74s,
  'C17sus4': c1sus74s,

  'D-17sus4': c1sus74s,
  'D07sus4': d0sus74s,
  'D17sus4': d1sus74s,

  'E-17sus4': d1sus74s,
  'E07sus4': e0sus74s,
  'E17sus4': f0sus74s,

  'F-17sus4': e0sus74s,
  'F07sus4': f0sus74s,
  'F17sus4': f1sus74s,

  'G-17sus4': f1sus74s,
  'G07sus4': g0sus74s,
  'G17sus4': g1sus74s,

  'A-17sus4': g1sus74s,
  'A07sus4': a0sus74s,
  'A17sus4': a1sus74s,

  'B-17sus4': a1sus74s,
  'B07sus4': b0sus74s,
  'B17sus4': c0sus74s,
};
