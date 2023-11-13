import 'package:famhive/components/text_content.dart';
import 'package:flutter/material.dart';

class TopBarSetUp extends StatelessWidget {
  const TopBarSetUp({super.key, required this.text});
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextContent(
                text: text,
                size: 16,
                bottom: 0,
                align: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
