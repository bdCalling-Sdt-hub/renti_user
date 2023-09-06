import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/select_country.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';



class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}


class _CustomDrawerState extends State<CustomDrawer> {
  bool changeColor = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 230,
      backgroundColor: AppColors.whiteLight,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Drawer Top Section
            const SizedBox(height: 30),
            const CustomImage(imageSrc: AppImages.profileImg, imageType: ImageType.png, size: 50),
            const CustomText(text: "Jane Cooper", fontSize: 16, fontWeight: FontWeight.w500,top: 8),
            const CustomText(text: "(480) 555-0103", fontSize: 12, color: AppColors.whiteDarkHover,top: 8,bottom: 8),
            const Divider(color: AppColors.blackLightHover,thickness: 1),

            //Add cars Section
            GestureDetector(
              // onTap: () => Get.toNamed(AppRoute.userListScreen),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.history,size: 18,),
                    CustomText(text: AppStrings.rentHistory,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            GestureDetector(
              // onTap: () => Get.toNamed(AppRoute.userListScreen),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.paymentIcon,size: 18,),
                    CustomText(text: AppStrings.paymentMethod,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            GestureDetector(
              // onTap: () => Get.toNamed(AppRoute.userListScreen),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.howRentiWorks,size: 18,),
                    CustomText(text: AppStrings.howRentiWorks,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            GestureDetector(
              // onTap: () => Get.toNamed(AppRoute.userListScreen),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.support,size: 18,),
                    CustomText(text: AppStrings.support,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            GestureDetector(
              // onTap: () => Get.toNamed(AppRoute.userListScreen),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.aboutUsIcon,size: 18,),
                    CustomText(text: AppStrings.aboutUs,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            GestureDetector(
              // onTap: () => Get.toNamed(AppRoute.userListScreen),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.settingsIcon,size: 18,),
                    CustomText(text: AppStrings.settings,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            const Divider(color: AppColors.blackLightHover,thickness: 1),
            GestureDetector(
              // onTap: () => Get.toNamed(AppRoute.settingScreen),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectCountry())),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Row(
                  children: [
                    CustomImage(
                      imageSrc: AppIcons.logOutIcon,size: 18,),
                    CustomText(text: AppStrings.logOut,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}