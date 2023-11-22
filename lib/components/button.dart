import 'package:famhive/components/text_content.dart';
import 'package:famhive/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.top = 0,
    this.bottom = 0,
    this.colorBackground = const Color(0xff7cbdae),
    this.colorText = const Color(0xffffffff),
  });
  final String text;
  final onTap;
  final double top;
  final double bottom;
  final Color colorBackground;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: colorBackground,
            shadowColor: Colors.white,
            fixedSize: const Size.fromHeight(44),
            side: const BorderSide(color: AppColors.mainColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: TextContent(text: text, color: colorText),
      ),
    );
  }
}
