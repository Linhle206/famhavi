import 'package:flutter/material.dart';

class RepresentativeColor extends StatelessWidget {
  const RepresentativeColor({
    super.key,
    this.onTap,
    required this.color,
    required this.selected,
  });
  final onTap;
  final Color color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 27),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(width: 2, color: color)),
        child: Padding(
          padding: EdgeInsets.all(selected ? 3 : 0),
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        ),
      ),
    );
  }
}
