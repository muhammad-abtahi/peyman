import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
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

TextStyle getCompletedStepsStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontSize: 50,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}

TextStyle getTotalStepsStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: totalSteperColor,
    fontSize: 50,
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

TextStyle getSignUpRadioStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: primaryColor,
    fontSize: 19,
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

TextStyle getStepperHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ).responsive(context);
}

TextStyle getStepperInfoTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: stepperInfoColor,
    height: 1.5,
    fontSize: 14,
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
    fontWeight: FontWeight.w500,
  ).responsive(context);
}

TextStyle getDashBoardTileHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: primaryColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}

TextStyle getDashBoardTileInfoTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: dashboardTilesInfoTextColor,
    fontSize: 14,
  ).responsive(context);
}

TextStyle getDialogBoxHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}

TextStyle getDialogBoxInfoTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: dialogBoxInfoColor,
    height: 1.5,
    fontSize: 18,
  ).responsive(context);
}

TextStyle getDashBoardBannerHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}

TextStyle getDashBoardBannerInfoTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.white,
    height: 1.5,
    fontSize: 16,
  ).responsive(context);
}

TextStyle getContractAWarningBannerTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: contractAWarningBannerTextColor,
    height: 1.5,
    fontSize: 16,
  ).responsive(context);
}

TextStyle getDashBoardSubHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontSize: 22,
  ).responsive(context);
}

TextStyle getContractAOtherOwnerHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  ).responsive(context);
}

TextStyle getContractAOtherOwnerSubHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  ).responsive(context);
}

TextStyle getKycVerifiedTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: kycVerifiedTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  ).responsive(context);
}

TextStyle getKycNotVerifiedTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: kycNotVerifiedTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  ).responsive(context);
}

TextStyle getKycNotVerifiedInfoTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: kycNotVerfiedTextInfoColor,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ).responsive(context);
}

TextStyle getContractASellerContainerHeadingTexStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: contractASellerContainerTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ).responsive(context);
}

TextStyle getContractASellerContainerInfoTexStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: contractASellerContainerInfoTextColor,
    fontSize: 14,
  ).responsive(context);
}

TextStyle getDocumentContainerHeadingTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
          color: documentContainerTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold)
      .responsive(context);
}

TextStyle getDocumentContainerInfoTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
          color: documentContainerTextColor, fontSize: 16, height: 1.5)
      .responsive(context);
}

TextStyle getButtonTextStyle(BuildContext context) {
  return GoogleFonts.archivo(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ).responsive(context);
}
