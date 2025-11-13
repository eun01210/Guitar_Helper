import 'dart:math' as math;

// 튜닝 결과를 담을 클래스
class TuningResult {
  final String note;
  final String status;
  final double diff; // Hz 차이
  final double cents; // Cents 차이

  TuningResult({
    required this.note,
    required this.status,
    required this.diff,
    required this.cents,
  });
}

class TuningUtil {
  final Map<String, double> _allNotes = {};

  TuningUtil() {
    _generateChromaticScale();
  }

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

    for (int octave = 0; octave <= 8; octave++) {
      for (int i = 0; i < noteNames.length; i++) {
        final semitones = (octave - a4Octave) * 12 + (i - a4Index);
        final freq = a4Freq * math.pow(2, semitones / 12);
        _allNotes['${noteNames[i]}$octave'] = freq;
      }
    }
  }

  TuningResult getTuningStatus(double pitch) {
    String closestNote = '';
    double minDifference = double.infinity;

    _allNotes.forEach((note, freq) {
      final difference = (pitch - freq).abs();
      if (difference < minDifference) {
        minDifference = difference;
        closestNote = note;
      }
    });

    final targetFreq = _allNotes[closestNote]!;
    final diff = pitch - targetFreq;
    final cents = 1200 * (math.log(pitch / targetFreq) / math.log(2));

    String status = 'In Tune';
    if (cents.abs() >= 5.0) {
      status = cents > 0 ? 'Too High' : 'Too Low';
    }

    return TuningResult(
      note: closestNote.replaceAll(RegExp(r'[0-9]'), ''),
      status: status,
      diff: diff,
      cents: cents,
    );
  }
}
