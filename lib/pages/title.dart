import 'package:flutter/material.dart';
import 'package:my_app/widgets/fret.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Guitar Chord',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            ElevatedButton(onPressed: () {}, child: const Text('Chords')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Scale')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Button 3')),
            const SizedBox(height: 50),

            // GuitarFretboard 위젯에 높이 제약만 줍니다. 너비는 SingleChildScrollView가 처리합니다.
            SizedBox(
              height: 120, // 원하는 높이를 지정하세요
              child: GuitarFretboard(),
            ),

            // 버튼과 기타 지판 아래 남은 공간을 채워주는 역할
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
