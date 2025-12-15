import 'package:flutter/material.dart';

// 노트 데이터를 담을 클래스 정의
class NoteData {
  final String text;
  final Color color;

  const NoteData({required this.text, required this.color});
}

const colorTable = [
  Color(0xFF4169E1),
  Color(0xFF00BFFF),
  Colors.blueGrey,
  Colors.deepPurple,
];

class NoteDot extends StatelessWidget {
  final NoteData noteData;

  const NoteDot({super.key, required this.noteData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: noteData.text != ' ' ? 18 : 15, // 배경 점 크기 조절
      height: noteData.text != ' ' ? 18 : 15,
      decoration: BoxDecoration(
        color: noteData.color,
        shape: BoxShape.circle,
        border: Border.all(
          color: (noteData.text != '' && noteData.text != ' ')
              ? Colors.black
              : Colors.transparent,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        noteData.text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}
