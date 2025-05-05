import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.backgroundColor,
      this.height = 58,
      this.backButton = false,
      this.disable = false,
      this.fontsize = 18,
      this.margin = const EdgeInsets.symmetric(vertical: 30),
      this.textColor});
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double fontsize;
  final bool backButton;
  final bool disable;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: backButton
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.backIcon,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    label,
                    style: getButtonTextStyle(context)
                        .copyWith(color: textColor ?? Colors.white),
                  ),
                ],
              )
            : Text(
                label,
                style: getButtonTextStyle(context)
                    .copyWith(color: textColor ?? Colors.white, fontSize: fontsize),
              ),
      ),
    );
  }
}
