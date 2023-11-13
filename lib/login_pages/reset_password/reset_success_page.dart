import 'package:famhive/components/body_page.dart';
import 'package:famhive/components/button.dart';
import 'package:famhive/components/text_content.dart';
import 'package:flutter/material.dart';

class ResetSuccessPage extends StatefulWidget {
  const ResetSuccessPage({super.key});

  @override
  State<ResetSuccessPage> createState() => _ResetSuccessPageState();
}

class _ResetSuccessPageState extends State<ResetSuccessPage> {
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
                  text: 'Reset Password Successfully',
                  size: 16,
                  top: 40,
                ),
                TextContent(
                  text:
                      'Congratulation, you have reset the new password\n successfully. Let\'s continue with Famhive.',
                  align: TextAlign.center,
                  weight: FontWeight.w400,
                  bottom: 30,
                ),
              ],
            ),
            CustomButton(
              text: 'Continue',
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ),
      ),
    );
  }
}
