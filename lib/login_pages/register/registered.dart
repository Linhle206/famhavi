import 'package:famhive/components/body_page.dart';
import 'package:famhive/components/button.dart';
import 'package:famhive/components/text_content.dart';
import 'package:flutter/material.dart';

class Registered extends StatefulWidget {
  const Registered({super.key});

  @override
  State<Registered> createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Column(
              children: [
                Image(image: AssetImage('assets/images/Union_check.png')),
                TextContent(
                  text: 'Registered successfully',
                  size: 16,
                  top: 40,
                ),
                TextContent(
                  text:
                      'Thanks for choosing Famhive.\n Next, let\'s set up your family board!',
                  align: TextAlign.center,
                  weight: FontWeight.w400,
                  bottom: 30,
                ),
              ],
            ),
            CustomButton(
              text: 'Next',
              onTap: () {
                Navigator.pushNamed(context, '/setUp1');
              },
            )
          ],
        ),
      ),
    );
  }
}
