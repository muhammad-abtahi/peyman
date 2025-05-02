import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:peyman/widgets/appBar_widget.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/navbar_widget.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class DashboardHomeView extends StatelessWidget {
  const DashboardHomeView({
    super.key,
    required this.controller,
  });

  final DashBoardController
   controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NavBarWidget(),
        Expanded(
          child: Column(
            children: [
              AppBarWidget(controller: controller),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 40.h, horizontal: 40.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome aboard,',
                          style: getDashBoardHeadingTextStyle(context),
                        ),
                        Text(
                          'What would you like to do today?',
                          style: getDashBoardSubHeadingTextStyle(context),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [primaryShade, Color(0xffF1E9FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    Images.dashboardImage,
                                    width: 230.w,
                                    height: 152.h,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Free POA Setup – This Month Only!',
                                      style:
                                          getDashBoardBannerHeadingTextStyle(
                                              context),
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    Text(
                                      'Save time and skip the hassle. Let Contract Hubs handle deal registration for you — free of charge for a limited time.',
                                      style: getDashBoardBannerInfoTextStyle(
                                          context),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              SizedBox(
                                width: 168,
                                child: CustomButton(
                                  label: 'Get Started',
                                  backgroundColor: primaryShade,
                                  textColor: primaryColor,
                                  onPressed: () {
                                    // showSuccessDialogWithAnimation(context);
                                    if (controller.activeStep.value + 1 <
                                        controller.totalSellersSteps.value) {
                                      controller.activeStep + 1;
                                      controller.update();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        
      ],
    );
  }
}