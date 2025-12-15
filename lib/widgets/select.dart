import 'package:flutter/material.dart';

class ChordSelectBox extends StatelessWidget {
  final String? selectedItem;
  final ValueChanged<String?> onChanged;
  final List<String> items;

  const ChordSelectBox({
    super.key,
    required this.selectedItem,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25), // 그림자 색상 (투명도 조절)
            spreadRadius: 1, // 그림자가 번지는 정도
            blurRadius: 5, // 그림자 흐림 정도
            offset: const Offset(0, 3), // 그림자 위치 (x: 0, y: 3만큼 아래로)
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: selectedItem, // 외부에서 전달받은 값 사용
        dropdownColor: colorScheme.secondaryContainer,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: onChanged, // 외부에서 전달받은 콜백 함수 사용
        underline: Container(),
        style: TextStyle(color: colorScheme.onSurface, fontSize: 16),
      ),
    );
  }
}
