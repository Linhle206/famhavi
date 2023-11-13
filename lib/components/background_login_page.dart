import 'package:famhive/constants.dart';
import 'package:flutter/material.dart';

class BackgroundLoginPage extends StatelessWidget {
  const BackgroundLoginPage({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.backgroundColor1,
              AppColors.backgroundColor2,
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Union.png'),
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 30.0),
                  child: Image.asset('assets/images/Group_3.png'),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 30, right: 24, bottom: 0, left: 24),
                height: height * 0.645,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Container(
                  child: content,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
