import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/note.dart';
import 'package:guitar_helper/widgets/appbar.dart';
import 'package:guitar_helper/widgets/chordfret.dart';

class ChordView extends StatelessWidget {
  final String selectedRootNote;
  final String selectedAccidental;
  final String selectedChordType;
  final String fullChordName;
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
    const Color primaryColor = Color(0xFF13C8EC);
    const Color backgroundDark = Color(0xFF101F22);
    const Color cardBgColor = Color(0xFF171717);
    const Color buttonBgColor = Color(0xFF27272A);
    const Color buttonTextColor = Color(0xFFD4D4D8);
    const Color textColor = Colors.white;
    const Color subTextColor = Color(0xFFA1A1AA);
    const Color inactiveToggleColor = Color(0xFF3F3F46);

    final List<String> rootNotes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
    final List<String> accidentals = ['♭', '♮', '♯'];
    final List<String> chordTypes = ['maj', 'm', '7', 'm7', 'M7', '7sus4'];

    // 화면 너비에 따른 스케일 팩터 계산
    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.5);

    return Scaffold(
      backgroundColor: backgroundDark,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Chord',
        onBack: onBack,
        onSettings: onSettings,
        textColor: textColor,
        backgroundColor: const Color(0xCC101F22),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // FittedBox -> 화면이 깨지지 않게 사이즈 조절
                return FittedBox(
                  fit: BoxFit.contain,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: Column(
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
                                          scaleFactor,
                                        ),
                                        SizedBox(width: 8 * scaleFactor),
                                        _buildSmallButton(
                                          Icons.chevron_right,
                                          onFormNext,
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
                                        scaleFactor,
                                      ),
                                      _buildToggleItem(
                                        'Degree',
                                        !isFingerMode,
                                        () => onFingerModeChanged(false),
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
                              GridView.count(
                                crossAxisCount: 7,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 8 * scaleFactor,
                                crossAxisSpacing: 8 * scaleFactor,
                                children:
                                    rootNotes.map((note) {
                                      final isSelected =
                                          note == selectedRootNote;
                                      return ElevatedButton(
                                        onPressed:
                                            () => onRootNoteSelected(note),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              isSelected
                                                  ? primaryColor
                                                  : buttonBgColor,
                                          foregroundColor:
                                              isSelected
                                                  ? textColor
                                                  : buttonTextColor,
                                          shape: const CircleBorder(),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Text(
                                          note,
                                          style: TextStyle(
                                            fontSize: 18 * scaleFactor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                              ),
                              SizedBox(height: 16 * scaleFactor),
                              Column(
                                children: [
                                  // #, b, ♮ 버튼
                                  Container(
                                    padding: EdgeInsets.all(4 * scaleFactor),
                                    decoration: BoxDecoration(
                                      color: buttonBgColor,
                                      borderRadius: BorderRadius.circular(99),
                                    ),
                                    child: Row(
                                      children:
                                          accidentals.map((acc) {
                                            final isSelected =
                                                acc == selectedAccidental;
                                            return Expanded(
                                              child: TextButton(
                                                onPressed:
                                                    () => onAccidentalSelected(
                                                      acc,
                                                    ),
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      isSelected
                                                          ? inactiveToggleColor
                                                          : Colors.transparent,
                                                  foregroundColor:
                                                      isSelected
                                                          ? textColor
                                                          : subTextColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          99,
                                                        ),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 8 * scaleFactor,
                                                  ),
                                                ),
                                                child: Text(
                                                  acc,
                                                  style: TextStyle(
                                                    fontSize: 16 * scaleFactor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                  SizedBox(height: 16 * scaleFactor),
                                  // 풀코드 셀렉트 박스
                                  Material(
                                    color: buttonBgColor, // 배경색
                                    borderRadius: BorderRadius.circular(
                                      99,
                                    ), // 둥근 모서리
                                    clipBehavior: Clip.antiAlias,
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: selectedChordType,
                                          onChanged: onChordTypeSelected,
                                          // 버튼의 높이를 scaleFactor에 따라 조절
                                          itemHeight:
                                              (48 * scaleFactor < 48)
                                                  ? null
                                                  : 48 * scaleFactor,
                                          icon: Padding(
                                            padding: EdgeInsets.only(
                                              right: 8.0 * scaleFactor,
                                            ),
                                            child: Icon(
                                              Icons.expand_more,
                                              color: textColor,
                                            ),
                                          ),
                                          dropdownColor: buttonBgColor,
                                          items:
                                              chordTypes.map((type) {
                                                return DropdownMenuItem<String>(
                                                  value: type,
                                                  child: Center(
                                                    child: Text(
                                                      type,
                                                      style: TextStyle(
                                                        fontSize:
                                                            16 * scaleFactor,
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16 * scaleFactor),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
    double scaleFactor,
  ) {
    return SizedBox(
      width: 40 * scaleFactor,
      height: 40 * scaleFactor,
      child: Material(
        color: const Color(0xFF27272A),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Icon(
            icon,
            size: 20 * scaleFactor,
            color: const Color(0xFFD4D4D8),
          ), // zinc-300
        ),
      ),
    );
  }

  Widget _buildToggleItem(
    String text,
    bool isSelected,
    VoidCallback onPressed,
    double scaleFactor,
  ) {
    const Color textColor = Colors.white;
    const Color subTextColor = Color(0xFFA1A1AA);
    const Color inactiveToggleColor = Color(0xFF3F3F46);

    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor:
              isSelected ? inactiveToggleColor : Colors.transparent,
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
