import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/note.dart';
import 'package:guitar_helper/widgets/appbar.dart';
import 'package:guitar_helper/widgets/chordfret.dart';
import 'package:guitar_helper/widgets/select.dart';

class ChordView extends StatelessWidget {
  final String selectedRootNote;
  final String selectedAccidental;
  final String selectedChordType;
  final String fullChordName;
  final int selectedForm;
  final bool isFingerMode;
  final List<List<NoteData?>> fretboardData;

  final VoidCallback onBack;
  final VoidCallback onSettings;
  final VoidCallback onFormPrevious;
  final VoidCallback onFormNext;
  final ValueChanged<bool> onFingerModeChanged;
  final ValueChanged<String> onRootNoteSelected;
  final ValueChanged<String> onAccidentalSelected;
  final ValueChanged<String?> onChordTypeSelected;

  const ChordView({
    super.key,
    required this.selectedRootNote,
    required this.selectedAccidental,
    required this.selectedChordType,
    required this.fullChordName,
    required this.selectedForm,
    required this.isFingerMode,
    required this.fretboardData,
    required this.onBack,
    required this.onSettings,
    required this.onFormPrevious,
    required this.onFormNext,
    required this.onFingerModeChanged,
    required this.onRootNoteSelected,
    required this.onAccidentalSelected,
    required this.onChordTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color backgroundColor = colorScheme.tertiary; // ChordView 배경
    final Color cardBgColor = colorScheme.secondary; // 카드 배경
    final Color buttonBgColor = colorScheme.secondaryContainer; // 버튼 배경
    final Color buttonTextColor = colorScheme.outline; // 버튼 텍스트
    final Color textColor = colorScheme.onSurface; // 기본 텍스트
    final Color subTextColor = colorScheme.onSurfaceVariant; // 보조 텍스트
    final Color toggleSelectedColor = colorScheme.outlineVariant; // 토글 선택 배경

    final List<String> chordTypes = [
      'maj',
      'm',
      '7',
      'm7',
      'M7',
      '7sus4',
      'm7b5'
    ];

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
        title: 'Chord',
        onBack: onBack,
        onSettings: onSettings,
        textColor: textColor,
        backgroundColor: backgroundColor.withAlpha(204),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 프렛 박스 (코드, 폼 표시 등)
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
                                      // 기본 코드 표시 (C, D, ...)
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
                                      // 코드 풀네임 표시 (C, Cm7, ...)
                                      Text(
                                        fullChordName,
                                        style: TextStyle(
                                          fontSize: 18 * scaleFactor,
                                          color: subTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // 폼 변경 버튼
                                  Row(
                                    children: [
                                      _buildSmallButton(
                                        Icons.chevron_left,
                                        onFormPrevious,
                                        buttonBgColor,
                                        buttonTextColor,
                                        scaleFactor,
                                      ),
                                      SizedBox(
                                          width: 60 * scaleFactor,
                                          child: Center(
                                            child: Text(
                                              (selectedForm + 1).toString(),
                                              style: TextStyle(
                                                fontSize: 36 * scaleFactor,
                                                fontWeight: FontWeight.bold,
                                                color: textColor,
                                              ),
                                            ),
                                          )),
                                      _buildSmallButton(
                                        Icons.chevron_right,
                                        onFormNext,
                                        buttonBgColor,
                                        buttonTextColor,
                                        scaleFactor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 4 * scaleFactor),
                              // 코드 폼 표시
                              AspectRatio(
                                aspectRatio: 1,
                                child: ChordFret(
                                  fretboardData: fretboardData,
                                  showBarreConnections: isFingerMode,
                                ),
                              ),
                              SizedBox(height: 8 * scaleFactor),
                              // 손가락 번호/도 변경 토글
                              Container(
                                padding: EdgeInsets.all(4 * scaleFactor),
                                decoration: BoxDecoration(
                                  color: buttonBgColor,
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildToggleItem(
                                      'Finger',
                                      isFingerMode,
                                      () => onFingerModeChanged(true),
                                      toggleSelectedColor,
                                      textColor,
                                      subTextColor,
                                      scaleFactor,
                                    ),
                                    _buildToggleItem(
                                      'Degree',
                                      !isFingerMode,
                                      () => onFingerModeChanged(false),
                                      toggleSelectedColor,
                                      textColor,
                                      subTextColor,
                                      scaleFactor,
                                    ),
                                  ],
                                ),
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
                                // 풀코드 셀렉트 박스
                                ChordSelectBox(
                                  value: selectedChordType,
                                  onChanged: onChordTypeSelected,
                                  items: chordTypes,
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

  Widget _buildSmallButton(
    IconData icon,
    VoidCallback onPressed,
    Color bgColor,
    Color iconColor,
    double scaleFactor,
  ) {
    return SizedBox(
      width: 40 * scaleFactor,
      height: 40 * scaleFactor,
      child: Material(
        color: bgColor,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Icon(
            icon,
            size: 20 * scaleFactor,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  Widget _buildToggleItem(
    String text,
    bool isSelected,
    VoidCallback onPressed,
    Color activeColor,
    Color textColor,
    Color subTextColor,
    double scaleFactor,
  ) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? activeColor : Colors.transparent,
          foregroundColor: isSelected ? textColor : subTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
          padding: EdgeInsets.symmetric(vertical: 8 * scaleFactor),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14 * scaleFactor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
