import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    required this.label,
    required this.infoText,
    this.stageNumber,
    super.key,
  });

  final String label;
  final String infoText;
  final int? stageNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 45.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: getHeadingStyle(context),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  infoText,
                  style: getInfoStyle(context),
                ),
                if (stageNumber != null) ...[
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle,
                          color:
                              stageNumber! >= 1 ? primaryColor : primaryShade),
                      Expanded(
                        child: Container(
                          color:
                              stageNumber! >= 1 ? primaryColor : primaryShade,
                          height: 2.5.h,
                          // width: lineWidth,
                        ),
                      ),
                      Icon(Icons.circle,
                          color:
                              stageNumber! >= 2 ? primaryColor : primaryShade),
                      Expanded(
                        child: Container(
                          color:
                              stageNumber! >= 2 ? primaryColor : primaryShade,
                          height: 2.5.h,
                          // width: lineWidth,
                        ),
                      ),
                      Icon(Icons.circle,
                          color:
                              stageNumber! >= 3 ? primaryColor : primaryShade),
                      Expanded(
                        child: Container(
                          color:
                              stageNumber! >= 3 ? primaryColor : primaryShade,
                          height: 2.5.h,
                          // width: lineWidth,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ],
            ),
          ),
        ),
        if (stageNumber != null) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$stageNumber/3',
                style: getHeadingStyle(context).copyWith(color: primaryColor),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
