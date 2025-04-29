import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/textfield.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../controllers/signup_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isMobile =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isMobile) ...[
                  Expanded(
                      child: SingleChildScrollView(
                          child: _FormWidget(controller: controller))),
                ] else ...[
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
                ]
              ],
            ),
          ],
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
      padding: const EdgeInsets.symmetric(vertical: 31.0, horizontal: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Info',
            style: getHeadingStyle(context),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Please enter your personal information e.g. name, address, date of birth, etc.',
            style: getInfoStyle(context),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextfield(
                  controller: controller.firstName,
                  hintText: "Enter Yout First Name",
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: CustomTextfield(
                  controller: controller.lastName,
                  hintText: "Enter Yout Last Name",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextfield(
            controller: controller.emailAddress,
            hintText: "Enter Email Address *",
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => CustomTextfield(
                prefix: controller.numberSelecter(context),
                controller: controller.phoneNumber,
                hintText: '555 0000 555 0000'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Ownership Verification Type',
            style: getSubHeadingStyle(context),
          ),
          const SizedBox(
            height: 20,
          ),
          RadioButtons(controller: controller),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => CustomTextfield(
                prefix: controller.emiratesIdSelecter(context),
                controller: controller.emiratesId,
                hintText: '1-1234567-1'),
          ),
          const SizedBox(
            height: 20,
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
              hintText: 'date of birth'),
          const SizedBox(
            height: 20,
          ),
          CustomTextfield(
              controller: controller.phoneNumber, hintText: 'Resident Address'),
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
