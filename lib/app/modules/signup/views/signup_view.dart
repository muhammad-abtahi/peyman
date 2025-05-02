import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/responsive/responsive_layout.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/signup_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        dekstopWidget: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: _FormWidget(controller: controller),
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

  Widget buildPage() {
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
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 61.w),
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

  Widget buildPage1() {
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
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 61.w),
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

  Widget buildPage2() {
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
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 61.w),
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

  Widget buildPage3() {
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
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 61.w),
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

  _imageContainer(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Expanded(
            child: PageView(
              controller: controller.pageController,
              children: [
                buildPage(),
                buildPage1(),
                buildPage2(),
                buildPage3(),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            height: Get.height,
            padding: EdgeInsets.only(bottom: 100.h, right: 61.w),
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: 4,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 18.w,
                  height: 9.h,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(37),
                ),
                dotDecoration: DotDecoration(
                  width: 9.w,
                  height: 9.h,
                  color: Colors.transparent,
                  dotBorder: DotBorder(
                    padding: 1,
                    width: 1.w,
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  verticalOffset: 0,
                ),
                spacing: 4.w,
              ),
            ),
          ),
        ],
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
        top: 75.h,
        left: 80.w,
        right: 80.w,
        bottom: 32.h,
      ),
      child: GetBuilder<SignUpController>(
        builder: (controller) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: controller.pageOption[controller.currentSignUpStep.value],
        ),
      ),
    );
  }
}
