import 'package:flutter/material.dart';

class Check extends StatelessWidget {
  final bool isChecked;
  final String text;
  final ValueChanged<bool?> onChanged;

  const Check({
    super.key,
    required this.isChecked,
    required this.text,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(text), Checkbox(value: isChecked, onChanged: onChanged)],
    );
  }
}
