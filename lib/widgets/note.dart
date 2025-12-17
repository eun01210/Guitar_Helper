import 'package:flutter/material.dart';

// 노트 데이터를 담을 클래스, 노트는 텍스트와 색을 저장
class NoteData {
  final String text;
  final Color color;

  const NoteData({required this.text, required this.color});
}

// 노트 색상 테이블
const colorTable = [
  Color(0xFF4169E1), // 루트
  Color(0xFF00BFFF), // 기본음
  Colors.blueGrey, // 블루스 마이너음
  Colors.deepPurple, // 하모닉 마이너음
];

// 노트 위젯
class NoteDot extends StatelessWidget {
  final NoteData noteData;

  const NoteDot({super.key, required this.noteData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: noteData.text != ' ' ? 18 : 15, // 배경 점 크기 조절
      height: noteData.text != ' ' ? 18 : 15, // 배경 점 크기 조절
      decoration: BoxDecoration(
        color: noteData.color,
        shape: BoxShape.circle,
        border: Border.all(
          // 데이터가 없는 경우 투명하게 표시(+배경점 테두리 제거)
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
