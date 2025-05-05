import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/emiratesId_formatter.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/app/modules/login/controller/login_controller.dart';
import 'package:peyman/app/routes/app_pages.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/responsive/responsive_layout.dart';
import 'package:peyman/widgets/signUp_header.dart';
import 'package:peyman/widgets/textfield.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        dekstopWidget: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: _FormWidget(controller: controller),
            ),
            _imageContainer(context),
          ],
        ),
        mobileWidget: Expanded(
          child: _FormWidget(controller: controller),
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
            height: 158.h,
            width: 417.w,
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

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      padding: EdgeInsets.only(
        top: 75.h,
        left: 80.w,
        right: 80.w,
        bottom: 32.h,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SignUpHeader(
            infoText:
                'Ready to create your contract? Let’s get started by filling in the details for your seller contract.',
            label: 'Login',
          ),
          SizedBox(
            height: 10.h,
          ),
          RadioButtons(controller: controller),
          SizedBox(
            height: 9.h,
          ),
          Obx(
            () {
              if (controller.selectedId.value ==
                  controller.emiratesRadioId.value) {
                return CustomTextfield(
                    prefix: controller.emiratesIdSelecter(context),
                    controller: controller.emiratesId,
                    inputFormatters: [EmiratesIdFormatter()],
                    hintText: '1-1234567-1');
              } else if (controller.selectedId.value ==
                  controller.dateOfBirthRadioId.value) {
                return GestureDetector(
                  onTap: () {
                    controller.pickDate(context);
                  },
                  child: CustomTextfield(
                      controller: controller.date,
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Image.asset(
                          Images.calendar,
                          width: 30,
                        ),
                      ),
                      hintText: 'date of birth'),
                );
              } else {
                return CustomTextfield(
                    controller: controller.passportNo,
                    hintText: 'Enter Passport Number');
              }
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomButton(
            label: 'Login',
            onPressed: () {
              Get.toNamed(Routes.dashboard);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          const DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.5,
            dashLength: 5.0,
            dashColor: dottedLineColor,
            dashRadius: 3.0,
            dashGapLength: 6.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
          SizedBox(
            height: 40.h,
          ),
          GestureDetector(
            onTap: () {},
            child: const FingerPrintLogin(),
          ),
          Spacer(),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Don’t have an account yet?  ",
                  style: getFontStyle(context),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.signUp);
                  },
                  child: Text(
                    "Sign Up",
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
      ),
    );
  }
}

class FingerPrintLogin extends StatelessWidget {
  const FingerPrintLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.thumbIcon,
              width: 35,
              height: 40,
            ),
            SizedBox(width: 20.w),
            Text(
              'Login with UAE Pass',
              style: getButtonTextStyle(context).copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioButtons extends StatelessWidget {
  const RadioButtons({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Get.width >= 1440
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.selectedId.value =
                          controller.emiratesRadioId.value;
                      controller.update();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          controller.selectedId.value ==
                                  controller.emiratesRadioId.value
                              ? Images.radioSelected
                              : Images.radioUnselected,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Emirates ID',
                          style: getFontStyle(context),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.selectedId.value =
                          controller.dateOfBirthRadioId.value;
                      controller.update();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          controller.selectedId.value ==
                                  controller.dateOfBirthRadioId.value
                              ? Images.radioSelected
                              : Images.radioUnselected,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Date of Birth',
                          style: getFontStyle(context),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.selectedId.value =
                          controller.passportRadioId.value;
                      controller.update();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          controller.selectedId.value ==
                                  controller.passportRadioId.value
                              ? Images.radioSelected
                              : Images.radioUnselected,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Passport Number',
                          style: getFontStyle(context),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          : Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.selectedId.value =
                          controller.emiratesRadioId.value;
                      controller.update();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          controller.selectedId.value ==
                                  controller.emiratesRadioId.value
                              ? Images.radioSelected
                              : Images.radioUnselected,
                          width: 17,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Emirates ID',
                          style: getFontStyle(context),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.selectedId.value =
                          controller.dateOfBirthRadioId.value;
                      controller.update();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          controller.selectedId.value ==
                                  controller.dateOfBirthRadioId.value
                              ? Images.radioSelected
                              : Images.radioUnselected,
                          width: 17,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Date of Birth',
                          style: getFontStyle(context),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.selectedId.value =
                          controller.passportRadioId.value;
                      controller.update();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          controller.selectedId.value ==
                                  controller.passportRadioId.value
                              ? Images.radioSelected
                              : Images.radioUnselected,
                          width: 17,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Passport Number',
                          style: getFontStyle(context),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
