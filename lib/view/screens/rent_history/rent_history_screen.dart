import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rent_history/inner_widgets/rent_history_section.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/text/custom_text.dart';

class RentHistoryScreen extends StatefulWidget {

  const RentHistoryScreen({super.key});

  @override
  State<RentHistoryScreen> createState() => _RentHistoryScreenState();
}

class _RentHistoryScreenState extends State<RentHistoryScreen> {
  @override
  void initState() {

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(RentHistoryRepo(apiService: Get.find()));
    final controller = Get.put(RentHistoryController(rentHistoryRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
      backgroundColor: AppColors.whiteLight,
      appBar: CustomAppBar(
        appBarContent: Row(
        children: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: AppColors.blackNormal,
              )),
          const CustomText(
            text: AppStrings.rentiHistory,
            color: AppColors.blackNormal,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            left: 14,
          )
        ],
      )),
      body: GetBuilder<RentHistoryController>(
        builder: (controller) => controller .isLoading ? const Center(
          child: CircularProgressIndicator(),
        ) : LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => const SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            physics: BouncingScrollPhysics(),
            child: RentHistorySection(),
          ),
        )
      ),
    ));
  }
}
