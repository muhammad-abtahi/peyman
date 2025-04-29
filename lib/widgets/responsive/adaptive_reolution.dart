import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A utility class that automatically adapts pixel values to any screen size
class AdaptivePixels {
  // Private constructor to prevent instantiation
  AdaptivePixels._();

  /// Reference dimensions that match your design (default iPhone 12)
  static const double _designWidth = 1440.0;
  static const double _designHeight = 900.0;

  /// Use this for width-based measurements (horizontal spacing, widths)
  static double w(double px) {
    return Get.width * (px / _designWidth);
  }

  /// Use this for height-based measurements (vertical spacing, heights)
  static double h(double px) {
    return Get.height * (px / _designHeight);
  }

  /// Use this for square measurements or when you want the smaller ratio
  /// Good for font sizes, padding, or anything that should be proportional
  /// but not too large on tablets/desktops
  static double r(double px) {
    double widthRatio = Get.width / _designWidth;
    double heightRatio = Get.height / _designHeight;

    // Use the smaller ratio to avoid overly large values on tablets/desktops
    return px * (widthRatio < heightRatio ? widthRatio : heightRatio);
  }

  /// Use this for font sizes specifically, with min/max constraints
  /// to prevent text from becoming too small or too large
  static double sp(double px) {
    double ratio = r(px);

    // Apply min/max constraints to keep font sizes reasonable
    const double minScale = 0.8; // Text won't be smaller than 80% of design
    const double maxScale = 1.5; // Text won't be larger than 150% of design

    return px * (ratio.clamp(minScale, maxScale));
  }

  /// Use this for radius measurements (border radius, circles)
  static double radius(double px) {
    return r(px);
  }

  /// Use this for fixed values that should not scale with screen size
  static double fixed(double px) {
    return px;
  }

  /// Convenience method for creating EdgeInsets with adaptive values
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

  /// Convenience method for creating symmetric EdgeInsets
  static EdgeInsets symmetric({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: w(horizontal),
      vertical: h(vertical),
    );
  }

  /// Convenience method for creating only EdgeInsets
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

/// Extension on num for easier syntax
extension AdaptivePixelExtensions on num {
  /// Width adaptive pixels
  double get w => AdaptivePixels.w(toDouble());

  /// Height adaptive pixels
  double get h => AdaptivePixels.h(toDouble());

  /// Responsive pixels (uses smaller ratio)
  double get r => AdaptivePixels.r(toDouble());

  /// Font size pixels (with constraints)
  double get sp => AdaptivePixels.sp(toDouble());

  /// Fixed pixels (no scaling)
  double get px => AdaptivePixels.fixed(toDouble());
}
