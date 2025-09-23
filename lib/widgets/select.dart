import 'package:flutter/material.dart';

class ChordSelectBox extends StatelessWidget {
  // 1. 외부에서 전달받을 값과 콜백 함수를 정의합니다.
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  const ChordSelectBox({
    super.key,
    required this.selectedItem,
    required this.onChanged,
  });

  final List<String> _items = const ['C', 'D', 'E', 'F', 'G', 'A', 'B'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: DropdownButton<String>(
        value: selectedItem, // 외부에서 전달받은 값 사용
        items:
            _items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        onChanged: onChanged, // 외부에서 전달받은 콜백 함수 사용
        underline: Container(),
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
