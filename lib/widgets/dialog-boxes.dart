import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';


 Future<dynamic> successDialogBox({required BuildContext context, required String headerText, required String infoText,
    required String buttonText, required GetxController controller, required void Function() onTap}) {
  return showDialog(
    barrierColor: dialogBoxBackgroundColor,
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: 680.w,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 22.h,
                ),
                Text(
                  "Successfully gathered the information!.",
                  style: getDialogBoxHeadingTextStyle(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: getDialogBoxInfoTextStyle(context),
                    children: [
                      const TextSpan(
                          text:
                              'We’ve gathered all the information from your '),
                      TextSpan(
                        text: '‘Title Deed’ \n',
                        style: getDialogBoxInfoTextStyle(context)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                          text:
                              'successfully, please proceed to the next step to verify your info.'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  width: 300.w,
                  child: CustomButton(
                    label: 'Continue',
                    margin: const EdgeInsets.all(0),
                    height: 54.h,
                    onPressed: onTap,
                    // () async {
                    //   Get.back();
                    // hangTightDialogBox(context);
                    // await Future.delayed(const Duration(milliseconds: 400));
                    // if (controller.activeStep.value + 1 <
                    //     controller.totalSellersSteps.value) {
                    //   controller.activeStep + 1;
                    // }
                    // controller.currentPage.value =
                    //     controller.currentContractASecondPage.value;

                    // controller.update();
                    // Get.back();
                    // },
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

