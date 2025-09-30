import 'package:flutter/material.dart';
import 'package:my_app/widgets/select.dart';
import 'package:my_app/widgets/check.dart';
import 'package:my_app/widgets/fretboard.dart';
import 'package:my_app/util/createscale.dart';

class ScalePage extends StatefulWidget {
  const ScalePage({super.key});

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> {
  String? _selectedItem = 'C'; // 초기값을 'C'로 설정
  bool _isSharp = false;
  bool _isFlat = false;
  bool _isMinor = false;

  void _handleAccidentalChange(bool? value, bool accidental) {
    // accidental이 true면 #, false면 b
    if (value == true) {
      setState(() {
        _isSharp = (accidental) ? true : false;
        _isFlat = (accidental) ? false : true;
      });
    } else {
      setState(() {
        _isSharp = (accidental) ? false : _isSharp;
        _isFlat = (accidental) ? _isFlat : false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 현재 기기 방향을 감지
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Scale Diagram',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
            const SizedBox(width: 10),
            Check(
              isChecked: _isSharp,
              text: "#",
              onChanged: (newValue) {
                _handleAccidentalChange(newValue, true);
              },
            ),
            Check(
              isChecked: _isFlat,
              text: "♭",
              onChanged: (newValue) {
                _handleAccidentalChange(newValue, false);
              },
            ),
            Check(
              isChecked: _isMinor,
              text: "m",
              onChanged: (newValue) {
                setState(() {
                  _isMinor = newValue ?? false;
                });
              },
            ),
          ],
        ),
        // 뒤로가기 버튼은 자동으로 생성됩니다.
      ),
      body:
          orientation == Orientation.portrait
              ? _buildPortraitLayout(chordMap(_selectedItem)) // 세로 모드일 때
              : _buildLandscapeLayout(chordMap(_selectedItem)), // 가로 모드일 때
    );
  }

  // 가로 모드 UI를 빌드하는 메서드
  Widget _buildLandscapeLayout(int chord) {
    return Row(
      children: [
        // 기타 지판 위젯을 Expanded로 감싸서 남은 공간을 모두 차지하게 함
        Expanded(
          child: GuitarFretboard(
            chord:
                chord +
                accidental(_isSharp, _isFlat) +
                ((_isMinor == true) ? 3 : 0),
          ),
        ),
      ],
    );
  }

  // 세로 모드 UI를 빌드하는 메서드 (@수정 안 함)
  Widget _buildPortraitLayout(int chord) {
    return Column(
      children: [
        const SizedBox(height: 20), // 위쪽 여백
        SizedBox(
          height: 240, // 원하는 높이를 지정하세요
          child: GuitarFretboard(chord: chord),
        ),
      ],
    );
  }
}
