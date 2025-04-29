import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key, required this.dekstopWidget, required this.mobileWidget});
  final Widget mobileWidget;
    final Widget dekstopWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        if (screenWidth < 600) {
          return mobileWidget;
        } else {
          return dekstopWidget;
        }
      },
    );
  }
}
