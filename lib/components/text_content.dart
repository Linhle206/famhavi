import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  const TextContent(
      {super.key,
      this.color = const Color(0xff333333),
      this.weight = FontWeight.w600,
      this.top = 10,
      this.bottom = 10,
      this.size = 14,
      this.align = TextAlign.left,
      required this.text});
  final String text;
  final Color color;
  final FontWeight weight;
  final double size;
  final double top;
  final double bottom;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
          fontFamily: 'Mukta',
        ),
      ),
    );
  }
}
