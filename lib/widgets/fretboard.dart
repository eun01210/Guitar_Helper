import 'package:flutter/material.dart';
import 'package:my_app/widgets/fret.dart';
import 'package:my_app/widgets/note.dart';

class GuitarFretboard extends StatelessWidget {
  final List<List<NoteData?>> fretboardData;

  const GuitarFretboard({super.key, required this.fretboardData});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 프렛 번호와 개방현을 위한 공간
        ...List.generate(25, (index) {
          final fretNumber = index;
          final fretData =
              index < fretboardData.length
                  ? fretboardData[index]
                  : [null, null, null, null, null, null];
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
