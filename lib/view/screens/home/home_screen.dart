import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_from_until_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_luxery_car_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_offer_car_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_top_section.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: CustomAppBar(
        appBarContent: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(

              child: const Icon(Icons.menu,
                  color: AppColors.blueNormal, size: 40),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {

                    Get.toNamed(AppRoute.searchScreen);

                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    border: Border.all(color: AppColors.whiteNormalActive),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.search,
                          size: 20, color: AppColors.whiteNormalActive),
                      CustomText(
                          text:AppStrings.searchCar,
                          color: AppColors.whiteNormalActive,
                          left: 8),
                    ],
                  ),
                ),
              ),
            ),
            const CustomImage(
                imageSrc: AppImages.profileImg,
                imageType: ImageType.png,
                size: 40),
          ],
        ),
           ),
      body: const SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTopSection(),
            SizedBox(height: 16),
            HomeFromUntilSection(),
            SizedBox(height: 24),
            HomeOfferCarSection(),
            HomeLuxuryCarSection()
          ],
        ),
      )

      ),
    ) ;
  }
}
