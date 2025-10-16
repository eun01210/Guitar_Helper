import 'package:flutter/material.dart';
import 'package:my_app/widgets/fret.dart';
import 'package:my_app/util/createscale.dart';

// 노트 데이터를 담을 클래스 정의
class NoteData {
  final String text;
  final Color color;

  const NoteData({required this.text, required this.color});
}

class GuitarFretboard extends StatelessWidget {
  final int chord;
  final ScaleDefinition scale;

  const GuitarFretboard({super.key, required this.chord, required this.scale});

  @override
  Widget build(BuildContext context) {
    final List<List<NoteData?>> fretboardData = makeFretBoard(
      chord,
      scale,
    ); // 이제 scale은 ScaleDefinition 객체입니다.
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 25),
        // 프렛 번호와 개방현을 위한 공간
        ...List.generate(25, (index) {
          final fretNumber = index;
          final fretData =
              index < fretboardData.length
                  ? fretboardData[index]
                  : [null, null, null, null, null, null];
          return Fret(fretNumber: fretNumber, notes: fretData);
        }),
        const SizedBox(width: 25),
      ],
    );
  }
}
