import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final Color checkmarkColor;
  final bool selected;
  final Color selectedColor;
  final void Function(bool)? onSelected;
  const RadioButton(
      {Key? key,
      required this.label,
      required this.textColor,
      required this.backgroundColor,
      required this.checkmarkColor,
      required this.selected,
      required this.selectedColor,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 15,
          ),
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side:
              const BorderSide(color: Color.fromRGBO(52, 168, 83, 1), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        checkmarkColor: checkmarkColor,
        selectedColor: selectedColor,
        selected: selected,
        onSelected: onSelected);
  }
}
