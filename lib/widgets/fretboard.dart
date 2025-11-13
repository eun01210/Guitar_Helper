import 'package:flutter/material.dart';
import 'package:my_app/widgets/fret.dart';
import 'package:my_app/widgets/note.dart';

class GuitarFretboard extends StatelessWidget {
  final List<List<NoteData?>> fretboardData;
  final bool showBarreConnections;

  const GuitarFretboard({
    super.key,
    required this.fretboardData,
    this.showBarreConnections = true, // Default to true
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 25),
        // 프렛 번호와 개방현을 위한 공간
        // ChordPage(showBarreConnections: true)일 때는 15프렛까지만 표시
        ...List.generate(showBarreConnections ? 16 : 25, (index) {
          final fretNumber = index;
          final fretData =
              index < fretboardData.length
                  ? fretboardData[index]
                  : [null, null, null, null, null, null];
          return Fret(
            fretNumber: fretNumber,
            notes: fretData,
            showBarreConnections: showBarreConnections,
          );
        }),
        const SizedBox(width: 25),
      ],
    );
  }
}
