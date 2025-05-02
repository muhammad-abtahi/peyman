import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';

import 'package:peyman/app/modules/dashboard/controller/dashboard_controller.dart';

class DashBoardView extends GetView<DashBoardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dashboardScaffoldColor,
      body: GetBuilder<DashBoardController>(
        builder: (controller) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: controller.pageOption[controller.currentContractAPage.value],
        ),
      ),

    );
  }
}





