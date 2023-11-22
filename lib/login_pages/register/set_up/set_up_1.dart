import 'package:famhive/components/body_page.dart';
import 'package:famhive/components/button.dart';
import 'package:famhive/components/person_card.dart';
import 'package:famhive/components/step.dart';
import 'package:famhive/components/text_content.dart';
import 'package:famhive/components/top_bar_setup.dart';
import 'package:flutter/material.dart';
import 'package:famhive/constants.dart';
import 'package:http/http.dart';

class SetUp1 extends StatefulWidget {
  const SetUp1({super.key});

  @override
  State<SetUp1> createState() => _SetUp1State();
}

class _SetUp1State extends State<SetUp1> {
  final _nameController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;
  bool selected6 = false;
  bool selected7 = false;

  Future<void> getMeData() async {
    try {
      Response response = await get(
          Uri.parse(
            'https://api.famhive-dev.novahub.vn/${Url.meData}',
          ),
          headers: {
            'Authorization': 'Bearer ${Url.token}',
          });
      if (response.statusCode == 200) {
        var meData = response.body;
        print(meData);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> patchMeData() async {
    Response response = await patch(
        Uri.parse(
          'https://api.famhive-dev.novahub.vn/${Url.meData}',
        ),
        body: {
          'fullName': _nameController.text,
          'color': AppColors.representativeColor.toString(),
        },
        headers: {
          'Authorization': 'Bearer ${Url.token}',
        });
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getMeData();
  }

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
                      StepPage(activeStep: 0),
                      const TextContent(
                          text: 'YOUR PROFILE',
                          size: 16,
                          align: TextAlign.center),
                      PersonCard(
                        nameController: _nameController,
                        // representativeColor:
                        //     Representatives.representativeColor1,
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
                                  patchMeData();
                                  if (formkey.currentState!.validate()) {
                                    Navigator.pushNamed(context, '/setUp2');
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
