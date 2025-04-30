import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:peyman/widgets/profilePicture_widget.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';
import 'package:peyman/widgets/search_textfiled.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.controller,
  });

  final DashBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: Get.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Image.asset(
              Images.menuIcon,
              height: 30.h,
              width: 30.w,
            ),
          ),
          Text(
            'Hi, ',
            style: getAppBarTextStyle(context),
          ),
          Text(
            'Peyman',
            style: getAppBarTextStyle(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          CustomSearchTextfield(
              controller: controller.searchController, hintText: 'Search'),
          SizedBox(
            width: 20.w,
          ),
          Image.asset(
            Images.messageIcon,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 20.w,
          ),
          Image.asset(
            Images.bellIcon,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 20.w,
          ),
          const ProfilePictureWidget(),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
    );
  }
}
