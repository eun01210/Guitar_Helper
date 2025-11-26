import 'package:flutter/material.dart';
import 'package:my_app/widgets/fretbox.dart';
import 'package:my_app/widgets/note.dart';

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
      // Appbar, 뒤로가기, 풀스케일 이름, 설정 버튼
      appBar: AppBar(
        backgroundColor: const Color(0xCC101F22),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: textColor,
          ),
          onPressed: widget.onBack,
        ),
        title: Text(
          fullScaleName,
          style: const TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 28, color: textColor),
            onPressed: widget.onSettings,
          ),
        ],
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
