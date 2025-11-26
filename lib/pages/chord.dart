import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart';
import 'package:my_app/util/createchord.dart';
import 'package:my_app/util/keychanger.dart';
import 'package:my_app/pages/designs/chord_view.dart';
import 'package:my_app/pages/setting.dart';

class ChordPage extends StatefulWidget {
  const ChordPage({super.key});

  @override
  State<ChordPage> createState() => _ChordPageState();
}

class _ChordPageState extends State<ChordPage> {
  String? _selChord = 'C'; // 코드 초기값
  String _selExt = 'maj'; // 코드 초기값
  int _form = 0; // 손가락 폼
  bool _isSharp = false; // # 온오프
  bool _isFlat = false; // b 온오프
  bool _isFinger = true; // 손가락(true) vs 도수(false)

  // 계산된 프렛보드 데이터를 저장할 상태 변수
  late List<List<NoteData?>> _fretboardData;

  @override
  void initState() {
    super.initState();
    // 위젯이 처음 생성될 때 초기 데이터 계산
    _updateFretboardData();
  }

  // ♭, ♮, ♯ 버튼 처리
  void _handleAccidentalChange(String accidental) {
    setState(() {
      _form = 0; // 폼 초기화
      if (accidental == '♯') {
        _isSharp = true;
        _isFlat = false;
      } else if (accidental == '♭') {
        _isSharp = false;
        _isFlat = true;
      } else {
        _isSharp = false;
        _isFlat = false;
      }
      _updateFretboardData();
    });
  }

  // 폼 개수 계산
  int maxForm() {
    int forms =
        chordCheck(_selChord, accidental(_isSharp, _isFlat), _selExt).length;
    if (forms > 0) {
      return forms;
    } else {
      return 1;
    }
  }

  // 폼 변경
  void _handleFormChange(int value, int max) {
    if (value + _form >= max) {
      setState(() {
        _form = 0;
        _updateFretboardData();
      });
    } else if (value + _form < 0) {
      setState(() {
        _form = max - 1;
        _updateFretboardData();
      });
    } else {
      setState(() {
        _form += value;
        _updateFretboardData();
      });
    }
  }

  // 프렛보드 데이터 계산
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
    String accidentalSymbol = '♮';
    if (_isSharp) accidentalSymbol = '♯';
    if (_isFlat) accidentalSymbol = '♭';

    return ChordView(
      selectedRootNote: _selChord ?? 'C',
      selectedAccidental: accidentalSymbol,
      selectedChordType: _selExt,
      fullChordName:
          '${_selChord ?? ''}${accidentalName(_isSharp, _isFlat)}${(_selExt == 'maj') ? '' : _selExt}',
      isFingerMode: _isFinger,
      fretboardData: _fretboardData,
      onBack: () => Navigator.of(context).pop(),
      onSettings:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          ),
      onFormPrevious: () => _handleFormChange(-1, maxForm()),
      onFormNext: () => _handleFormChange(1, maxForm()),
      onFingerModeChanged: (value) {
        setState(() {
          _isFinger = value;
          _updateFretboardData();
        });
      },
      onRootNoteSelected: (note) {
        setState(() {
          _form = 0;
          _selChord = note;
          _updateFretboardData();
        });
      },
      onAccidentalSelected: _handleAccidentalChange,
      onChordTypeSelected: (type) {
        setState(() {
          _form = 0;
          _selExt = type ?? 'maj';
          _updateFretboardData();
        });
      },
    );
  }
}
