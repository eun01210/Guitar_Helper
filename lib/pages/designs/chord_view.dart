import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart';
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
    const Color cardBgColor = Color(0xFF171717); // zinc-900
    const Color buttonBgColor = Color(0xFF27272A); // zinc-800
    const Color buttonTextColor = Color(0xFFD4D4D8); // zinc-300
    const Color textColor = Colors.white;
    const Color subTextColor = Color(0xFFA1A1AA); // zinc-400
    const Color inactiveToggleColor = Color(0xFF3F3F46); // zinc-700

    final List<String> rootNotes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
    final List<String> accidentals = ['♭', '♮', '♯'];
    final List<String> chordTypes = ['maj', 'm', '7', 'm7', 'M7', '7sus4'];

    return Scaffold(
      backgroundColor: backgroundDark,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xCC101F22),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: textColor,
          ),
          onPressed: onBack,
        ),
        title: const Text(
          'Chord',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 28, color: textColor),
            onPressed: onSettings,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 448), // max-w-md
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // 화면 높이에 따라 UI가 깨지지 않도록 FittedBox로 감싸서 스케일 조정
                  return FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: Column(
                        children: [
                          // Fretboard Card
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
                                        Text(
                                          fullChordName,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: subTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
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
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: ChordFret(
                                    fretboardData: fretboardData,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Finger/Degree Toggle
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
                          // Controls
                          Column(
                            children: [
                              // Root Note Buttons
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
                              // Accidental & Chord Type
                              Column(
                                children: [
                                  // Accidental Buttons
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
                                  // Chord Type Dropdown
                                  Container(
                                    decoration: BoxDecoration(
                                      color: buttonBgColor,
                                      borderRadius: BorderRadius.circular(99),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: selectedChordType,
                                        onChanged: onChordTypeSelected,
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 16.0),
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
