import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/car_list/popular_car/inner_widgets/search_car_scetion.dart';

import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_model/home_popular_model.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'inner_widgets/search_filter.dart';
class PopularCarScreen extends StatefulWidget {
  const PopularCarScreen({super.key});
  @override
  State<PopularCarScreen> createState() => _PopularCarScreenState();
}
class _PopularCarScreenState extends State<PopularCarScreen> {
  PopularCarModel popularCarModel = Get.arguments;
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
                  text: "Popular Cars",
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
                 child: PopularCarSection()
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}