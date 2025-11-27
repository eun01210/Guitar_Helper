import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart';
import 'package:my_app/widgets/appbar.dart';
import 'package:my_app/widgets/chordfret.dart';

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
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 448),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // FittedBox -> 화면이 깨지지 않게 사이즈 조절
                  return FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: Column(
                        children: [
                          // 프렛 박스 (코드, 폼 표시 등)
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: cardBgColor,
                              borderRadius: BorderRadius.circular(12),
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
                                          style: const TextStyle(
                                            fontSize: 48,
                                            fontWeight: FontWeight.bold,
                                            color: textColor,
                                          ),
                                        ),
                                        // 코드 풀네임 표시 (C, Cm7, ...)
                                        Text(
                                          fullChordName,
                                          style: const TextStyle(
                                            fontSize: 18,
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
                                        ),
                                        const SizedBox(width: 8),
                                        _buildSmallButton(
                                          Icons.chevron_right,
                                          onFormNext,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                // 코드 폼 표시
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: ChordFret(
                                    fretboardData: fretboardData,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // 손가락 번호/도 변경 토글
                                Container(
                                  padding: const EdgeInsets.all(4),
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
                                      ),
                                      _buildToggleItem(
                                        'Degree',
                                        !isFingerMode,
                                        () => onFingerModeChanged(false),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            children: [
                              // 기본 코드 버튼 (C, D, E, ...)
                              GridView.count(
                                crossAxisCount: 7,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
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
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                              ),
                              const SizedBox(height: 16),
                              Column(
                                children: [
                                  // #, b, ♮ 버튼
                                  Container(
                                    padding: const EdgeInsets.all(4),
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
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                      ),
                                                ),
                                                child: Text(
                                                  acc,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // 풀코드 셀렉트 박스
                                  Material(
                                    color: buttonBgColor,
                                    borderRadius: BorderRadius.circular(99),
                                    clipBehavior: Clip.antiAlias,
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: selectedChordType,
                                            onChanged: onChordTypeSelected,
                                            icon: const Padding(
                                              padding: EdgeInsets.only(
                                                right: 8.0,
                                              ),
                                              child: Icon(
                                                Icons.expand_more,
                                                color: textColor,
                                              ),
                                            ),
                                            dropdownColor: buttonBgColor,
                                            items:
                                                chordTypes.map((type) {
                                                  return DropdownMenuItem<
                                                    String
                                                  >(
                                                    value: type,
                                                    child: Center(
                                                      child: Text(
                                                        type,
                                                        style: const TextStyle(
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
                                  ),
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
      ),
    );
  }

  Widget _buildSmallButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        color: const Color(0xFF27272A), // zinc-800
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Icon(
            icon,
            size: 20,
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
          padding: const EdgeInsets.symmetric(vertical: 8),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
