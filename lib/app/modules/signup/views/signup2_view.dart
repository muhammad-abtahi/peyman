import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/app/routes/app_pages.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/responsive/responsive_layout.dart';
import 'package:peyman/widgets/signUp_header.dart';

import '../controllers/signup_controller.dart';

class SignUpView2 extends GetView<SignUpController> {
  const SignUpView2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        dekstopWidget: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: Get.height,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: Get.height,
                  ),
                  child: SingleChildScrollView(
                    child: IntrinsicHeight(
                      child: _FormWidget(controller: controller),
                    ),
                  ),
                ),
              ),
            ),
            _imageContainer(context),
          ],
        ),
        mobileWidget: Expanded(
          child: SingleChildScrollView(
            child: _FormWidget(controller: controller),
          ),
        ),
      ),
    );
  }

  _imageContainer(BuildContext context) {
    return Expanded(
      child: Container(
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.signUpBackground),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20),
          child: Image.asset(
            Images.signUpText,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 90.h,
        left: 80.w,
        right: 80.w,
        // bottom: 52.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            height: 400.h,
            width: 550.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CustomButton(
                  label: 'back',
                  backgroundColor: primaryShade,
                  textColor: primaryColor,
                  onPressed: () {
                    Get.toNamed(Routes.signUp);
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
                        Get.toNamed(Routes.signUp3);
                      })),
            ],
          ),
        ],
      ),
    );
  }
}
