import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart'; // NoteData를 위해 추가

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

List<List<NoteData?>> makeChordFret(int chord) {
  return List.generate(25, (index) {
    return [];
  });
}
