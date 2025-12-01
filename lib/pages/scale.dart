import 'package:flutter/material.dart';
import 'package:guitar_helper/pages/designs/scale_view.dart';
import 'package:guitar_helper/pages/fullscreen.dart';
import 'package:guitar_helper/pages/setting.dart';
import 'package:guitar_helper/datas/scales.dart';
import 'package:guitar_helper/widgets/note.dart';
import 'package:guitar_helper/util/createscale.dart';
import 'package:guitar_helper/util/keychanger.dart';

class ScalePage extends StatefulWidget {
  const ScalePage({super.key});

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> {
  String _selectedRootNote = 'C';
  String _selectedAccidental = '♮';
  String _selectedScaleType = scales.keys.first;
  List<List<NoteData?>> _fretboardData = [];

  @override
  void initState() {
    super.initState();
    _updateFretboardData();
  }

  void _updateFretboardData() {
    int accidentalOffset = 0;
    if (_selectedAccidental == '♯') {
      accidentalOffset = 1;
    } else if (_selectedAccidental == '♭') {
      accidentalOffset = -1;
    }

    setState(() {
      _fretboardData = makeScaleFret(
        chordMap(_selectedRootNote) + accidentalOffset,
        scales[_selectedScaleType]!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleView(
      selectedRootNote: _selectedRootNote,
      selectedAccidental: _selectedAccidental,
      selectedScaleType: _selectedScaleType,
      fullScaleName: _selectedScaleType,
      fretboardData: _fretboardData,
      onBack: () => Navigator.of(context).pop(),
      onSettings: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
      },
      onFullScreenTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => FullScreenFretboxPage(
                  fretboardData: _fretboardData,
                  onBack: () => Navigator.of(context).pop(),
                  onSettings:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      ),
                  selectedRootNote: _selectedRootNote,
                  selectedAccidental: _selectedAccidental,
                  selectedScaleType: _selectedScaleType,
                ),
          ),
        );
      },
      onRootNoteSelected: (note) {
        setState(() {
          _selectedRootNote = note;
          _updateFretboardData();
        });
      },
      onAccidentalSelected: (accidental) {
        setState(() {
          _selectedAccidental = accidental;
          _updateFretboardData();
        });
      },
      onScaleTypeSelected: (type) {
        if (type != null) {
          setState(() {
            _selectedScaleType = type;
            _updateFretboardData();
          });
        }
      },
    );
  }
}
