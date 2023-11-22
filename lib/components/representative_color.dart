import 'package:flutter/material.dart';

class RepresentativeColor extends StatelessWidget {
  const RepresentativeColor({
    super.key,
    this.onTap,
    required this.color,
    required this.selected,
  });
  final dynamic onTap;
  final Color color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: width * 0.06),
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
