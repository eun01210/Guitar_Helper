import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/fret.dart';
import 'package:guitar_helper/widgets/note.dart';

// 주어진 정보에 맞게 모든 프렛을 그리는 보드 위젯
class GuitarFretboard extends StatelessWidget {
  final List<List<NoteData?>> fretboardData;

  const GuitarFretboard({super.key, required this.fretboardData});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 기본적으로 0-24프렛까지
        ...List.generate(25, (index) {
          final fretNumber = index;
          // 데이터가 주어진 경우 사용, 없으면 null로 채움
          final fretData = index < fretboardData.length
              ? fretboardData[index]
              : [null, null, null, null, null, null];
          // 위의 데이터에 맞게 해당하는 번호의 프렛을 그림
          return Fret(
            fretNumber: fretNumber,
            notes: fretData,
            showBarreConnections: false,
          );
        }),
      ],
    );
  }
}
