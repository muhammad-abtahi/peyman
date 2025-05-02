import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.backgroundColor,
      this.textColor});
  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.h),
      width: double.infinity,
      height: 58.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          label,
          style: getButtonTextStyle(context)
              .copyWith(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
