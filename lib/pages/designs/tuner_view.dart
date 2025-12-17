import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:guitar_helper/widgets/appbar.dart';

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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color backgroundColor = colorScheme.tertiary;
    final Color subTextColor = colorScheme.onSurfaceVariant;
    final Color meterBgColor = colorScheme.surfaceContainer;
    final Color inactiveNoteColor = colorScheme.surfaceContainer;

    // 튜닝 상태 색상
    const yellow500 = Color(0xFFEAB308);
    const success = Color(0xFF34D399);

    // 튜닝 상태 체크 변수
    final bool isTuning = note.isNotEmpty;
    final bool isInTune = status == 'In Tune';
    final Color statusColor = isInTune ? success : yellow500;

    // 화면 너비에 따른 스케일 팩터 계산
    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.0);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Tuner',
        onBack: onBack,
        onSettings: onSettingsTap,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0 * scaleFactor,
          vertical: 24.0 * scaleFactor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 1 * scaleFactor),
            Column(
              children: [
                // Hz 표시
                Text(
                  isTuning ? '${pitch.toStringAsFixed(1)} Hz' : ' ',
                  style: TextStyle(
                    color: subTextColor,
                    fontSize: 14 * scaleFactor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // 음정 표시
                SizedBox(height: 16 * scaleFactor),
                _buildNoteDisplay(
                  isTuning,
                  statusColor,
                  inactiveNoteColor,
                  scaleFactor,
                ),
                SizedBox(height: 16 * scaleFactor),
                // 튜닝 상태 표시
                SizedBox(
                  height: 32 * scaleFactor,
                  child: Center(
                    child: Text(
                      isTuning ? status : 'Please make a sound',
                      style: TextStyle(
                        color: isTuning ? statusColor : subTextColor,
                        fontSize: 20 * scaleFactor,
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
              meterBgColor,
              subTextColor,
              scaleFactor,
            ),
          ],
        ),
      ),
    );
  }

  // 음정 표시
  Widget _buildNoteDisplay(
    bool isTuning,
    Color activeColor,
    Color inactiveColor,
    double scaleFactor,
  ) {
    // 감지된 노트가 없으면 C를 표시, accidental은 여백
    String mainNote = note.isNotEmpty ? note[0] : 'C';
    String accidental = note.length > 1 ? note.substring(1) : '';

    return Stack(
      alignment: Alignment.center,
      children: [
        _NoteText(
          mainNote: mainNote,
          accidental: accidental,
          color: inactiveColor,
          scaleFactor: scaleFactor,
        ),
        // 감지된 노트가 있으면 accidental 표시
        if (isTuning)
          _NoteText(
            mainNote: mainNote,
            accidental: accidental,
            color: activeColor,
            scaleFactor: scaleFactor,
          ),
      ],
    );
  }

  // 튜닝 정도 표시
  Widget _buildTuningMeter(
    bool isTuning,
    Color statusColor,
    Color successColor,
    Color meterBgColor,
    Color labelColor,
    double scaleFactor,
  ) {
    // cents 값을 -50~50으로 제한 (50이 넘어가면 음정이 바뀜)
    final double clampedCents = math.max(-50, math.min(50, cents));
    // 미터기 표시를 위해 정규화 (-1~1)
    final double indicatorPosition = (clampedCents + 50) / 100;

    return Column(
      children: [
        SizedBox(
          height: 32 * scaleFactor,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 8 * scaleFactor,
                    decoration: BoxDecoration(
                      color: meterBgColor,
                      borderRadius: BorderRadius.circular(4 * scaleFactor),
                    ),
                  ),
                  Positioned(
                    left: (constraints.maxWidth / 2) - (4 * scaleFactor),
                    child: Container(
                      width: 4 * scaleFactor,
                      height: 16 * scaleFactor,
                      decoration: BoxDecoration(
                        color: const Color(0x8034D399),
                        borderRadius: BorderRadius.circular(2 * scaleFactor),
                      ),
                    ),
                  ),
                  if (isTuning)
                    Positioned(
                      left: indicatorPosition * constraints.maxWidth -
                          (2 * scaleFactor),
                      child: Container(
                        width: 4 * scaleFactor,
                        height: 32 * scaleFactor,
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(2 * scaleFactor),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 8 * scaleFactor),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0 * scaleFactor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '-50',
                style: TextStyle(fontSize: 12 * scaleFactor, color: labelColor),
              ),
              Text(
                '0',
                style: TextStyle(fontSize: 12 * scaleFactor, color: labelColor),
              ),
              Text(
                '+50',
                style: TextStyle(fontSize: 12 * scaleFactor, color: labelColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 음정 표시 텍스트
class _NoteText extends StatelessWidget {
  final String mainNote;
  final String accidental;
  final Color color;
  final double scaleFactor;

  const _NoteText({
    required this.mainNote,
    required this.accidental,
    required this.color,
    required this.scaleFactor,
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
            style: TextStyle(
              fontSize: 96 * scaleFactor,
              letterSpacing: -4 * scaleFactor,
            ),
          ),
          if (accidental.isNotEmpty)
            TextSpan(
              text: accidental,
              style: TextStyle(
                fontSize: 60 * scaleFactor,
                fontFeatures: [FontFeature.superscripts()],
              ),
            ),
        ],
      ),
    );
  }
}
