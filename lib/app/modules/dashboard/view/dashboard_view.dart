import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';

import 'package:peyman/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:peyman/widgets/appBar_widget.dart';
import 'package:peyman/widgets/navBar_widget.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/steppers_progress_widget.dart';

class DashBoardView extends GetView<DashBoardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dashboardScaffoldColor,
      body: Row(
        children: [
          const NavBarWidget(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(controller: controller),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 35.h, horizontal: 30.w),
                    child: GetBuilder<DashBoardController>(
                      builder: (controller) => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Container(
                          key: ValueKey<int>(controller.currentPage.value),
                          padding: EdgeInsets.only(
                              bottom: 24.h, top: 40.h, left: 40.w, right: 40.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: double.infinity,
                          child: controller
                              .pageOption[controller.currentPage.value],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () {
              if (controller.isContractA.value) {
                return SteppersProgressWidget(
                  stepTitles: controller.sellerStepperTitles,
                  stepInfo: controller.sellerSteperInfo,
                  activeStep: controller.activeStep.value,
                  totalSteps: controller.sellerStepperTitles.length,
                  percentage: (controller.activeStep.value /
                          controller.sellerStepperTitles.length) *
                      100,
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
