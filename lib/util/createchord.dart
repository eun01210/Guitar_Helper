import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart'; // NoteData를 위해 추가

const colorTable = [
  Color.fromARGB(255, 255, 94, 0),
  Colors.orange,
  Colors.blueGrey,
  Colors.deepPurple,
];

List<List<NoteData?>> makeChordFret(
  int chord, // 코드, C->0, D->1 ... chordMap 참고
  int accident, // 올림 내림 여부, 0->x, 1->#, -1->b
  String? ext, // 익스텐션 코드 변경 여부, m, m7, M7 ...
  int form, // 폼, 해당 코드의 폼 (C를 잡는 방식에도 여러 방법이 있음)
  bool finger, // 도 표시 / 손가락 표시 변경
) {
  return List.generate(25, (index) {
    return [null, null, null, null, null, null];
  });
}
