import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/fretbox.dart';
import 'package:guitar_helper/widgets/appbar.dart';
import 'package:guitar_helper/widgets/note.dart';

class FullScreenFretboxPage extends StatefulWidget {
  final List<List<NoteData?>> fretboardData;
  final VoidCallback onBack;
  final VoidCallback onSettings;
  final String selectedRootNote;
  final String selectedAccidental;
  final String selectedScaleType;

  const FullScreenFretboxPage({
    super.key,
    required this.fretboardData,
    required this.onBack,
    required this.onSettings,
    required this.selectedRootNote,
    required this.selectedAccidental,
    required this.selectedScaleType,
  });

  @override
  State<FullScreenFretboxPage> createState() => _FullScreenFretboxPageState();
}

class _FullScreenFretboxPageState extends State<FullScreenFretboxPage> {
  @override
  Widget build(BuildContext context) {
    const Color backgroundDark = Color(0xFF101F22);
    const Color textColor = Colors.white;

    final fullScaleName =
        '${widget.selectedRootNote}${widget.selectedAccidental == '♮' ? '' : widget.selectedAccidental} ${widget.selectedScaleType}';

    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: CustomAppBar(
        title: fullScaleName,
        onBack: widget.onBack,
        onSettings: widget.onSettings,
        textColor: textColor,
        backgroundColor: const Color(0xCC101F22),
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              // 가로로 돌림
              child: RotatedBox(
                quarterTurns: 1,
                child: GuitarFretBox(fretboardData: widget.fretboardData),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
