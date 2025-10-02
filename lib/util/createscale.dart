import 'package:flutter/material.dart';
import 'package:my_app/widgets/fretboard.dart'; // NoteData를 위해 추가

const Map<String, int> scales = {
  'Penta Major': 0,
  'Penta Minor': 1,
  'Blues Major': 2,
  'Blues Minor': 3,
  'harmonic Major': 4,
  'harmonic Minor': 5,
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

int scaleMap(String? scale) {
  return scales[scale] ?? -1;
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

List<List<NoteData?>> makeFretBoard(int chord, int scale) {
  // 스케일 하나 추가 시, 위쪽의 scale map을 수정해야 함.

  const majorPenta = [
    [0, 2, 4, 7, 9],
    ['R', '2', '3', '5', '6'],
    [0, 1, 1, 1, 1],
  ];

  const minorPenta = [
    [0, 3, 5, 7, 10],
    ['R', 'b3', '4', '5', 'b7'],
    [0, 1, 1, 1, 1],
  ];

  const majorBlues = [
    [0, 2, 3, 4, 7, 9],
    ['R', '2', 'b3', '3', '5', '6'],
    [0, 1, 2, 1, 1, 1],
  ];

  const minorBlues = [
    [0, 3, 5, 6, 7, 10],
    ['R', 'b3', '4', 'b5', '5', 'b7'],
    [0, 1, 1, 2, 1, 1],
  ];

  const majorHarmonic = [
    [0, 2, 4, 5, 7, 8, 11],
    ['R', '2', '3', '4', '5', 'b6', '7'],
    [0, 1, 1, 1, 1, 3, 1],
  ];

  const minorHarmonic = [
    [0, 2, 3, 5, 7, 8, 11],
    ['R', '2', 'b3', '4', '5', 'b6', '7'],
    [0, 1, 1, 1, 1, 3, 1],
  ];

  const scales = [
    majorPenta,
    minorPenta,
    majorBlues,
    minorBlues,
    majorHarmonic,
    minorHarmonic,
  ];

  return List.generate(25, (index) {
    return makeFret(
      index,
      scaleCheck(scales[scale][0] as List<int>, chord),
      scales[scale][1] as List<String>,
      scales[scale][2] as List<int>,
    );
  });
}
