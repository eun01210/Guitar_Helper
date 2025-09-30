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

  static const List<String> _items = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
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
