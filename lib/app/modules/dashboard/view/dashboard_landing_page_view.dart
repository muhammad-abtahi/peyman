import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

// class DashboardHomeView extends StatelessWidget {
//   const DashboardHomeView({
//     super.key,
//     required this.controller,
//   });

//   final DashBoardController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const NavBarWidget(),
//         Expanded(
//           child: Column(
//             children: [
//               AppBarWidget(controller: controller),
//               Expanded(
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 35.h, horizontal: 30.w),
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     width: double.infinity,
//                     child: DashboardLandingPage(controller: controller),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

class DashboardLandingPage extends StatelessWidget {
  const DashboardLandingPage({
    super.key,
    required this.controller,
  });

  final DashBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(Images.dashboardBannerContainer),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            height: 250.h,
            width: double.infinity,
            padding: EdgeInsets.only(
                top: 40.h, bottom: 40.h, left: 31.w, right: 31.w),
            child: Row(
              children: [
                SizedBox(
                  width: 660.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to Contract Hubs',
                        style: getDashBoardBannerHeadingTextStyle(context),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Save time and skip the hassle. Let Contract Hubs handle deal registration for you, free of charge for a limited time.',
                        style: getDashBoardBannerInfoTextStyle(context),
                      ),
                      SizedBox(
                        width: 168,
                        child: CustomButton(
                          margin: const EdgeInsets.only(top: 20),
                          label: 'Get Started',
                          backgroundColor: Colors.white,
                          fontsize: 15.5,
                          height: 55,
                          textColor: primaryColor,
                          onPressed: () {
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
                Image.asset(
                  Images.dashboardImage,
                  width: 209.w,
                  height: 190.h,
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(
                // height: 30.h,
                ),
          ),
          const Divider(
            color: dottedLineColor,
            height: .05,
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Center(
            child: Text(
              'Which contract type would you like to proceed with?',
              style: getDashBoardHeadingTextStyle(context),
            ),
          ),
          const Expanded(
            child: SizedBox(
                // height: 30.h,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 304.h,
                  // width: 389.w,
                  decoration: BoxDecoration(
                    color: dashboardTilesColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Image.asset(
                        Images.dashboardTileSellPurchaseImage,
                        width: 162.w,
                        height: 162.h,
                        fit: BoxFit.contain,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sell/Purchase',
                                  style:
                                      getDashBoardTileHeadingTextStyle(context),
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  'Easily submit Contract A along with all required selling docs.',
                                  style: getDashBoardTileInfoTextStyle(context),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Image.asset(
                            Images.dashboardTileButton,
                            width: 50.w,
                            height: 50.h,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Container(
                  height: 304.h,
                  // width: 389.w,
                  decoration: BoxDecoration(
                    color: dashboardTilesColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Image.asset(
                        Images.dashboardTileBuyImage,
                        width: 162.w,
                        height: 162.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Buy',
                                  style:
                                      getDashBoardTileHeadingTextStyle(context),
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  'Please submit all docs related to the property purchase and Contract B.',
                                  style: getDashBoardTileInfoTextStyle(context),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.currentPage.value =
                                  controller.currentContractAPage.value;
                              controller.isContractA.value = true;
                              controller.update();
                            },
                            child: Image.asset(
                              Images.dashboardTileButton,
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Container(
                  height: 304.h,
                  // width: 389.w,
                  decoration: BoxDecoration(
                    color: dashboardTilesColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Image.asset(
                        Images.dashboardTileTenancyImage,
                        width: 162.w,
                        height: 162.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tenancy',
                                  style:
                                      getDashBoardTileHeadingTextStyle(context),
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  'Easily manage your tenancy and Ejari all in one platform.',
                                  style: getDashBoardTileInfoTextStyle(context),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Image.asset(
                            Images.dashboardTileButton,
                            width: 50.w,
                            height: 50.h,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}
