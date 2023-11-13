import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor1 = Color(0xffddfff0);
  static const Color backgroundColor2 = Color(0xff83e2ff);
  static const Color mainColor = Color(0xff7cbdae);
  static const Color contentColor = Color(0xff333333);
  static const Color inputTextColor = Color(0xff666666);
  static const Color colorBlue = Color(0xff94cbfe);
  static const Color colorOrange = Color(0xffffcea3);
  static const Color colorYelow = Color(0xffffe699);
  static const Color colorPurple = Color(0xffc29cff);
  static const Color colorGreen = Color(0xffaaff9c);
  static const Color colorGrey = Color(0xffcbcbcb);
  static const Color colorBlack = Color(0xff252525);
  static const Color colorPink = Color(0xffff98e2);
  static const Color colorRed = Color(0xffff7a7a);
  static const Color colorTitleKidCard = Color(0xffeff7f5);
}

class ValidationCode {
  static const String name = r'^[a-z A-Z]+$';
  static const String password = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)';
  static const String email = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
}
