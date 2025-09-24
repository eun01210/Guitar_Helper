import 'package:flutter/material.dart';
import 'package:my_app/widgets/select.dart';
import 'package:my_app/widgets/fretboard.dart';

class ScalePage extends StatefulWidget {
  const ScalePage({super.key});

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> {
  String? _selectedItem = 'C'; // 초기값을 'C'로 설정

  @override
  Widget build(BuildContext context) {
    // 현재 기기 방향을 감지
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Scale Diagram'),
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
        SizedBox(
          height: 240, // 원하는 높이를 지정하세요
          child: GuitarFretboard(),
        ),
      ],
    );
  }

  // 가로 모드 UI를 빌드하는 메서드
  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        // 기타 지판 위젯을 Expanded로 감싸서 남은 공간을 모두 차지하게 함
        Expanded(child: GuitarFretboard()),
      ],
    );
    /*
    return Row(
      children: [
        const SizedBox(width: 20), // 왼쪽 여백
        const Spacer(), // 오른쪽으로 공간을 밀어냄
        SizedBox(
          height: 240, // 원하는 높이를 지정하세요
          child: GuitarFretboard(),
        ),
        const Text('여기에 다른 위젯이 들어갑니다'),
        const Spacer(),
      ],
    );*/
  }
}
