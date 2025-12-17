import 'dart:math' as math;

// 튜닝 결과를 담을 클래스
class TuningResult {
  final String note;
  final String status;
  final double cents; // Cents 차이 (1200cents -> Oct)

  TuningResult({required this.note, required this.status, required this.cents});
}

// 튜닝 상태 체크 클래스
class TuningUtil {
  final Map<String, double> _allNotes = {}; // 모든 음 주파수 저장 리스트

  TuningUtil() {
    _generateChromaticScale();
  }

  // 4번째 옥타브를 기준으로, 총 9개의 옥타브 각 음에 해당하는 주파수 리스트를 생성
  void _generateChromaticScale() {
    const noteNames = [
      'C',
      'C#',
      'D',
      'Eb',
      'E',
      'F',
      'F#',
      'G',
      'G#',
      'A',
      'Bb',
      'B',
    ];
    const a4Index = 9;
    const a4Octave = 4;
    const a4Freq = 440.0;

    // 주파수 계산 방식으로 모든 음의 주파수 계산
    for (int octave = 0; octave <= 8; octave++) {
      for (int i = 0; i < noteNames.length; i++) {
        final semitones = (octave - a4Octave) * 12 + (i - a4Index);
        final freq = a4Freq * math.pow(2, semitones / 12);
        _allNotes['${noteNames[i]}$octave'] = freq;
      }
    }
  }

  // 튜닝 상태 확인
  TuningResult getTuningStatus(double pitch) {
    String closestNote = '';
    double minDifference = double.infinity;

    // 현재 주파수와 가장 가까운 음 탐색
    _allNotes.forEach((note, freq) {
      final difference = (pitch - freq).abs();
      if (difference < minDifference) {
        minDifference = difference;
        closestNote = note;
      }
    });

    final targetFreq = _allNotes[closestNote]!;
    final cents = 1200 * (math.log(pitch / targetFreq) / math.log(2));

    // 주파수 차이를 이용하여 튜닝 여부 확인
    String status = 'In Tune';
    if (cents.abs() >= 5.0) {
      status = cents > 0 ? 'Too High' : 'Too Low';
    }

    // 튜닝 결과 반환 (RegExp는 정규표현식, 옥타브 번호를 제거하고 루트만 저장)
    return TuningResult(
      note: closestNote.replaceAll(RegExp(r'[0-9]'), ''),
      status: status,
      cents: cents,
    );
  }
}
