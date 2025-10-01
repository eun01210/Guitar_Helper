import 'package:flutter/material.dart';
import 'package:my_app/widgets/fretboard.dart';

class NoteDot extends StatelessWidget {
  final NoteData noteData;

  const NoteDot({super.key, required this.noteData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: noteData.text != ' ' ? 30 : 27, // 배경 점 크기 조절
      height: noteData.text != ' ' ? 30 : 27,
      decoration: BoxDecoration(
        color: noteData.color,
        shape: BoxShape.circle,
        border: Border.all(
          color: noteData.text != '' ? Colors.black : Colors.transparent,
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        noteData.text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
