import 'dart:convert';

import 'package:famhive/components/button.dart';
import 'package:famhive/components/textFormField.dart';
import 'package:famhive/components/text_content.dart';
import 'package:famhive/constants.dart';
import 'package:famhive/components/background_login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorText = '';
  bool visibleTextError = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final textkey = GlobalKey();
  Future login(String email, String password) async {
    try {
      Response response = await post(
          Uri.parse('https://api.famhive-dev.novahub.vn/${Url.login}'),
          body: {
            'email': email,
            'password': password,
          });
      if (response.statusCode == 200) {
        print('login');
        setState(() {
          visibleTextError = false;
          errorText = '';
        });
        var accessToken = jsonDecode(response.body)['token']['accessToken'];
        print(accessToken);
        Url.token = accessToken;
      }
      if (response.statusCode == 404) {
        setState(() {
          visibleTextError = true;
          errorText = 'The Email or Password is not correct';
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundLoginPage(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Column(
              children: [
                TextContent(
                  text: 'FAMHIVE',
                  color: Color(0xffebb100),
                  size: 24,
                  bottom: 0,
                ),
                TextContent(text: 'FAMILY ORGANIZER', top: 0),
              ],
            ),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  const TextContent(text: 'Email Address', top: 0),
                  CustomTextField(
                    text: 'Enter your email',
                    valudationCode: ValidationCode.email,
                    errorMessage: 'Enter correct Email',
                    controller: _emailController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextContent(text: 'Password'),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/resetPassword');
                        },
                        child: const TextContent(
                          text: 'Forgot Password?',
                          color: Color(0xff7cbdae),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    text: 'Enter your password',
                    bottom: 20,
                    valudationCode: ValidationCode.password,
                    errorMessage:
                        'Password should contain Capital, small letter & Number & Special',
                    controller: _passwordController,
                  ),
                  Visibility(
                    visible: visibleTextError,
                    child: TextContent(
                      text: errorText,
                      weight: FontWeight.w400,
                      top: 0,
                    ),
                  ),

                  // login
                  CustomButton(
                    text: 'Login',
                    bottom: 10,
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        login(
                          _emailController.text,
                          _passwordController.text,
                        );
                      }
                      Navigator.pushNamed(context, '/setUp1');
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const TextContent(
                    text: 'or login with', weight: FontWeight.w400),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffeff7f5),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.apple,
                          size: 30,
                          color: Color(0xff999999),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffeff7f5),
                        image: DecorationImage(
                            image: AssetImage('assets/images/Google.png')),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextContent(text: 'Didn\'t have account yet?'),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const TextContent(
                          text: 'Register Now', color: AppColors.mainColor),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
