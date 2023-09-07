import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_list/luxury_cars/inner_widgets/luxury_car_details.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../offer_car/inner_widgets/search_filter.dart';

class LuxuryCarsScreen extends StatefulWidget {
  const LuxuryCarsScreen({super.key});
  @override
  State<LuxuryCarsScreen> createState() => _LuxuryCarsScreenState();
}
class _LuxuryCarsScreenState extends State<LuxuryCarsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar:  CustomAppBar(
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
                  text: AppStrings.luxuryCars,
                  color: AppColors.blackNormal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  left: 14,
                )
              ],
            )),
        body:  const Padding(
          padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
          child: Column(
            children: [
              SearchFilter(),
              SizedBox(height: 24),
              LuxuryCarDetails()
            ],
          ),
        ),
      ),
    );
  }
}