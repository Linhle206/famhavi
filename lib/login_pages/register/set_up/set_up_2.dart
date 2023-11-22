import 'package:famhive/components/body_page.dart';
import 'package:famhive/components/button.dart';
import 'package:famhive/components/representative_color.dart';
import 'package:famhive/components/step.dart';
import 'package:famhive/components/textFormField.dart';
import 'package:famhive/components/text_content.dart';
import 'package:famhive/components/top_bar_setup.dart';
import 'package:flutter/material.dart';
import 'package:famhive/constants.dart';
import 'package:http/http.dart';

class SetUp2 extends StatefulWidget {
  const SetUp2({super.key});

  @override
  State<SetUp2> createState() => _SetUp2State();
}

class _SetUp2State extends State<SetUp2> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Color representativeColor2 = Colors.white;

  Future<void> patchMeData() async {
    Response response = await patch(
        Uri.parse(
          'https://api.famhive-dev.novahub.vn/${Url.spouseData}',
        ),
        body: {
          'fullName': _nameController.text,
          'email': _emailController.text,
          'color': representativeColor2.toString(),
        },
        headers: {
          'Authorization': 'Bearer ${Url.token}',
        });
    print(response.body);
  }

  List<Map<String, dynamic>> colors = [
    {'color': AppColors.colorRed, 'select': false},
    {'color': AppColors.colorOrange, 'select': false},
    {'color': AppColors.colorYelow, 'select': false},
    {'color': AppColors.colorPurple, 'select': false},
    {'color': AppColors.colorGreen, 'select': false},
    {'color': AppColors.colorGrey, 'select': false},
    {'color': AppColors.colorBlack, 'select': false},
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List<Widget> representative = List.generate(7, (index) {
      return RepresentativeColor(
          color: colors[index]['color'],
          selected: colors[index]['select'],
          onTap: () {
            setState(() {
              for (var i = 0; i < colors.length; i++) {
                colors[i]['select'] = false;
              }
              colors[index]['select'] = true;
              representativeColor2 = colors[index]['color'];
            });
          });
    });

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
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const TextContent(text: 'Name'),
                            CustomTextField(
                              text: 'Enter the name',
                              controller: _nameController,
                            ),
                            const TextContent(text: 'Email'),
                            CustomTextField(
                              text: 'Enter the email',
                              controller: _emailController,
                            ),
                            const TextContent(text: 'Representtative color'),
                            Row(
                              children: representative,
                            )
                          ],
                        ),
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
                                    patchMeData();
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
