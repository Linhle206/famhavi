import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, top: 15, right: 24),
      child: content,
    );
  }
}
