import 'package:famhive/login_pages/login_page.dart';
import 'package:famhive/login_pages/register/register.dart';
import 'package:famhive/login_pages/register/registered.dart';
import 'package:famhive/login_pages/register/set_up/set_up_1.dart';
import 'package:famhive/login_pages/register/set_up/set_up_2.dart';
import 'package:famhive/login_pages/register/set_up/set_up_3.dart';
import 'package:famhive/login_pages/reset_password/create_new_password.dart';
import 'package:famhive/login_pages/reset_password/reset_password_page.dart';
import 'package:famhive/login_pages/reset_password/reset_success_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/resetPassword': (context) => const ResetPasswordPage(),
        '/createNewPassword': (context) => const CreateNewPassword(),
        '/resetSuccess': (context) => const ResetSuccessPage(),
        '/register': (context) => const Register(),
        '/registered': (context) => const Registered(),
        '/setUp1': (context) => const SetUp1(),
        '/setUp2': (context) => const SetUp2(),
        '/setUp3': (context) => const SetUp3(),
      },
    );
  }
}
