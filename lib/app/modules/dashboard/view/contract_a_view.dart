import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class ContractAView extends StatelessWidget {
  const ContractAView({
    super.key,
    required this.controller,
  });

  final DashBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload your Title Deed to continue',
          style: getDashBoardHeadingTextStyle(context),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Container(
          height: 108.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: contractAiBannerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.contractAiBannerIcon,
                  width: 38.w,
                  height: 36.h,
                ),
                SizedBox(
                  width: 11.w,
                ),
                Expanded(
                  child: Text(
                    'Let AI handle the details for you. Upload your property’s title deed and let our smart AI and OCR technology extract the relevant information automatically.',
                    style: getDashBoardBannerInfoTextStyle(context),
                  ),
                )
              ],
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        DottedBorder(
          radius: const Radius.circular(20),
          borderPadding: const EdgeInsets.all(0),
          dashPattern: const [2, 3],
          strokeCap: StrokeCap.round,
          strokeWidth: 2,
          color: documentContainerBorderColor,
          borderType: BorderType.RRect,
          child: Container(
            height: 240.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: documentContainerColor),
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 192.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Images.documentUploadIcon,
                  width: 70.w,
                  height: 70.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                RichText(
                  text: TextSpan(
                    style: getDocumentContainerHeadingTextStyle(context),
                    children: [
                      const TextSpan(text: 'Drag & Drop or '),
                      TextSpan(
                        text: 'Choose file',
                        style: getDocumentContainerHeadingTextStyle(context)
                            .copyWith(
                                color: primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            successDialogBox(context);
                          },
                      ),
                      const TextSpan(text: ' to upload'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    style: getDocumentContainerInfoTextStyle(context),
                    children: [
                      const TextSpan(
                        text:
                            'Please upload a clear digital copy of your property’s title deed.If you don’t have it, you can download it from the ',
                      ),
                      TextSpan(
                        text: 'Dubai Rest App.',
                        style: getDocumentContainerInfoTextStyle(context)
                            .copyWith(
                                color: primaryColor,
                                decorationColor: primaryColor,
                                decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            Images.videoImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 222.h,
          ),
        ),
      ],
    );
  }

  Future<dynamic> successDialogBox(BuildContext context) {
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
                      onPressed: () {
                        
                        hangTightDialogBox(context);
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

  Future<dynamic> hangTightDialogBox(BuildContext context) {
    return showDialog(
                        barrierColor: dialogBoxBackgroundColor,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.white,
                            child: SizedBox(
                              width: 680.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 40.h, horizontal: 30.w),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 22.h,
                                    ),
                                    Text(
                                      "Hang Tight!",
                                      style: getDialogBoxHeadingTextStyle(
                                          context),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'We\'\ re securely auto-filling the form with details from your Title Deed. This will only take a few seconds...',
                                      textAlign: TextAlign.center,
                                      style:
                                          getDialogBoxInfoTextStyle(context),
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
                                        onPressed: () {},
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
