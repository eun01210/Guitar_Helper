import 'package:flutter/material.dart';
import 'package:my_app/widgets/select.dart';
import 'package:my_app/widgets/check.dart';
import 'package:my_app/widgets/note.dart';
import 'package:my_app/util/createchord.dart';
import 'package:my_app/widgets/fretbox.dart';

class ChordPage extends StatefulWidget {
  const ChordPage({super.key});

  @override
  State<ChordPage> createState() => _ChordPageState();
}

class _ChordPageState extends State<ChordPage> {
  String? _selChord = 'C'; // 코드 초기값
  bool _isSharp = false; // # 온오프
  bool _isFlat = false; // b 온오프

  // 계산된 프렛보드 데이터를 저장할 상태 변수
  late List<List<NoteData?>> _fretboardData;

  @override
  void initState() {
    super.initState();
    // 위젯이 처음 생성될 때 초기 데이터 계산
    _updateFretboardData();
  }

  // #과 b의 체크박스 관리. 하나가 활성화되면 하나를 제거
  void _handleAccidentalChange(bool? value, bool accidental) {
    // accidental이 true면 #, false면 b
    if (value == true) {
      setState(() {
        _isSharp = (accidental) ? true : false;
        _isFlat = (accidental) ? false : true;
        _updateFretboardData(); // 상태 변경 시 데이터 업데이트
      });
    } else {
      setState(() {
        _isSharp = (accidental) ? false : _isSharp;
        _isFlat = (accidental) ? _isFlat : false;
        _updateFretboardData(); // 상태 변경 시 데이터 업데이트
      });
    }
  }

  // 프렛보드 데이터를 계산하고 상태를 업데이트하는 메서드
  void _updateFretboardData() {
    _fretboardData = makeChordFret(
      chordMap(_selChord) + accidental(_isSharp, _isFlat),
    );
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
            const SizedBox(width: 10),
            ChordSelectBox(
              selectedItem: _selChord,
              onChanged: (newValue) {
                setState(() {
                  _selChord = newValue;
                  _updateFretboardData(); // 상태 변경 시 데이터 업데이트
                });
              },
              items: ['C', 'D', 'E', 'F', 'G', 'A', 'B'],
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
              text: "b",
              onChanged: (newValue) {
                _handleAccidentalChange(newValue, false);
              },
            ),
          ],
        ),
        // 뒤로가기 버튼은 Appbar에서 자동 생성
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child:
            orientation ==
                    Orientation
                        .portrait // UI 빌드 부분은 계산된 데이터를 사용
                ? _buildPortraitLayout() // 세로 모드일 때
                : _buildLandscapeLayout(), // 가로 모드일 때
      ),
    );
  }

  // 가로 모드 UI를 빌드하는 메서드
  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        // 기타 지판 위젯을 Expanded로 감싸서 남은 공간을 모두 차지하게 함
        Expanded(child: GuitarFretBox(fretboardData: _fretboardData)),
      ],
    );
  }

  // 세로 모드 UI를 빌드하는 메서드 (제작 예정)
  Widget _buildPortraitLayout() {
    return Row(
      children: [Expanded(child: GuitarFretBox(fretboardData: _fretboardData))],
    );
  }
}
