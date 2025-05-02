import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: Get.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            navGradientStartColor,
            navGradientEndColor,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
        child: Expanded(
          child: Column(
            children: [
              Image.asset(
                Images.logoIcon,
                width: 50.w,
                height: 32.h,
              ),
              SizedBox(
                height: 232.h,
              ),
              // Spacer(),
              Expanded(
                child: Column(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        hoverColor: hoverColor,
                        borderRadius: BorderRadius.circular(14),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: hoverColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 26.h, horizontal: 30.w),
                              ),
                              Image.asset(
                                Images.homeIcon,
                                width: 22.w,
                                height: 22.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        hoverColor: hoverColor,
                        borderRadius: BorderRadius.circular(14),
                        child: Ink(
                          decoration: BoxDecoration(
                            // color: hoverColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 26.h, horizontal: 30.w),
                              ),
                              Image.asset(
                                Images.formsIcon,
                                width: 22.w,
                                height: 22.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Material(
                    //   color: Colors.transparent,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     hoverColor: hoverColor,
                    //     borderRadius: BorderRadius.circular(14),
                    //     child: Ink(
                    //       decoration: BoxDecoration(
                    //         // color: hoverColor,
                    //         borderRadius: BorderRadius.circular(14),
                    //       ),
                    //       child: Stack(
                    //         alignment: Alignment.center,
                    //         children: [
                    //           Padding(
                    //             padding: EdgeInsets.symmetric(
                    //                 vertical: 26.h, horizontal: 30.w),
                    //           ),
                    //           Image.asset(
                    //             Images.userIcon,
                    //             width: 22.w,
                    //             height: 22.h,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Material(
                    //   color: Colors.transparent,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     hoverColor: hoverColor,
                    //     borderRadius: BorderRadius.circular(14),
                    //     child: Ink(
                    //       decoration: BoxDecoration(
                    //         // color: hoverColor,
                    //         borderRadius: BorderRadius.circular(14),
                    //       ),
                    //       child: Stack(
                    //         alignment: Alignment.center,
                    //         children: [
                    //           Padding(
                    //             padding: EdgeInsets.symmetric(
                    //                 vertical: 26.h, horizontal: 30.w),
                    //           ),
                    //           Image.asset(
                    //             Images.settingsIcon,
                    //             width: 22.w,
                    //             height: 22.h,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  hoverColor: hoverColor,
                  borderRadius: BorderRadius.circular(14),
                  child: Ink(
                    decoration: BoxDecoration(
                      // color: hoverColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 26.h, horizontal: 30.w),
                        ),
                        Image.asset(
                          Images.helpIcon,
                          width: 22.w,
                          height: 22.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  hoverColor: hoverColor,
                  borderRadius: BorderRadius.circular(14),
                  child: Ink(
                    decoration: BoxDecoration(
                      // color: hoverColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 26.h, horizontal: 30.w),
                        ),
                        Image.asset(
                          Images.logoutIcon,
                          width: 22.w,
                          height: 22.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
