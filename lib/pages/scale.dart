import 'package:flutter/material.dart';
import 'package:my_app/widgets/select.dart';
import 'package:my_app/widgets/check.dart';
import 'package:my_app/widgets/note.dart';
import 'package:my_app/widgets/fretbox.dart';
import 'package:my_app/util/createscale.dart';
import 'package:my_app/util/keychanger.dart';
import 'package:my_app/datas/scales.dart';

class ScalePage extends StatefulWidget {
  const ScalePage({super.key});

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> {
  String? _selChord = 'C'; // 코드 초기값
  String? _selScale = 'Penta Major'; // 스케일 초기값
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
    _fretboardData = makeScaleFret(
      chordMap(_selChord) + accidental(_isSharp, _isFlat),
      scales[_selScale]!,
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
            const Text('Scale', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 20),
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
            const SizedBox(width: 10),
            ChordSelectBox(
              selectedItem: _selScale,
              onChanged: (newValue) {
                setState(() {
                  _selScale = newValue;
                  _updateFretboardData(); // 상태 변경 시 데이터 업데이트
                });
              },
              items: scales.keys.toList(),
            ),
          ],
        ),
        // 뒤로가기 버튼은 Appbar에서 자동 생성
      ),
      body:
          orientation ==
                  Orientation
                      .portrait // UI 빌드 부분은 계산된 데이터를 사용
              ? _buildPortraitLayout() // 세로 모드일 때
              : _buildLandscapeLayout(), // 가로 모드일 때
    );
  }

  // 가로 모드 UI를 빌드하는 메서드
  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          child: GuitarFretBox(
            fretboardData: _fretboardData,
            showBarreConnections: false, // 스케일 페이지에서는 바레를 표시하지 않음
          ),
        ),
      ],
    );
  }

  // 세로 모드 UI를 빌드하는 메서드 (제작 예정)
  Widget _buildPortraitLayout() {
    return Row(
      children: [
        Expanded(
          child: GuitarFretBox(
            fretboardData: _fretboardData,
            showBarreConnections: false, // 스케일 페이지에서는 바레를 표시하지 않음
          ),
        ),
      ],
    );
  }
}
