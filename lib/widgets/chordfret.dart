import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/fret.dart';
import 'package:guitar_helper/widgets/note.dart';

// 코드 페이지에서 표시할 프렛 부분 추출
class ChordFret extends StatelessWidget {
  final List<List<NoteData?>> fretboardData;
  final bool showBarreConnections;

  const ChordFret({
    super.key,
    required this.fretboardData,
    this.showBarreConnections = true,
  });

  @override
  Widget build(BuildContext context) {
    final (int startFret, int endFret) = _calculateFretRange(); // 프렛 범위 설정

    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 시작 프렛이 0이 아니면 왼쪽 세로선 표시
          if (startFret > 0) FretNumberIndicator(),
          // 범위 내의 프렛 생성, 데이터가 없는 경우 null로 채움
          ...List.generate(endFret - startFret, (index) {
            final fretNumber = startFret + index;
            final fretData = fretNumber < fretboardData.length
                ? fretboardData[fretNumber]
                : List.filled(6, null);

            return Fret(
              fretNumber: fretNumber,
              notes: fretData,
              showBarreConnections: showBarreConnections,
              chord: true,
            );
          }),
        ],
      ),
    );
  }

  /// 표시할 프렛 범위 계산 함수
  (int, int) _calculateFretRange() {
    int minFret = 99;
    int maxFret = -1;

    // fretboardData를 순회하며 가장 낮은 프렛과 높은 프렛 찾기
    for (int fret = 0; fret < fretboardData.length; fret++) {
      for (final note in fretboardData[fret]) {
        if (note != null && note.text.isNotEmpty) {
          if (fret < minFret) minFret = fret;
          if (fret > maxFret) maxFret = fret;
        }
      }
    }

    // 찾지 못한 경우 (로딩 X | 데이터 X) 기본 (0~3) 표시
    if (minFret == 99 && maxFret == -1) {
      return (0, 4);
    }
    // 최고 프렛이 4보다 작은 경우 기본 (0~3) 표시
    if (maxFret < 4) {
      return (0, 4);
    }

    // 표시 범위가 3보다 작은 경우 3칸, 그 외는 범위 표시 (maxFret이 3인 경우 4로 리턴해야 3까지 표시됨)
    return (minFret, (maxFret - minFret < 3) ? minFret + 3 : maxFret + 1);
  }
}

// 세로선 위젯
class FretNumberIndicator extends StatelessWidget {
  const FretNumberIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final Color lineColor = Theme.of(context).colorScheme.primaryContainer;

    return SizedBox(
      height: 150, // Fret 위젯 높이
      child: Row(
        children: [
          Container(width: 1, color: lineColor), // 왼쪽 세로선
        ],
      ),
    );
  }
}
