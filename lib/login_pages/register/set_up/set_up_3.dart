import 'package:famhive/components/body_page.dart';
import 'package:famhive/components/button.dart';
import 'package:famhive/components/step.dart';
import 'package:famhive/components/text_content.dart';
import 'package:famhive/components/top_bar_setup.dart';
import 'package:flutter/material.dart';
import 'package:famhive/constants.dart';
import 'package:famhive/components/person_card.dart';

bool isVisibleTopBar = false;
bool isVisibleAdd = true;

class SetUp3 extends StatefulWidget {
  const SetUp3({super.key});

  @override
  State<SetUp3> createState() => _SetUp3State();
}

class _SetUp3State extends State<SetUp3> {
  final _formkey = GlobalKey<FormState>();
  List<Map<String, dynamic>> kidsList = [
    {'name': '', 'color': ''}
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Body(
        content: Form(
          key: _formkey,
          child: Column(
            children: [
              const TopBarSetUp(text: 'SET UP YOUR BOARD'),
              SizedBox(
                height: height * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StepPage(activeStep: 2),
                    const TextContent(
                        text: 'YOUR KID(s)\'s PROFILE',
                        size: 16,
                        align: TextAlign.center),
                    //*listView
                    Expanded(
                      child: ListView.builder(
                        itemCount: kidsList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Visibility(
                                visible: isVisibleTopBar,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.colorTitleKidCard),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextContent(
                                        text: 'KID ${index + 1}',
                                        size: 16,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      //remove
                                      GestureDetector(
                                        onTap: () {
                                          kidsList.removeAt(index);
                                          setState(() {
                                            if (kidsList.length < 2) {
                                              isVisibleTopBar = false;
                                            } else {
                                              isVisibleTopBar = true;
                                            }
                                          });
                                        },
                                        child: const Icon(
                                            Icons.delete_forever_outlined),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const PersonCard(),
                              Visibility(
                                visible: isVisibleAdd,
                                child: GestureDetector(
                                  onTap: () {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        kidsList.add({
                                          'title': 'KID ${kidsList.length - 1}',
                                          'name': '',
                                          'color': ''
                                        });
                                        if (index == kidsList.length) {
                                          isVisibleAdd = false;
                                        }
                                        if (kidsList.length < 2) {
                                          isVisibleTopBar = false;
                                        } else {
                                          isVisibleTopBar = true;
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.person_add_alt,
                                          color: AppColors.mainColor,
                                        ),
                                        SizedBox(width: 10),
                                        TextContent(
                                          text: 'Add more kid',
                                          size: 16,
                                          color: AppColors.mainColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
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
                              text: 'Finish',
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  // finish
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
    );
  }
}
