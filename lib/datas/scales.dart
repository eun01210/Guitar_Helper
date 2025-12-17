// 스케일의 구성 정보를 담는 클래스
class ScaleDefinition {
  final List<int> intervals; // 줄 간격 (0->C, 2->D)
  final List<String> degrees; // 도
  final List<int> colors; // 색

  const ScaleDefinition({
    required this.intervals,
    required this.degrees,
    required this.colors,
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

// 각 스케일의 이름과 ScaleDefinition 객체를 매핑
const Map<String, ScaleDefinition> scales = {
  'Penta Major': majorPenta,
  'Penta Minor': minorPenta,
  'Blues Major': majorBlues,
  'Blues Minor': minorBlues,
  'harmonic Major': majorHarmonic,
  'harmonic Minor': minorHarmonic,
};
