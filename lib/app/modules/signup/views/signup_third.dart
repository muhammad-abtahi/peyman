import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/app/routes/app_pages.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/signUp_header.dart';

import '../controllers/signup_controller.dart';

class SignUpThird extends StatelessWidget {
  const SignUpThird({required this.controller, super.key});

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignUpHeader(
          infoText:
              'Keep your head steady so we can take your picture and match it with the records.',
          stageNumber: 3,
          label: 'Facial Recognition',
        ),
        const Expanded(
          child: SizedBox(
              // height: 30.h,
              ),
        ),
        Image.asset(
          Images.facialImage,
          width: 550.w,
          height: 404.h,
          // fit: BoxFit.fill,
        ),
        const Expanded(
          child: SizedBox(
              // height: 30.h,
              ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          // textBaseline: TextBaseline.alphabetic,
          children: [
            Obx(
              () => Align(
                alignment: Alignment.topCenter,
                child: Checkbox(
                  activeColor: primaryColor,
                  checkColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  value: controller.permissionToStoreImage.value,
                  onChanged: (value) {
                    controller.permissionToStoreImage.value = value!;
                  },
                ),
              ),
            ),
            Expanded(
              child: Text(
                'By uploading your Emirates ID, you agree to its secure storage for verification and transaction purposes.',
                style: getFontStyle(context),
              ),
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        Obx(
          () => CustomButton(
            label: 'Sign Up',
            disable: controller.permissionToStoreImage.value,
            backgroundColor: controller.permissionToStoreImage.value
                ? primaryColor
                : buttonDisableColor,
            onPressed: () {
              controller.permissionToStoreImage.value
                  ? roleSelectDialogBox(context)
                  : null;
            },
          ),
        ),
      ],
    );
  }

  Future<dynamic> roleSelectDialogBox(BuildContext context) {
    return showDialog(
      barrierColor: dialogBoxBackgroundColor,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: SizedBox(
            width: 680.w,
            // height: 602.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      Images.signUpDialogImage,
                      width: 103.w,
                      height: 103.h,
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Text(
                    "You’ve successfully setup your account, Please continue as:",
                    style: getDialogBoxHeadingTextStyle(context),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.selectedRadioId.value =
                                controller.sellerRadioId.value;
                            controller.update();
                          },
                          child: Container(
                            height: 60.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 19.5.h),
                            decoration: BoxDecoration(
                                color: signUpRadioColor,
                                borderRadius: BorderRadius.circular(14)),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: getSignUpRadioStyle(context),
                                    children: [
                                      TextSpan(
                                        text: 'Seller ',
                                        style: getSignUpRadioStyle(context)
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const TextSpan(text: 'of the property'),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  controller.selectedRadioId.value ==
                                          controller.sellerRadioId.value
                                      ? Images.radioSelected
                                      : Images.radioUnselected,
                                  width: 18,
                                  height: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.selectedRadioId.value =
                                controller.buyerRadioId.value;
                            controller.update();
                          },
                          child: Container(
                            height: 60.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 19.5.h),
                            decoration: BoxDecoration(
                                color: signUpRadioColor,
                                borderRadius: BorderRadius.circular(14)),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: getSignUpRadioStyle(context),
                                    children: [
                                      TextSpan(
                                        text: 'Buyer ',
                                        style: getSignUpRadioStyle(context)
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const TextSpan(text: 'of the property'),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  controller.selectedRadioId.value ==
                                          controller.buyerRadioId.value
                                      ? Images.radioSelected
                                      : Images.radioUnselected,
                                  width: 18,
                                  height: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.selectedRadioId.value =
                                controller.affiliatorRadioId.value;
                            controller.update();
                          },
                          child: Container(
                            height: 60.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 19.5.h),
                            decoration: BoxDecoration(
                                color: signUpRadioColor,
                                borderRadius: BorderRadius.circular(14)),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: getSignUpRadioStyle(context),
                                    children: [
                                      TextSpan(
                                        text: 'Affiliator ',
                                        style: getSignUpRadioStyle(context)
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const TextSpan(text: 'of the property'),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  controller.selectedRadioId.value ==
                                          controller.affiliatorRadioId.value
                                      ? Images.radioSelected
                                      : Images.radioUnselected,
                                  width: 18,
                                  height: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  SizedBox(
                    width: 300.w,
                    child: CustomButton(
                      height: 54,
                      label: 'Continue',
                      onPressed: () {
                        Get.toNamed(Routes.dashboard);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
