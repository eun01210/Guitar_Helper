import 'package:flutter/material.dart';
import 'package:my_app/widgets/fret.dart';

// 노트 데이터를 담을 클래스 정의
class NoteData {
  final String text;
  final Color color;

  const NoteData({required this.text, required this.color});
}

class GuitarFretboard extends StatelessWidget {
  GuitarFretboard({super.key});

  final List<List<NoteData?>> fretboardData = [
    // 0번 프렛 (개방현)
    [null, null, null, null, null, null],
    // 1번 프렛
    [null, null, null, null, null, null],
    // 2번 프렛
    [null, null, null, null, null, null],
    // 3번 프렛
    [
      NoteData(text: '2', color: Colors.red),
      NoteData(text: 'A', color: Colors.orange),
      NoteData(text: 'G', color: Colors.orange),
      null,
      null,
      NoteData(text: 'B', color: Colors.orange),
    ],
    // ... 이미지에 맞게 데이터를 채워넣습니다.
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(width: 50),
            // 프렛 번호와 개방현을 위한 공간
            ...List.generate(22, (index) {
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
