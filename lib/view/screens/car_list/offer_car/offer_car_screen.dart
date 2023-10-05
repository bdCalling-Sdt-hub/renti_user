import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/car_list/offer_car/inner_widgets/offer_car_scetion.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_controller/offer_car_controller.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_repo/offer_car_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'inner_widgets/search_filter.dart';

class PopularCarScreen extends StatefulWidget {

  const PopularCarScreen({super.key});
  @override
  State<PopularCarScreen> createState() => _PopularCarScreenState();
}
class _PopularCarScreenState extends State<PopularCarScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(OfferCarRepo(apiService: Get.find()));
    final controller = Get.put(OfferCarController(offerCarRepo: Get.find()));

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
                  text: "Offer Cars",
                  color: AppColors.blackNormal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  left: 14,
                )
              ],
            )),
        body: GetBuilder<OfferCarController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
            child:controller.isLoading ?const Center(child: CircularProgressIndicator(),): Column(
              children: [
                const SearchFilter(),
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                      child: OfferCarSection()
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}