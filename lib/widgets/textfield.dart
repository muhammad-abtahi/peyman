import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefix,
      this.suffix});
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffix;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 18,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldBorderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
        suffixIconConstraints: BoxConstraints(maxHeight: 35, maxWidth: 35),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        hintText: hintText,
        hintStyle: getHintTextStyle(context),
      ),
    );
  }
}
