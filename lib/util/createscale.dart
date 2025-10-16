import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart'; // NoteData를 위해 추가

// 스케일의 구성 정보를 담는 클래스
class ScaleDefinition {
  final List<int> intervals;
  final List<String> degrees;
  final List<int> colors;

  const ScaleDefinition({
    required this.intervals,
    required this.degrees,
    required this.colors,
  });
}

// 각 스케일의 이름과 ScaleDefinition 객체를 매핑
const Map<String, ScaleDefinition> scales = {
  'Penta Major': majorPenta,
  'Penta Minor': minorPenta,
  'Blues Major': majorBlues,
  'Blues Minor': minorBlues,
  'harmonic Major': majorHarmonic,
  'harmonic Minor': minorHarmonic,
};

int accidental(bool? sharp, bool? flat) {
  if (sharp == true) return 1;
  if (flat == true) return -1;
  return 0;
}

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

NoteData? check(
  int data,
  List<int> scale,
  List<String> texts,
  List<int> colors,
) {
  final idx = scale.indexOf(data);

  const colorTable = [
    Color.fromARGB(255, 255, 94, 0),
    Colors.orange,
    Colors.blueGrey,
    Colors.deepPurple,
  ];

  if (idx > -1) {
    return NoteData(text: texts[idx], color: colorTable[colors[idx]]);
  }
  return null;
}

List<NoteData?> makeFret(
  int fretnumber,
  List<int> scale,
  List<String> texts,
  List<int> colors,
) {
  const standard = [4, 9, 2, 7, 11, 4]; // 정튜닝, 도가 0일 때 기준, C->0, E->4

  return List.generate(6, (index) {
    return check((standard[index] + fretnumber) % 12, scale, texts, colors);
  });
}

List<int> scaleCheck(List<int> scale, int chord) {
  return List.generate(scale.length, (index) {
    return (scale[index] + chord) % 12;
  });
}

const majorPenta = ScaleDefinition(
  intervals: [0, 2, 4, 7, 9],
  degrees: ['R', '2', '3', '5', '6'],
  colors: [0, 1, 1, 1, 1],
);

const minorPenta = ScaleDefinition(
  intervals: [0, 3, 5, 7, 10],
  degrees: ['R', 'b3', '4', '5', 'b7'],
  colors: [0, 1, 1, 1, 1],
);

const majorBlues = ScaleDefinition(
  intervals: [0, 2, 3, 4, 7, 9],
  degrees: ['R', '2', 'b3', '3', '5', '6'],
  colors: [0, 1, 2, 1, 1, 1],
);

const minorBlues = ScaleDefinition(
  intervals: [0, 3, 5, 6, 7, 10],
  degrees: ['R', 'b3', '4', 'b5', '5', 'b7'],
  colors: [0, 1, 1, 2, 1, 1],
);

const majorHarmonic = ScaleDefinition(
  intervals: [0, 2, 4, 5, 7, 8, 11],
  degrees: ['R', '2', '3', '4', '5', 'b6', '7'],
  colors: [0, 1, 1, 1, 1, 3, 1],
);

const minorHarmonic = ScaleDefinition(
  intervals: [0, 2, 3, 5, 7, 8, 11],
  degrees: ['R', '2', 'b3', '4', '5', 'b6', '7'],
  colors: [0, 1, 1, 1, 1, 3, 1],
);

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
