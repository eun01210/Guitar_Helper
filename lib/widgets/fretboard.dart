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

  const GuitarFretboard({super.key, required this.chord});

  @override
  Widget build(BuildContext context) {
    final List<List<NoteData?>> fretboardData = makeFretBoard(chord);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(width: 50),
            // 프렛 번호와 개방현을 위한 공간
            ...List.generate(25, (index) {
              final fretNumber = index;
              final fretData =
                  index < fretboardData.length
                      ? fretboardData[index]
                      : [null, null, null, null, null, null];
              return Fret(fretNumber: fretNumber, notes: fretData);
            }),
          ],
        ),
      ),
    );
  }
}
