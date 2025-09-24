import 'package:flutter/material.dart';
import 'package:my_app/widgets/fretboard.dart';

class NoteDot extends StatelessWidget {
  final NoteData noteData;

  const NoteDot({super.key, required this.noteData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: noteData.color,
        shape: BoxShape.circle,
        border: Border.all(
          color: noteData.text != '' ? Colors.black : Colors.transparent,
          width: 1.5,
        ),
      ), // 검은 원 모양
      alignment: Alignment.center,
      child: Text(
        noteData.text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ), // 흰색 텍스트
      ),
    );
  }
}
