import 'package:flutter/material.dart';
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
  final String? stageNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          // width: 475.w,
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
            ],
          ),
        ),
        if(stageNumber != null)...[

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$stageNumber/3',
              style: getHeadingStyle(context).copyWith(color: primaryColor),
            ),
          ],
        ),
        SizedBox(
          width: 25.w,
        ),
        ],
      ],
    );
  }
}
