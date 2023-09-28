import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/car_list/offer_car/inner_widgets/search_car_scetion.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_controller/offer_controller.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_model/offer_model.dart';
import 'package:renti_user/view/screens/search/search_repo/search_repo.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_controller/offer_car_controller.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_model/offer_car_model.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_repo/offer_car_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import '../../../../service/api_service.dart';
import '../../../../service/api_service.dart';
import '../../../../utils/device_utils.dart';
import 'inner_widgets/search_filter.dart';
import 'offer_repo/offer_repo.dart';
class OfferCarScreen extends StatefulWidget {
  const OfferCarScreen({super.key});
  @override
  State<OfferCarScreen> createState() => _OfferCarScreenState();
}
class _OfferCarScreenState extends State<OfferCarScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(OfferCarRepo(apiService: Get.find()));
    Get.put(OfferCarController(offerCarRepo: Get.find()));
    super.initState();

  }
  @override
  void initState() {
    DeviceUtils.authUtils();

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(OfferRepo(apiService: Get.find()));
    Get.put(OfferCarController(offerRepo: Get.find()));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferCarController>(
      builder: (controller) {
        return Scaffold(
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
                    text: AppStrings.offerCars,
                    color: AppColors.blackNormal,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    left: 14,
                  )
                ],
              )),
          body:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
            child: Column(
              children: [
                const SearchFilter(),
                const SizedBox(height: 24),
               Expanded(
                 child: SingleChildScrollView(
                   child: Column(
                     children:  List.generate(
                       40, (index) => OfferCarSection(offerCarModel: OfferCarModel())
                     )
                   ),
                 ),
               )
              ],
            ),
          ),
        );
      }
    return GetBuilder<OfferCarController>(
      builder: (controller) {
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
                      text: AppStrings.offerCars,
                      color: AppColors.blackNormal,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      left: 14,
                    )
                  ],
                )),
            body:  Padding(
              padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
              child: Column(
                children: [
                  const SearchFilter(),
                  const SizedBox(height: 24),
                 Expanded(
                   child: SingleChildScrollView(
                     child: Column(
                       children:  List.generate(
                         40, (index) => OfferCarSection(offerModel: OfferModel(),)
                       )
                     ),
                   ),
                 )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}