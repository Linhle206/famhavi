import 'package:famhive/components/body_page.dart';
import 'package:famhive/components/button.dart';
import 'package:famhive/components/textFormField.dart';
import 'package:famhive/components/text_content.dart';
import 'package:famhive/components/top_bar.dart';
import 'package:famhive/constants.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopBar(text: 'Reset Password'),
          Body(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TextContent(
                  text:
                      'Enter the email associated with your account and we\'ll send an email with instructions to reset your password.',
                  weight: FontWeight.w400,
                  top: 0,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TextContent(
                        text: 'Email Address',
                      ),
                      CustomTextField(
                        text: 'Enter your email address',
                        bottom: 25,
                        valudationCode: ValidationCode.email,
                        errorMessage: 'Enter correc email',
                        controller: _emailController,
                      ),
                      CustomButton(
                        text: 'Send Instruction',
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/createNewPassword');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
