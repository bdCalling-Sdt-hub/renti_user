import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rent_history/inner_widgets/rent_history_section.dart';
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            const SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          physics: BouncingScrollPhysics(),
          child: RentHistorySection(),
        ),
      ),
    ));
  }
}
