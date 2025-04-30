import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class CustomSearchTextfield extends StatefulWidget {
  const CustomSearchTextfield(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String? hintText;

  @override
  State<CustomSearchTextfield> createState() => _CustomSearchTextfield();
}

class _CustomSearchTextfield extends State<CustomSearchTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.w,
      height: 40,
      child: TextField(
        cursorHeight: 16,
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: searchTextFieldFillColor,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 14.w, right: 8.w),
            child: Image.asset(
              Images.searchIcon,
              width: 14,
              height: 14,
            ),
          ),
          prefixIconConstraints:
              const BoxConstraints(minHeight: 14, minWidth: 14),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: searchTextFieldBorderColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: getHintTextStyle(context).copyWith(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
