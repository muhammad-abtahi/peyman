import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveTextStyle on TextStyle {
  TextStyle responsive(BuildContext context) {
    double scaleFactor = 1.0;

    if (ResponsiveBreakpoints.of(context).largerThan(DESKTOP)) {
      scaleFactor = 1.2;
    } else if (ResponsiveBreakpoints.of(context).largerThan(TABLET)) {
      scaleFactor = 1.1;
    } else if (ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)) {
      scaleFactor = 0.9;
    }

    return copyWith(fontSize: (fontSize ?? 16) * scaleFactor);
  }
}

TextStyle getHeadingStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}

TextStyle getSubHeadingStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}

TextStyle getFontStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontSize: 16,
  ).responsive(context);
}

TextStyle getWarningFontStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: warningTextColor,
    height: 1.5,
    fontSize: 16,
  ).responsive(context);
}

TextStyle getInfoStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: infoColor,
    fontSize: 18,
    height: 1.5,
  ).responsive(context);
}

TextStyle getHintTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: hintTextColor,
    fontSize: 17,
  ).responsive(context);
}

TextStyle getAppBarTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: appBarTextColor,
    fontSize: 24,
  ).responsive(context);
}

TextStyle getDashBoardHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}

TextStyle getDashBoardBannerHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: primaryColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}

TextStyle getDashBoardBannerInfoTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: primaryColor,
    fontSize: 16,
  ).responsive(context);
}

TextStyle getDashBoardSubHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontSize: 22,
  ).responsive(context);
}

TextStyle getButtonTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}
