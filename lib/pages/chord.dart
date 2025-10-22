import 'package:flutter/material.dart';
import 'package:my_app/widgets/select.dart';
import 'package:my_app/widgets/check.dart';
import 'package:my_app/widgets/note.dart';
import 'package:my_app/widgets/fretbox.dart';
import 'package:my_app/util/createchord.dart';
import 'package:my_app/util/keychanger.dart';

class ChordPage extends StatefulWidget {
  const ChordPage({super.key});

  @override
  State<ChordPage> createState() => _ChordPageState();
}

class _ChordPageState extends State<ChordPage> {
  String? _selChord = 'C'; // 코드 초기값
  String? _selExt = 'maj'; // 코드 초기값
  int _form = 0; // 손가락 폼
  bool _isSharp = false; // # 온오프
  bool _isFlat = false; // b 온오프
  bool _isFinger = false; // 손가락 온오프

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
        _form = 0;
        _updateFretboardData(); // 상태 변경 시 데이터 업데이트
      });
    } else {
      setState(() {
        _isSharp = (accidental) ? false : _isSharp;
        _isFlat = (accidental) ? _isFlat : false;
        _form = 0;
        _updateFretboardData(); // 상태 변경 시 데이터 업데이트
      });
    }
  }

  int maxForm() {
    int forms =
        chordCheck(_selChord, accidental(_isSharp, _isFlat), _selExt).length;
    if (forms > 0) {
      return forms;
    } else {
      return 1;
    }
  }

  void _handleFormChange(int value, int max) {
    if (value + _form >= max) {
      setState(() {
        _form = 0;
        _updateFretboardData(); // 상태 변경 시 데이터 업데이트
      });
    } else if (value + _form < 0) {
      setState(() {
        _form = max - 1;
        _updateFretboardData(); // 상태 변경 시 데이터 업데이트
      });
    } else {
      setState(() {
        _form += value;
        _updateFretboardData();
      });
    }
  }

  // 프렛보드 데이터를 계산하고 상태를 업데이트하는 메서드
  void _updateFretboardData() {
    _fretboardData = makeChordFret(
      _selChord,
      accidental(_isSharp, _isFlat),
      _selExt,
      _form,
      _isFinger,
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
              'Chord Diagram',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            ChordSelectBox(
              selectedItem: _selChord,
              onChanged: (newValue) {
                setState(() {
                  _form = 0;
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
            ChordSelectBox(
              selectedItem: _selExt,
              onChanged: (newValue) {
                setState(() {
                  _form = 0;
                  _selExt = newValue;
                  _updateFretboardData(); // 상태 변경 시 데이터 업데이트
                });
              },
              items: ['maj', '7', 'm', 'm7', 'M7', 'sus4'],
            ),
            const SizedBox(width: 10),
            Check(
              isChecked: _isFinger,
              text: "Fingering",
              onChanged: (newValue) {
                setState(() {
                  _isFinger = newValue ?? false;
                  _updateFretboardData();
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_left),
              onPressed: () {
                _handleFormChange(-1, maxForm());
              },
            ),
            Text('${_form + 1}'),
            IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: () {
                _handleFormChange(1, maxForm());
              },
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
            showBarreConnections: true, // 코드 페이지에서는 바레를 표시함
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
            showBarreConnections: true, // 코드 페이지에서는 바레를 표시함
          ),
        ),
      ],
    );
  }
}
