import 'package:dotted_line/dotted_line.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:peyman/widgets/appBar_widget.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/navbar_widget.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class DashBoardView extends GetView<DashBoardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    int activeStep = 0;
    List stepTitles = [
      'Contract Details',
      'Mortgage Status',
      'Tenancy Information',
      'Property Financial Information',
    ];
    List stepInfo = [
      '',
      'Detailed attributes including type, size, location, ownership, amenities, zoning, structure, utilities, and market value.',
      '',
      '',
    ];
    return Scaffold(
      backgroundColor: dashboardScaffoldColor,
      body: Row(
        children: [
          const NavBarWidget(),
          Expanded(
            child: Column(
              children: [
                AppBarWidget(controller: controller),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 40.h, horizontal: 40.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome aboard,',
                            style: getDashBoardHeadingTextStyle(context),
                          ),
                          Text(
                            'What would you like to do today?',
                            style: getDashBoardSubHeadingTextStyle(context),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [primaryShade, Color(0xffF1E9FF)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      Images.dashboardImage,
                                      width: 230.w,
                                      height: 152.h,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Free POA Setup – This Month Only!',
                                        style:
                                            getDashBoardBannerHeadingTextStyle(
                                                context),
                                      ),
                                      const SizedBox(
                                        height: 9,
                                      ),
                                      Text(
                                        'Save time and skip the hassle. Let Contract Hubs handle deal registration for you — free of charge for a limited time.',
                                        style: getDashBoardBannerInfoTextStyle(
                                            context),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                SizedBox(
                                  width: 168,
                                  child: CustomButton(
                                    label: 'Get Started',
                                    backgroundColor: primaryShade,
                                    textColor: primaryColor,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 300.w,
            height: Get.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 20.2, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: getCompletedStepsStyle(context),
                      children: [
                        const TextSpan(text: '1'),
                        TextSpan(
                            text: '/4', style: getTotalStepsStyle(context)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Step',
                    style: getTotalStepsStyle(context).copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 8.h,
                            width: 220.w,
                            decoration: BoxDecoration(
                                color: primaryShade,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          Container(
                            height: 8.h,
                            width: 34.w,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(50)),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        '0%',
                        style: getFontStyle(context).copyWith(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: stepTitles.length,
                      itemBuilder: (context, index) {
                        String title = stepTitles[index];
                        String? info = stepInfo[index];

                        return IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.5),
                                    child: Image.asset(
                                      activeStep > index?
                                      Images.currentStepper:
                                       Images.activeStepper,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                  index == stepTitles.length - 1
                                      ? const SizedBox.shrink()
                                      : Expanded(
                                          child: SizedBox(
                                            width: 2,
                                            child: VerticalDashedLine(
                                              color: activeStep == index ||
                                                      activeStep > index
                                                  ? primaryColor
                                                  : primaryShade,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style:
                                          getStepperHeadingTextStyle(context),
                                    ),
                                    if (info == "") ...[
                                      SizedBox(
                                        height: 33.h,
                                      ),
                                    ] else ...[
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        info ?? "",
                                        style: getStepperInfoTextStyle(context),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                    ],
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
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

class VerticalDashedLine extends StatelessWidget {
  final double width;
  final Color color;
  final double dashHeight;
  final double dashSpacing;

  const VerticalDashedLine({
    super.key,
    this.width = 2,
    this.color = Colors.black,
    this.dashHeight = 6,
    this.dashSpacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _VerticalDashedLinePainter(
        color: color,
        strokeWidth: width,
        dashHeight: dashHeight,
        dashSpacing: dashSpacing,
      ),
    );
  }
}

class _VerticalDashedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashHeight;
  final double dashSpacing;

  _VerticalDashedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashHeight,
    required this.dashSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    double startY = 0;
    while (startY < size.height) {
      final rect = Rect.fromLTWH(
        (size.width - strokeWidth) / 2,
        startY,
        strokeWidth,
        dashHeight,
      );

      final rrect = RRect.fromRectAndRadius(rect, Radius.circular(14));
      canvas.drawRRect(rrect, paint);

      startY += dashHeight + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
