import 'package:flutter/material.dart';
import 'package:my_app/widgets/select.dart';

class ChordPage extends StatefulWidget {
  const ChordPage({super.key});

  @override
  State<ChordPage> createState() => _ChordPageState();
}

class _ChordPageState extends State<ChordPage> {
  String? _selectedItem = 'C'; // 초기값을 'C'로 설정

  @override
  Widget build(BuildContext context) {
    // 현재 기기 방향을 감지
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Chord Diagram'),
            const SizedBox(width: 10), // 제목과 콤보박스 사이 간격
            ChordSelectBox(
              selectedItem: _selectedItem, // 현재 값 전달
              onChanged: (newValue) {
                // 콜백을 통해 받은 새 값을 setState로 업데이트
                setState(() {
                  _selectedItem = newValue;
                });
              },
            ),
          ],
        ),
        // 뒤로가기 버튼은 자동으로 생성됩니다.
      ),
      body:
          orientation == Orientation.portrait
              ? _buildPortraitLayout() // 세로 모드일 때
              : _buildLandscapeLayout(), // 가로 모드일 때
    );
  }

  // 세로 모드 UI를 빌드하는 메서드
  Widget _buildPortraitLayout() {
    return Column(
      children: [
        const SizedBox(height: 20), // 위쪽 여백
        const Spacer(), // 아래쪽으로 공간을 밀어냄
        const Text('여기에 다른 위젯이 들어갑니다'),
        const Spacer(),
      ],
    );
  }

  // 가로 모드 UI를 빌드하는 메서드
  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        const SizedBox(width: 20), // 왼쪽 여백
        const Spacer(), // 오른쪽으로 공간을 밀어냄
        const Text('여기에 다른 위젯이 들어갑니다'),
        const Spacer(),
      ],
    );
  }
}
