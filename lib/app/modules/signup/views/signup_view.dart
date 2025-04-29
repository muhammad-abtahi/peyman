import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/emiratesId_formatter.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/Utils/number_formatter.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/responsive/responsive_layout.dart';
import 'package:peyman/widgets/textfield.dart';
// import 'package:responsive_framework/responsive_framework.dart';

import '../controllers/signup_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    // final bool isMobile =
    //     ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

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
        top: 70.h,
        left: 80.w,
        right: 80.w,
        bottom: 52.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Info',
            style: getHeadingStyle(context),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Please enter your personal information e.g. name, address, date of birth, etc.',
            style: getInfoStyle(context),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextfield(
                  controller: controller.firstName,
                  hintText: "Enter Yout First Name",
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: CustomTextfield(
                  controller: controller.lastName,
                  hintText: "Enter Yout Last Name",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextfield(
            controller: controller.emailAddress,
            hintText: "Enter Email Address *",
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
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Ownership Verification Type',
            style: getSubHeadingStyle(context),
          ),
          SizedBox(
            height: 20.h,
          ),
          RadioButtons(controller: controller),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () =>
                controller.selectedId.value == controller.emiratesRadioId.value
                    ? CustomTextfield(
                        prefix: controller.emiratesIdSelecter(context),
                        controller: controller.emiratesId,
                        inputFormatters: [EmiratesIdFormatter()],
                        hintText: '1-1234567-1')
                    : CustomTextfield(
                        controller: controller.passportNo,
                        hintText: 'Enter Passport Number'),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextfield(
              controller: controller.date,
              suffix: GestureDetector(
                onTap: () {
                  controller.pickDate(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Image.asset(
                    Images.calendar,
                    width: 30,
                  ),
                ),
              ),
              readOnly: true,
              hintText: 'date of birth'),
          SizedBox(
            height: 20.h,
          ),
          CustomTextfield(
              controller: controller.residenceAddress,
              hintText: 'Resident Address'),
          CustomButton(label: 'Continue', onPressed: () {}),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Already have an account?  ",
                  style: getFontStyle(context),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Login",
                    style: getFontStyle(context).copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: primaryColor,
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

class RadioButtons extends StatelessWidget {
  const RadioButtons({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.selectedId.value = controller.emiratesRadioId.value;
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
        const Spacer(),
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.selectedId.value = controller.passportRadioId.value;
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
    );
  }
}
