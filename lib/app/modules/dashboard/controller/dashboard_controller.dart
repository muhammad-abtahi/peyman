import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/app/modules/dashboard/view/contract_a_view.dart';
import 'package:peyman/app/modules/dashboard/view/dashboard_landing_page_view.dart';

class DashBoardController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt activeStep = 0.obs;
  RxInt totalSellersSteps = 5.obs;
  RxInt currentLandingPage = 0.obs;
  RxInt currentContractAPage = 1.obs;
  RxInt currentPage = 0.obs;

  List sellerStepperTitles = [
    'Upload Title Deed',
    'Owner Information',
    'Mortgage Status',
    'Tenancy Information',
    'Property Financial Information',
  ];
  List sellerSteperInfo = [
    'Provide essential certificate information, descriptions, and necessary supporting documents for verification and approval.',
    'Provide essential certificate information, descriptions, and necessary supporting documents for verification and approval.',
    'Provide essential certificate information, descriptions, and necessary supporting documents for verification and approval.',
    'Provide essential certificate information, descriptions, and necessary supporting documents for verification and approval.',
    'Provide essential certificate information, descriptions, and necessary supporting documents for verification and approval.',
  ];

  late final List<Widget> pageOption = [
    DashboardLandingPage(controller: this),
    ContractAView(controller: this),
  ];
}
