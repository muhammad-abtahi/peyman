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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SignUpHeader(
          infoText:
              'Keep your head steady so we can take your picture and match it with the records.',
          stageNumber: 3,
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
        CustomButton(
          label: 'Sign Up',
          onPressed: () {
            Get.toNamed(Routes.login);
          },
        ),
      ],
    );
  }
}
