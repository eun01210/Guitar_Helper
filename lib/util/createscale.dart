import 'package:guitar_helper/widgets/note.dart'; // NoteData를 위해 추가
import 'package:guitar_helper/datas/scales.dart';

// 스케일에 해당하는 음인 경우 노트 표시
NoteData? check(
  int data,
  List<int> scale,
  List<String> texts,
  List<int> colors,
) {
  final idx = scale.indexOf(data);

  if (idx > -1) {
    return NoteData(text: texts[idx], color: colorTable[colors[idx]]);
  }
  return null;
}

// 한 프렛을 만드는 함수
List<NoteData?> makeFret(
  int fretNumber,
  List<int> scale,
  List<String> texts,
  List<int> colors,
) {
  const standard = [4, 9, 2, 7, 11, 4]; // 정튜닝, 도가 0일 때 기준, C->0, E->4

  return List.generate(6, (index) {
    return check((standard[index] + fretNumber) % 12, scale, texts, colors);
  });
}

// 스케일에 맞는 음인지 확인 (음을 숫자로 변형, 12로 나눈 나머지 반환)
// C->0, E->4 ..
List<int> scaleCheck(List<int> scale, int chord) {
  return List.generate(scale.length, (index) {
    return (scale[index] + chord) % 12;
  });
}

// 전체 스케일 프렛을 만드는 함수
List<List<NoteData?>> makeScaleFret(int chord, ScaleDefinition scale) {
  return List.generate(25, (index) {
    return makeFret(
      index,
      scaleCheck(scale.intervals, chord),
      scale.degrees,
      scale.colors,
    );
  });
}
