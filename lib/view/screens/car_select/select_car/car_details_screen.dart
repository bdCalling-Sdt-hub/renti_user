import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_controller/car_details_controller.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_repo/car_details_repo.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/bottom_nav_section.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/cancel_show_dialogue.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/car_details_map_section.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/car_details_top_section.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/from_until_section.dart';

import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/text/custom_text.dart';
import 'inner_widgets/car_details_car_info_section.dart';
import 'inner_widgets/car_details_host_info_section.dart';

class CarDetailsScreen extends StatefulWidget {

 const CarDetailsScreen({super.key});
  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {

  late String carId;

  @override
  void initState() {

    carId = Get.arguments;

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(CarDetailsRepo(apiService: Get.find()));
    final controller = Get.put(CarDetailsController(carDetailsRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadCarDetailsData(carId);
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
            text: AppStrings.carDetails,
            color: AppColors.blackNormal,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            left: 14,
          )
        ],
      )),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => GetBuilder<CarDetailsController>(
          builder: (controller) {
            return controller.isLoading ? const Center(
              child: CircularProgressIndicator(),
            ) : const SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        CarDetailsTopSection(),
                        SizedBox(height: 24,),
                        FromUntilSection(),
                        CarDetailsCarInfoSection(),
                        CarDetailsHostInfoSection(),
                        CarDetailsMapSection(),
                      ],
                    )
                );
          }
        ),
      ),
      bottomNavigationBar: const BottomNavSection(),
    ));
  }
}
