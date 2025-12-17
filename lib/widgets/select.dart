import 'package:flutter/material.dart';

// 셀렉트 박스 (코드 타입 / 스케일)
class ChordSelectBox extends StatelessWidget {
  final String? value; // 현재 선택된 값
  final ValueChanged<String?> onChanged; // 변화 함수
  final List<String> items; // 선택할 수 있는 값들
  final double scaleFactor; // 화면 크기에 따른 스케일 팩터

  const ChordSelectBox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color backgroundColor = colorScheme.secondaryContainer;
    final Color textColor = colorScheme.onSurface;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(99),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 40 * scaleFactor,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            icon: Padding(
              padding: EdgeInsets.only(right: 16 * scaleFactor),
              child: Icon(
                Icons.expand_more,
                color: textColor,
                size: 24 * scaleFactor,
              ),
            ),
            style: TextStyle(
              fontSize: 16 * scaleFactor,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
            dropdownColor: backgroundColor,
            onChanged: onChanged,
            selectedItemBuilder: (BuildContext context) {
              return items.map((String item) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 16 * scaleFactor),
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 16 * scaleFactor,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList();
            },
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Center(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 16 * scaleFactor,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// 코드 선택 버튼
class RootNoteSelector extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final double scaleFactor;

  const RootNoteSelector({
    super.key,
    required this.value,
    required this.onChanged,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color primaryColor = colorScheme.primary;
    final Color buttonBgColor = colorScheme.secondaryContainer;
    final Color buttonTextColor = colorScheme.outline;
    final Color textColor = colorScheme.onSurface;

    final List<String> rootNotes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8 * scaleFactor,
      crossAxisSpacing: 8 * scaleFactor,
      children: rootNotes.map((note) {
        final isSelected = note == value;
        return ElevatedButton(
          onPressed: () => onChanged(note),
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? primaryColor : buttonBgColor,
            foregroundColor: isSelected ? textColor : buttonTextColor,
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
    );
  }
}

// 변화표 선택 버튼
class AccidentalSelector extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final double scaleFactor;

  const AccidentalSelector({
    super.key,
    required this.value,
    required this.onChanged,
    this.scaleFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color buttonBgColor = colorScheme.secondaryContainer;
    final Color textColor = colorScheme.onSurface;
    final Color subTextColor = colorScheme.onSurfaceVariant;
    final Color toggleSelectedColor = colorScheme.outlineVariant;

    final List<String> accidentals = ['b', '♮', '#'];

    return Container(
      height: 40 * scaleFactor,
      padding: EdgeInsets.all(4 * scaleFactor),
      decoration: BoxDecoration(
        color: buttonBgColor,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        children: accidentals.map((acc) {
          final isSelected = acc == value;
          return Expanded(
            child: TextButton(
              onPressed: () => onChanged(acc),
              style: TextButton.styleFrom(
                backgroundColor:
                    isSelected ? toggleSelectedColor : Colors.transparent,
                foregroundColor: isSelected ? textColor : subTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99),
                ),
                padding: EdgeInsets.symmetric(vertical: 8 * scaleFactor),
              ),
              child: Transform.translate(
                // 제자리표가 아래로 치우쳐지는 것을 방지하기 위해 보정
                offset: acc == '♮' ? Offset(0, -5 * scaleFactor) : Offset.zero,
                child: Text(
                  acc,
                  style: TextStyle(
                    fontSize: 16 * scaleFactor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
