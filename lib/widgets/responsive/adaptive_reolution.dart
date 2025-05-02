import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdaptivePixels {
  AdaptivePixels._();

  static final double _designWidth = Get.width;
  static final double _designHeight = Get.height;

  static double w(double px) {
    return Get.width * (px / _designWidth);
  }

  static double h(double px) {
    return Get.height * (px / _designHeight);
  }

  static double r(double px) {
    double widthRatio = Get.width / _designWidth;
    double heightRatio = Get.height / _designHeight;

    return px * (widthRatio < heightRatio ? widthRatio : heightRatio);
  }

  static double sp(double px) {
    double ratio = r(px);

    const double minScale = 0.8;
    const double maxScale = 1.5;

    return px * (ratio.clamp(minScale, maxScale));
  }

  static double radius(double px) {
    return r(px);
  }

  static double fixed(double px) {
    return px;
  }

  static EdgeInsets padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: w(left ?? horizontal ?? all ?? 0),
      top: h(top ?? vertical ?? all ?? 0),
      right: w(right ?? horizontal ?? all ?? 0),
      bottom: h(bottom ?? vertical ?? all ?? 0),
    );
  }

  static EdgeInsets symmetric({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: w(horizontal),
      vertical: h(vertical),
    );
  }

  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: w(left),
      top: h(top),
      right: w(right),
      bottom: h(bottom),
    );
  }
}

extension AdaptivePixelExtensions on num {
  double get w => AdaptivePixels.w(toDouble());

  double get h => AdaptivePixels.h(toDouble());

  double get r => AdaptivePixels.r(toDouble());

  double get sp => AdaptivePixels.sp(toDouble());

  double get px => AdaptivePixels.fixed(toDouble());
}
