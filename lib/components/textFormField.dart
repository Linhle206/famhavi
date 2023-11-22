import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.bottom = 0,
    this.top = 0,
    this.valudationCode = r'^[a-z A-Z]+$',
    this.errorMessage = 'Enter correct name',
    this.empty = false,
    required this.controller,
  });
  final String text;
  final double bottom;
  final double top;
  final String valudationCode;
  final String errorMessage;
  final bool empty;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          errorMaxLines: 2,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: Color(0xFFB92828),
              width: 1,
            ),
          ),
          hintStyle: const TextStyle(
            color: Color(0xff333333),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Mukta',
          ),
          constraints: const BoxConstraints(minHeight: 44),
          contentPadding:
              const EdgeInsets.only(top: 13, right: 16, bottom: 13, left: 16),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: Color(0xffdbe0df),
              width: 1,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: Color(0xffdbe0df),
              width: 1,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: Color(0xffdbe0df),
              width: 1,
            ),
          ),
        ),
        validator: (value) {
          if (empty == false) {
            if (value!.isEmpty || !RegExp(valudationCode).hasMatch(value)) {
              return errorMessage;
            } else {
              return null;
            }
          } else {
            return null;
          }
        },
      ),
    );
  }
}
