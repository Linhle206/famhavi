import 'package:famhive/components/body_page.dart';
import 'package:famhive/components/button.dart';
import 'package:famhive/components/form_verification_code.dart';
import 'package:famhive/components/textFormField.dart';
import 'package:famhive/components/text_content.dart';
import 'package:famhive/components/top_bar.dart';
import 'package:famhive/constants.dart';
import 'package:flutter/material.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(text: 'Create New Password'),
            Body(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TextContent(
                      text:
                          'Enter the 4 digits code you received in your email. Then set the new password for your account to log in.',
                      top: 0),
                  const TextContent(text: 'Verification Code'),
                  const FormVerificationCode(),
                  Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const TextContent(text: 'Password'),
                        const CustomTextField(
                          text: 'Enter Password',
                          bottom: 10,
                          valudationCode: ValidationCode.password,
                          errorMessage:
                              'Password should contain Capital, small letter & Number & Special',
                        ),
                        const TextContent(
                          text: 'Confirm Password',
                        ),
                        const CustomTextField(
                          text: 'Enter confirm password',
                          bottom: 30,
                          valudationCode: ValidationCode.password,
                          errorMessage:
                              'Password should contain Capital, small letter & Number & Special',
                        ),
                        CustomButton(
                          text: 'Create New Password',
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/resetSuccess');
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
