import 'package:easy_stepper/easy_stepper.dart';
import 'package:famhive/components/text_content.dart';
import 'package:famhive/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StepPage extends StatelessWidget {
  StepPage({super.key, required this.activeStep});
  int activeStep;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      lineStyle: LineStyle(
        lineSpace: 0,
        lineLength: 130,
        lineType: LineType.normal,
        activeLineColor: AppColors.mainColor,
        defaultLineColor: const Color(0xffdbe0df),
        finishedLineColor: AppColors.mainColor,
        progress: 1,
        progressColor: const Color(0xffdbe0df),
      ),
      activeStepTextColor: AppColors.mainColor,
      finishedStepTextColor: AppColors.mainColor,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 6,
      showStepBorder: false,
      steps: [
        EasyStep(
          customStep: CircleAvatar(
            backgroundColor:
                activeStep >= 0 ? AppColors.mainColor : const Color(0xffccd3d1),
            child: CircleAvatar(
              backgroundColor: activeStep >= 0
                  ? AppColors.mainColor
                  : const Color(0xffccd3d1),
            ),
          ),
          customTitle: TextContent(
            text: 'STEP 1',
            top: 5,
            align: TextAlign.center,
            size: 12,
            weight: FontWeight.w400,
            color:
                activeStep >= 0 ? AppColors.mainColor : const Color(0xffccd3d1),
          ),
        ),
        EasyStep(
          customStep: CircleAvatar(
            backgroundColor:
                activeStep >= 1 ? AppColors.mainColor : const Color(0xffccd3d1),
            child: CircleAvatar(
              backgroundColor: activeStep >= 1
                  ? AppColors.mainColor
                  : const Color(0xffccd3d1),
            ),
          ),
          customTitle: TextContent(
            text: 'STEP 2',
            top: 5,
            align: TextAlign.center,
            size: 12,
            weight: FontWeight.w400,
            color:
                activeStep >= 1 ? AppColors.mainColor : const Color(0xffccd3d1),
          ),
        ),
        EasyStep(
          customStep: CircleAvatar(
            backgroundColor:
                activeStep >= 2 ? AppColors.mainColor : const Color(0xffccd3d1),
            child: CircleAvatar(
              backgroundColor: activeStep >= 2
                  ? AppColors.mainColor
                  : const Color(0xffccd3d1),
            ),
          ),
          customTitle: TextContent(
            text: 'STEP 3',
            top: 5,
            align: TextAlign.center,
            size: 12,
            weight: FontWeight.w400,
            color:
                activeStep >= 2 ? AppColors.mainColor : const Color(0xffccd3d1),
          ),
        ),
      ],
    );
  }
}
