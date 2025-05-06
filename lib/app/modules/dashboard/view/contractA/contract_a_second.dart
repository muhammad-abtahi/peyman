import 'package:flutter/material.dart';
import 'package:peyman/Utils/app_colors.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/Utils/images.dart';
import 'package:peyman/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class ContractASecondPage extends StatelessWidget {
  const ContractASecondPage({required this.controller, super.key});
  final DashBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: contractAWarningBannerBorderColor),
                  color: contractAWarningBannerColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      Images.warningIcon,
                      width: 35.w,
                      height: 35.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: getContractAWarningBannerTextStyle(context),
                          children: [
                            TextSpan(
                              text: 'This property has multiple owners.',
                              style: getContractAWarningBannerTextStyle(context)
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            const TextSpan(
                                text:
                                    'Your KYC is approved, but others haven’t completed theirs. Please share the link with them to complete their KYC.')
                          ],
                        ),
                      ),

                      //  Text(
                      //   'This property has multiple owners. Your KYC is approved, but others haven’t completed theirs. Please share the link with them to complete their KYC.',
                      //   style: getContractAWarningBannerTextStyle(context),
                      // ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: contractASellerContainerBorderColor),
                  color: contractASellerContainerColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        Images.profileImage,
                        height: 140.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Muhammad Al-Aserai',
                            style: getContractASellerContainerHeadingTexStyle(
                                context),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          // Expanded(child: SizedBox()),

                          Text(
                            'Villa 12, Al Barsha 2, Dubai, United Arab Emirates',
                            style: getContractASellerContainerInfoTexStyle(
                                context),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Emirate ID',
                                    style:
                                        getContractASellerContainerHeadingTexStyle(
                                                context)
                                            .copyWith(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    '784-1987-1234567-1',
                                    style:
                                        getContractASellerContainerInfoTexStyle(
                                            context),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nationality',
                                    style:
                                        getContractASellerContainerHeadingTexStyle(
                                                context)
                                            .copyWith(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    'United Arab Emirates',
                                    style:
                                        getContractASellerContainerInfoTexStyle(
                                            context),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'DOB',
                                    style:
                                        getContractASellerContainerHeadingTexStyle(
                                                context)
                                            .copyWith(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    '12 March 1987',
                                    style:
                                        getContractASellerContainerInfoTexStyle(
                                            context),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100.w,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                // height: Get.height,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: contractAOtherOwnerContainerBorderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Other Owner',
                      style: getContractAOtherOwnerHeadingTextStyle(context),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const OwnerCardWidget(
                      image: Images.zaImage,
                      isVerified: true,
                      name: 'Zafir al-Aserai',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Not Verified',
                      style: getContractAOtherOwnerSubHeadingTextStyle(context),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Wrap(
                      runSpacing: 10.h,
                      spacing: 14.w,
                      children: const [
                        OwnerCardWidget(
                          image: Images.maImage,
                          isVerified: false,
                          name: 'Malik al-Aserai',
                        ),
                        OwnerCardWidget(
                          image: Images.maImage,
                          isVerified: false,
                          name: 'Turab al-Aserai',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 21.h),
            // height: 100.h,
            decoration: const BoxDecoration(color: backgroundColor),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  width: 94.w,
                  height: 44.h,
                  child: Row(
                    children: [
                      Image.asset(
                        Images.formsBackIcon,
                        height: 24.h,
                        width: 24.w,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Back',
                        style: getButtonTextStyle(context).copyWith(
                            color: contractASellerContainerInfoTextColor),
                      )
                    ],
                  ),
                ),
                // Expanded(
                //   child: Divider(
                //     color: Colors.black,
                //   ),
                // ),
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: 139.w,
                  child: CustomButton(
                    label: 'Continue',
                    onPressed: () {},
                    margin: const EdgeInsets.all(0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OwnerCardWidget extends StatelessWidget {
  const OwnerCardWidget({
    super.key,
    required this.isVerified,
    required this.image,
    required this.name,
  });
  final bool isVerified;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 427.w,
      // height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: contractAOtherOwnerContainerBorderColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image,
                height: 60.h,
                width: 60.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: getContractAOtherOwnerSubHeadingTextStyle(context),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isVerified) ...[
                        Image.asset(
                          Images.kycVerifiedIcon,
                          width: 17.w,
                          height: 17.h,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'KYC Verified',
                          style: getKycVerifiedTextStyle(context),
                        ),
                      ] else ...[
                        Image.asset(
                          Images.kycNotVerifiedIcon,
                          width: 17.w,
                          height: 17.h,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'KYC Not Verified',
                          style: getKycNotVerifiedTextStyle(context),
                        ),
                      ],
                    ],
                  ),
                ],
              )
            ],
          ),
          if (!isVerified) ...[
            SizedBox(
              height: 5.h,
            ),
            const Divider(
              color: contractAOtherOwnerContainerBorderColor,
              height: 0.25,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'To complete the verification process, copy the provided KYC link and share it via WhatsApp or email to get the consent.',
              style: getKycNotVerifiedInfoTextStyle(context),
            ),
          ],
        ],
      ),
    );
  }
}
