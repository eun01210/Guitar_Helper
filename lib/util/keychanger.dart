// 변화표 숫자 반환 #->1, b->-1 ..
int accidental(bool? sharp, bool? flat) {
  if (sharp == true) return 1;
  if (flat == true) return -1;
  return 0;
}

// 변화표 문자 반환
String accidentalName(bool? sharp, bool? flat) {
  if (sharp == true) return '#';
  if (flat == true) return 'b';
  return '';
}

// 음에 해당하는 숫자 반환
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
