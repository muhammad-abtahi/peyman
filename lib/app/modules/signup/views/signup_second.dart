import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/signUp_header.dart';

import '../controllers/signup_controller.dart';

class SignUpSecond extends StatelessWidget {
  const SignUpSecond({required this.controller, super.key});

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SignUpHeader(
          infoText:
              'Please scan your documents such as emirates ID, passport etc.',
          stageNumber: "2",
          label: 'Identity Verification',
        ),
        SizedBox(
          height: 30.h,
        ),
        Image.asset(
          Images.verificationImage,
          height: 404.h,
          width: 550.w,
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomButton(
                label: 'Back',
                backgroundColor: primaryShade,
                textColor: primaryColor,
                onPressed: () {
                  controller.currentSignUpStep = controller.signupStep1;
                  controller.pageController.animateToPage(0,
                      duration: const Duration(microseconds: 400),
                      curve: Curves.linear);
                  controller.update();
                },
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: CustomButton(
                label: 'Continue',
                onPressed: () {
                  controller.currentSignUpStep = controller.signupStep3;
                  controller.pageController.animateToPage(2,
                      duration: const Duration(microseconds: 400),
                      curve: Curves.linear);
                  controller.update();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
