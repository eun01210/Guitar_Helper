import 'package:guitar_helper/widgets/note.dart';
import 'package:guitar_helper/datas/chords.dart';

// 한 프렛을 만드는 함수 (6개의 노트)
List<NoteData?> makeFret(int fretNumber, ChordDefinition chord, bool finger) {
  return List.generate(6, (index) {
    if (chord.fret[index] == fretNumber) {
      return NoteData(
        text: finger ? chord.fingering[index].toString() : chord.degrees[index],
        color: colorTable[chord.colors[index]],
      );
    } else {
      return null;
    }
  });
}

// 코드 데이터를 가져오는 함수
List<ChordDefinition> chordCheck(String? chord, int accident, String? ext) {
  String chordName = (chord ?? "") + accident.toString() + (ext ?? "");
  return chords[chordName] ?? [];
}

// 코드에 맞게 프렛을 만드는 함수 (특정 부분만 잘라서 사용됨)
List<List<NoteData?>> makeChordFret(
  String? chord, // 코드, C->0, D->1 ... chordMap 참고
  int accident, // 올림 내림 여부, 0->x, 1->#, -1->b
  String? ext, // 익스텐션 코드 변경 여부, m, m7, M7 ...
  int form, // 폼, 해당 코드의 폼 (C를 잡는 방식에도 여러 방법이 있음)
  bool finger, // 도 표시 / 손가락 표시 변경
) {
  List<ChordDefinition> myChords = chordCheck(chord, accident, ext);
  if (myChords.isEmpty) {
    return List.generate(25, (index) {
      return List.generate(6, (index) {
        return null;
      });
    });
  } else {
    return List.generate(25, (index) {
      return makeFret(index, myChords[form], finger);
    });
  }
}
