import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/car_list/all_cars/inner_widgets/all_car_details.dart';
import 'package:renti_user/view/screens/car_list/popular_car/inner_widgets/search_filter.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_model/all_cars_model.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class AllCarScreen extends StatefulWidget {
  const AllCarScreen({super.key});
  @override
  State<AllCarScreen> createState() => _AllCarScreenState();
}
class _AllCarScreenState extends State<AllCarScreen> {

  @override
  Widget build(BuildContext context) {

    AllCarsModel allCarsModel = Get.arguments;
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
                  text: "All Cars",
                  color: AppColors.blackNormal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  left: 14,
                )
              ],
            )),
        body:    Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
          child: Column(
            children: [
              const SearchFilter(),
              const SizedBox(height: 24),
              // IconButton(onPressed: (){
              //
              //   print(allCarsModel.cars![0].carModelName);
              // }, icon: Icon(Icons.add))
              AllCarDetaills(allCarsModel: allCarsModel)
            ],
          ),
        ),
      ),
    );
  }
}