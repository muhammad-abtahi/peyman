import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/responsive/responsive_layout.dart';
import 'package:peyman/widgets/signUp_header.dart';

import '../controllers/signup_controller.dart';

class SignUpView3 extends GetView<SignUpController> {
  const SignUpView3({super.key});
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
            child: IntrinsicHeight(
              child: _FormWidget(controller: controller),
            ),
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
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpHeader(
            infoText:
                'Keep your head steady so we can take your picture and match it with the records.',
            stageNumber: "3",
            label: 'Facial Recognition',
          ),
          SizedBox(
            height: 30.h,
          ),
          Image.asset(
            Images.facialImage,
            height: 400.h,
            width: 550.w,
            // fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Checkbox(
                      activeColor: primaryColor,
                      checkColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      value: controller.permissionToStoreImage.value,
                      onChanged: (value) {
                        controller.permissionToStoreImage.value = value!;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Text(
                  'By uploading your Emirates ID, you consent to us securely storing this information for verification and future use related to your transaction.',
                  style: getFontStyle(context),
                ),
              ),
            ],
          ),
          CustomButton(label: 'Sign Up', onPressed: () {}),
        ],
      ),
    );
  }
}
