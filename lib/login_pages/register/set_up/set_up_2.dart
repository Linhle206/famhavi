import 'package:famhive/components/body_page.dart';
import 'package:famhive/components/button.dart';
import 'package:famhive/components/person_card.dart';
import 'package:famhive/components/step.dart';
import 'package:famhive/components/text_content.dart';
import 'package:famhive/components/top_bar_setup.dart';
import 'package:flutter/material.dart';
import 'package:famhive/constants.dart';

class SetUp2 extends StatefulWidget {
  const SetUp2({super.key});

  @override
  State<SetUp2> createState() => _SetUp2State();
}

class _SetUp2State extends State<SetUp2> {
  final formkey = GlobalKey<FormState>();

  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;
  bool selected6 = false;
  bool selected7 = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Body(
          content: Form(
            key: formkey,
            child: Column(
              children: [
                const TopBarSetUp(text: 'SET UP YOUR BOARD'),
                SizedBox(
                  height: height * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StepPage(activeStep: 1),
                      const TextContent(
                          text: 'YOUR SPOUSE\'s PROFILE',
                          size: 16,
                          align: TextAlign.center),
                      const PersonCard(
                        enbleEmail: true,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomButton(
                                text: 'Back',
                                colorBackground: Colors.white,
                                colorText: AppColors.mainColor,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 7,
                              child: CustomButton(
                                text: 'Next',
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    Navigator.pushNamed(context, '/setUp3');
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
