import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class SteppersProgressWidget extends StatelessWidget {
  const SteppersProgressWidget({
    super.key,
    required this.stepTitles,
    required this.stepInfo,
    required this.activeStep,
    required this.totalSteps,
    required this.percentage,
  });

  final List stepTitles;
  final List stepInfo;
  final int activeStep;
  final int totalSteps;
  final num percentage;

  @override
  Widget build(BuildContext context) {
    final clampedPercentage = percentage.clamp(0.0, 100.0);

    final progressWidth = (clampedPercentage / 100) * 220.w;
    return Container(
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
                  TextSpan(text: '${activeStep + 1}'),
                  TextSpan(
                      text: '/$totalSteps', style: getTotalStepsStyle(context)),
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
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 8.h,
                        decoration: BoxDecoration(
                            color: primaryShade,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Container(
                        height: 8.h,
                        width: progressWidth,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '${clampedPercentage.toInt()}%',
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
                            Image.asset(
                              activeStep > index
                                  ? Images.currentStepper
                                  : activeStep == index
                                      ? Images.activeStepper
                                      : Images.remainingStepper,
                              width: 24.w,
                              height: 24.h,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            index == stepTitles.length - 1
                                ? const SizedBox.shrink()
                                : Expanded(
                                    child: SizedBox(
                                      width: 2,
                                      child: VerticalDashedLine(
                                        color: activeStep > index
                                            ? primaryColor
                                            : primaryShade,
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 6.h,
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
                                style: getStepperHeadingTextStyle(context),
                              ),
                              if (activeStep == index) ...[
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
                              ] else ...[
                                SizedBox(
                                  height: 40.h,
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
    this.dashHeight = 9,
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
    int index = 0;
    while (startY < size.height) {
      double currentDashHeight = dashHeight;

      // First dash
      if (index == 0) {
        currentDashHeight = dashHeight * 0.7; // or any smaller fraction
      }
      // Last dash (if it would exceed the height)
      else if (startY + dashHeight + dashSpacing > size.height) {
        currentDashHeight = dashHeight * 0.7;
      }

      final rect = Rect.fromLTWH(
        (size.width - strokeWidth) / 2,
        startY,
        strokeWidth,
        currentDashHeight,
      );

      final rrect = RRect.fromRectAndRadius(rect, Radius.circular(14));
      canvas.drawRRect(rrect, paint);

      startY += currentDashHeight + dashSpacing;
      index++;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
