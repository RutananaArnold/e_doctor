import 'package:flutter/material.dart';

class TabLabel extends StatelessWidget {
  const TabLabel({Key? key, required this.label, required this.color, required this.align}): super(key: key);

  final String label;
  final Color color;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0.0),
      alignment: align,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.5,
          color: color,
        ),
      ),
    );
  }
}
