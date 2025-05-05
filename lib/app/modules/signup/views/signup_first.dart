import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/Utils/number_formatter.dart';
import 'package:peyman/app/modules/signup/controllers/signup_controller.dart';
import 'package:peyman/app/routes/app_pages.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/signUp_header.dart';
import 'package:peyman/widgets/textfield.dart';

class SignUpFirst extends StatelessWidget {
  const SignUpFirst({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SignUpHeader(
          infoText:
              'Please enter your personal information e.g. name, address, date of birth, etc.',
          stageNumber: 1,
          label: 'Personal Info',
        ),
        SizedBox(
          height: 30.h,
        ),
        CustomTextfield(
          controller: controller.emailAddress,
          hintText: "Enter Email Addresss",
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            color: warningContainerColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Images.alert,
                width: 30.w,
                height: 30.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Text(
                  'Make sure this email matches the one registered with the Dubai Land Department (DLD). It will be used for verification and official communication.',
                  style: getWarningFontStyle(context),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Obx(
          () => CustomTextfield(
              prefix: controller.numberSelecter(context),
              controller: controller.phoneNumber,
              inputFormatters: [SimplePhoneFormatter()],
              hintText: '555 0000 555 0000'),
        ),
        CustomButton(
          label: 'Continue',
          onPressed: () {
            controller.currentSignUpStep = controller.signupStep2;
            controller.pageController.animateToPage(1,
                duration: const Duration(microseconds: 400),
                curve: Curves.linear);
            controller.update();
          },
        ),
        Spacer(),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Already having an account?  ",
                style: getFontStyle(context),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.login);
                },
                child: Text(
                  "SIGN IN",
                  style: getFontStyle(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
