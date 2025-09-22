import 'package:flutter/material.dart';

class NoteDot extends StatelessWidget {
  final String noteText;

  const NoteDot({super.key, required this.noteText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      alignment: Alignment.center,
      child: Text(
        // noteText 사용
        noteText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
