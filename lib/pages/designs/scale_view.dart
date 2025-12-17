import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/note.dart';
import 'package:guitar_helper/widgets/fretbox.dart';
import 'package:guitar_helper/widgets/appbar.dart';
import 'package:guitar_helper/datas/scales.dart';
import 'package:guitar_helper/widgets/select.dart';

class ScaleView extends StatelessWidget {
  final String selectedRootNote;
  final String selectedAccidental;
  final String selectedScaleType;
  final String fullScaleName;
  final List<List<NoteData?>> fretboardData;

  final VoidCallback onBack;
  final VoidCallback onSettings;
  final VoidCallback onFullScreenTap;
  final ValueChanged<String> onRootNoteSelected;
  final ValueChanged<String> onAccidentalSelected;
  final ValueChanged<String?> onScaleTypeSelected;

  const ScaleView({
    super.key,
    required this.selectedRootNote,
    required this.selectedAccidental,
    required this.selectedScaleType,
    required this.fullScaleName,
    required this.fretboardData,
    required this.onBack,
    required this.onSettings,
    required this.onFullScreenTap,
    required this.onRootNoteSelected,
    required this.onAccidentalSelected,
    required this.onScaleTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color backgroundColor = colorScheme.tertiary;
    final Color cardBgColor = colorScheme.secondary;
    final Color buttonBgColor = colorScheme.secondary;
    final Color textColor = colorScheme.onSurface;
    final Color subTextColor = colorScheme.onSurfaceVariant;

    // datas/scales에서 스케일 목록 받아오기
    final List<String> scaleTypes = scales.keys.toList();

    // 화면 너비에 따른 스케일 팩터 계산
    final screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    double scaleFactor = 1.0;
    double maxWidth = 1000;
    if (screenWidth * 2 > screenHeight) {
      scaleFactor = (screenHeight / 800.0).clamp(0.5, 2.5);
      maxWidth = screenHeight / 2 - 40;
    } else {
      scaleFactor = (screenWidth / 400.0).clamp(0.5, 2.5);
      maxWidth = screenWidth - 40;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Scale',
        onBack: onBack,
        onSettings: onSettings,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0 * scaleFactor),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: Column(
                      children: [
                        // 프렛 박스 (스케일, 이름 표시 등)
                        Container(
                          padding: EdgeInsets.all(24 * scaleFactor),
                          decoration: BoxDecoration(
                            color: cardBgColor,
                            borderRadius: BorderRadius.circular(
                              12 * scaleFactor,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // 기본 스케일 표시 (C, D, ...)
                                      Text(
                                        selectedRootNote +
                                            ((selectedAccidental == '♮')
                                                ? ''
                                                : selectedAccidental),
                                        style: TextStyle(
                                          fontSize: 48 * scaleFactor,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                      // 스케일 풀네임 표시 (C Major, ...)
                                      Text(
                                        fullScaleName,
                                        style: TextStyle(
                                          fontSize: 18 * scaleFactor,
                                          color: subTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 4 * scaleFactor),
                              // 스케일 폼 표시
                              AspectRatio(
                                aspectRatio: 1,
                                child: GuitarFretBox(
                                  fretboardData: fretboardData,
                                ),
                              ),
                              SizedBox(height: 16 * scaleFactor),
                              // 전체 화면 보기 버튼
                              _buildFullScreenButton(
                                onFullScreenTap,
                                buttonBgColor,
                                subTextColor,
                                scaleFactor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16 * scaleFactor),
                        Column(
                          children: [
                            // 기본 코드 버튼 (C, D, E, ...)
                            RootNoteSelector(
                              value: selectedRootNote,
                              onChanged: onRootNoteSelected,
                              scaleFactor: scaleFactor,
                            ),
                            SizedBox(height: 16 * scaleFactor),
                            Column(
                              children: [
                                // #, b, ♮ 버튼
                                AccidentalSelector(
                                  value: selectedAccidental,
                                  onChanged: onAccidentalSelected,
                                  scaleFactor: scaleFactor,
                                ),
                                SizedBox(height: 16 * scaleFactor),
                                // 스케일 타입 셀렉트 박스
                                ChordSelectBox(
                                  value: selectedScaleType,
                                  onChanged: onScaleTypeSelected,
                                  items: scaleTypes,
                                  scaleFactor: scaleFactor,
                                ),
                                SizedBox(height: 16 * scaleFactor),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // 풀스크린 버튼
  Widget _buildFullScreenButton(
    VoidCallback onPressed,
    Color bgColor,
    Color fgColor,
    double scaleFactor,
  ) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.fullscreen,
        color: fgColor,
        size: 20 * scaleFactor,
      ),
      label: Text(
        'Full Screen View',
        style: TextStyle(
          color: fgColor,
          fontWeight: FontWeight.w500,
          fontSize: 14 * scaleFactor,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * scaleFactor,
          vertical: 8 * scaleFactor,
        ),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
      ),
    );
  }
}
