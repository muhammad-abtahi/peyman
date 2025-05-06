import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peyman/app/modules/dashboard/view/contractA/contract_a_second.dart';
import 'package:peyman/app/modules/dashboard/view/contractA/contract_a_start.dart';
import 'package:peyman/app/modules/dashboard/view/dashboard_landing_page_view.dart';

class DashBoardController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt activeStep = 0.obs;
  RxInt totalSellersSteps = 5.obs;

  RxBool isContractA = true.obs;
  RxBool isContractB = false.obs;
  RxBool isContractAffiliator = false.obs;

  RxInt currentLandingPage = 0.obs;
  RxInt currentContractAPage = 1.obs;
  RxInt currentContractASecondPage = 2.obs;
  RxInt currentPage = 2.obs;
  late final List<Widget> pageOption = [
    DashboardLandingPage(
      controller: this,
      key: const ValueKey('Home'),
    ),
    ContractAView(
      controller: this,
      key: const ValueKey('ContractA'),
    ),
    ContractASecondPage(
      controller: this,
      key: const ValueKey('ContractSecond'),
    ),
  ];

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
}
