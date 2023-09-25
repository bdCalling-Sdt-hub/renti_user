import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_list/offer_car/inner_widgets/search_car_scetion.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'inner_widgets/search_filter.dart';
class OfferCarScreen extends StatefulWidget {
  const OfferCarScreen({super.key});
  @override
  State<OfferCarScreen> createState() => _OfferCarScreenState();
}
class _OfferCarScreenState extends State<OfferCarScreen> {
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
                     40, (index) =>const OfferCarSection()
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
}