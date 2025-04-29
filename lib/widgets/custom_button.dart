import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed});
  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          'Continue',
          style: getButtonTextStyle(context),
        ),
      ),
    );
  }
}
