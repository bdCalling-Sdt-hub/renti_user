import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/car_list/all_cars/all_car_controller/all_car_controller.dart';
import 'package:renti_user/view/screens/car_list/all_cars/all_car_model/all_car_model.dart';
import 'package:renti_user/view/screens/car_list/all_cars/all_car_repo/all_car_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../offer_car/inner_widgets/search_filter.dart';
import 'inner_widgets/all_car_details.dart';

class AllCarsScreen extends StatefulWidget {
  const AllCarsScreen({super.key});
  @override
  State<AllCarsScreen> createState() => _AllCarsScreenState();
}
class _AllCarsScreenState extends State<AllCarsScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(AllCarRepo(apiService: Get.find()));
    Get.put(AllCarController(allCarRepo: Get.find()));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllCarController>(
      builder: (controller) {
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
            body:   Padding(
              padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
              child: Column(
                children: [
                  SearchFilter(),
                  SizedBox(height: 24),
                  AllCarDetails(allCarModel: AllCarModel(),)
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}