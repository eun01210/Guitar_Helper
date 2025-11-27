import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:my_app/widgets/appbar.dart';

class TunerView extends StatelessWidget {
  final String note;
  final String status;
  final double pitch;
  final double cents;
  final VoidCallback onBack;
  final VoidCallback onSettingsTap;

  const TunerView({
    super.key,
    required this.note,
    required this.status,
    required this.pitch,
    required this.cents,
    required this.onBack,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    const backgroundDark = Color(0xFF101F22);
    const textWhite = Colors.white;
    const textZinc400 = Color(0xFFA1A1AA);
    const textZinc500 = Color(0xFF71717A);
    const textZinc600 = Color(0xFF52525B);
    const bgZinc800 = Color(0xFF27272A);
    const yellow500 = Color(0xFFEAB308);
    const success = Color(0xFF34D399);

    final bool isTuning = note.isNotEmpty;
    final bool isInTune = status == 'In Tune';
    final Color statusColor = isInTune ? success : yellow500;

    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: CustomAppBar(
        title: 'Tuner',
        onBack: onBack,
        onSettings: onSettingsTap,
        textColor: textWhite,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 1),
            Column(
              children: [
                // Hz 표시
                Text(
                  isTuning ? '${pitch.toStringAsFixed(1)} Hz' : ' ',
                  style: const TextStyle(
                    color: textZinc400,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // 음정 표시
                const SizedBox(height: 16),
                _buildNoteDisplay(isTuning, statusColor, textZinc600),
                const SizedBox(height: 16),
                // 튜닝 상태 표시
                SizedBox(
                  height: 32,
                  child: Center(
                    child: Text(
                      isTuning ? status : 'Please make a sound',
                      style: TextStyle(
                        color: isTuning ? statusColor : textZinc400,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 튜닝 정도 표시
            _buildTuningMeter(
              isTuning,
              statusColor,
              success,
              bgZinc800,
              textZinc500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteDisplay(
    bool isTuning,
    Color activeColor,
    Color inactiveColor,
  ) {
    String mainNote = note.isNotEmpty ? note[0] : 'A';
    String accidental = note.length > 1 ? note.substring(1) : '';

    return Stack(
      alignment: Alignment.center,
      children: [
        _NoteText(
          mainNote: mainNote,
          accidental: accidental,
          color: inactiveColor,
        ),
        if (isTuning)
          _NoteText(
            mainNote: mainNote,
            accidental: accidental,
            color: activeColor,
          ),
      ],
    );
  }

  Widget _buildTuningMeter(
    bool isTuning,
    Color statusColor,
    Color successColor,
    Color meterBgColor,
    Color labelColor,
  ) {
    // cents 값을 -50~50으로 제한 (50이 넘어가면 음정이 바뀜)
    final double clampedCents = math.max(-50, math.min(50, cents));
    // 미터기 표시를 위해 정규화 (-1~1)
    final double indicatorPosition = (clampedCents + 50) / 100;

    return Column(
      children: [
        SizedBox(
          height: 32,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: meterBgColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 4,
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0x8034D399),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  if (isTuning)
                    Positioned(
                      left: indicatorPosition * constraints.maxWidth,
                      child: Container(
                        width: 4,
                        height: 32,
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('-50', style: TextStyle(fontSize: 12, color: labelColor)),
              Text('0', style: TextStyle(fontSize: 12, color: labelColor)),
              Text('+50', style: TextStyle(fontSize: 12, color: labelColor)),
            ],
          ),
        ),
      ],
    );
  }
}

class _NoteText extends StatelessWidget {
  final String mainNote;
  final String accidental;
  final Color color;

  const _NoteText({
    required this.mainNote,
    required this.accidental,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          color: color,
        ),
        children: [
          TextSpan(
            text: mainNote,
            style: const TextStyle(fontSize: 96, letterSpacing: -4),
          ),
          if (accidental.isNotEmpty)
            TextSpan(
              text: accidental,
              style: const TextStyle(
                fontSize: 60,
                fontFeatures: [FontFeature.superscripts()],
              ),
            ),
        ],
      ),
    );
  }
}
