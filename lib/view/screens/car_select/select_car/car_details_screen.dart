import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/bottom_nav_section.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/cancel_show_dialogue.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/car_details_map_section.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/car_details_top_section.dart';
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
        builder: (BuildContext context, BoxConstraints constraints) =>
             SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                child: Column(

                  children: [
                    const CarDetailsTopSection(),
                    const CarDetailsCarInfoSection(),
                    const CarDetailsHostInfoSection(),
                    const CarDetailsMapSection(),
                    const SizedBox(height: 16,),
                    CustomElevatedButton(
                      titleSize: 14,
                      buttonWidth: MediaQuery.of(context).size.width,
                      buttonColor: AppColors.lightBlueColor,
                      titleColor: AppColors.primaryColor,

                      onPressed: (){
                         // waiting for approval button

                      },
                         titleText: AppStrings.waitApprovalTitle),
                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (context){
                          return CancelShowDialogue();
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsetsDirectional.symmetric(vertical: 16),
                        padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
                        child: CustomText(text: AppStrings.cancelRequest,fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.primaryColor,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1,color: AppColors.primaryColor)
                        ),
                      ),
                    )
                  ],
                )),
      ),
          bottomNavigationBar: const BottomNavSection(),
    ));
  }
}
