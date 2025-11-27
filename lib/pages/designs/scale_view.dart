import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart';
import 'package:my_app/widgets/fretbox.dart';
import 'package:my_app/widgets/appbar.dart';
import 'package:my_app/datas/scales.dart';

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
    final List<String> scaleTypes = scales.keys.toList();

    return Scaffold(
      backgroundColor: backgroundDark,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Scale',
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
                  return FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: Column(
                        children: [
                          // 프렛 박스 (스케일, 이름 표시 등)
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
                                        // 기본 스케일 표시 (C, D, ...)
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
                                        // 스케일 풀네임 표시 (C Major, ...)
                                        Text(
                                          fullScaleName,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: subTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                // 스케일 폼 표시
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: GuitarFretBox(
                                    fretboardData: fretboardData,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // 전체 화면 보기 버튼
                                _buildFullScreenButton(onFullScreenTap),
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
                                  // 스케일 타입 셀렉트 박스
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
                                            value: selectedScaleType,
                                            onChanged: onScaleTypeSelected,
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
                                                scaleTypes.map((type) {
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

  Widget _buildFullScreenButton(VoidCallback onPressed) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.fullscreen, color: Color(0xFFA1A1AA), size: 20),
      label: const Text(
        'Full Screen View',
        style: TextStyle(
          color: Color(0xFFA1A1AA),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        backgroundColor: const Color(0xFF27272A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
      ),
    );
  }
}
