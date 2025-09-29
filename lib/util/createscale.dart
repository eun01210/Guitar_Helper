import 'package:flutter/material.dart';
import 'package:my_app/widgets/fretboard.dart'; // NoteData를 위해 추가

int chordMap(String? chord) {
  const Map<String, int> chords = {
    'C': 0, // C를 기준으로 0
    'C#': 1,
    'D': 2,
    'D#': 3,
    'E': 4,
    'F': 5,
    'F#': 6,
    'G': 7,
    'G#': 8,
    'A': 9,
    'A#': 10,
    'B': 11,
  };

  return chords[chord] ?? -1;
}

NoteData? check(int data, List<int> scale, List<String> texts) {
  final idx = scale.indexOf(data);
  if (idx > -1) {
    return NoteData(
      text: texts[idx],
      color:
          (texts[idx] == 'R')
              ? const Color.fromARGB(255, 255, 94, 0)
              : Colors.orange,
    );
  }
  return null;
}

List<NoteData?> makeFret(int fretnumber, List<int> scale, List<String> texts) {
  const standard = [4, 9, 2, 7, 11, 4]; // 정튜닝, 도가 0일 때 기준, C->0, E->4

  return List.generate(6, (index) {
    return check((standard[index] + fretnumber) % 12, scale, texts);
  });
}

List<int> scaleCheck(List<int> scale, int chord) {
  return List.generate(scale.length, (index) {
    return (scale[index] + chord) % 12;
  });
}

List<List<NoteData?>> makeFretBoard(int chord) {
  const pentatonic = [
    [0, 2, 4, 7, 9],
    ['R', '2', '3', '5', '6'],
  ];

  return List.generate(25, (index) {
    return makeFret(
      index,
      scaleCheck(pentatonic[0] as List<int>, chord),
      pentatonic[1] as List<String>,
    );
  });
}
