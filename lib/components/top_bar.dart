import 'package:famhive/components/text_content.dart';
import 'package:famhive/constants.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 24, top: 20, right: 24, bottom: 10),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xfff0f2f1)))),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffdbe0df),
              ),
              child: Center(
                child: Icon(
                  Icons.chevron_left,
                  color: AppColors.contentColor,
                ),
              ),
            ),
            TextContent(
              text: text,
              size: 24,
              bottom: 0,
            ),
          ],
        ),
      ),
    );
  }
}
