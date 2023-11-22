import 'package:famhive/components/background_login_page.dart';
import 'package:famhive/components/button.dart';
import 'package:famhive/components/textFormField.dart';
import 'package:famhive/components/text_content.dart';
import 'package:famhive/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundLoginPage(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextContent(
              text: 'REGISTER AN ACCOUNT',
              align: TextAlign.center,
              size: 24,
              bottom: 0,
              top: 0,
            ),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TextContent(text: 'Email Address', top: 15),
                  CustomTextField(
                    text: 'Enter your email address',
                    valudationCode: ValidationCode.email,
                    errorMessage: 'Enter correc email',
                    controller: _emailController,
                  ),
                  const TextContent(text: 'Password', top: 20),
                  CustomTextField(
                    text: 'Enter your password',
                    valudationCode: ValidationCode.password,
                    errorMessage:
                        'Password should contain Capital, small letter & Number & Special',
                    controller: _passwordController,
                  ),
                  const TextContent(text: 'Name', top: 20),
                  CustomTextField(
                    text: 'Enter your name',
                    bottom: 25,
                    controller: _nameController,
                  ),
                  CustomButton(
                    text: 'Register',
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/registered');
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextContent(
                  text: 'Had an account already?',
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child:
                      TextContent(text: 'Log in', color: AppColors.mainColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
