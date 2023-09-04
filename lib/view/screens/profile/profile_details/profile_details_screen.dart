import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/profile/profile_details/inner_widget/profile_details.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteLight,
      
      appBar: const CustomAppBar(
        appBarContent: CustomText(
          text: AppStrings.profile,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.blackNormal,
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 16),
                      margin: const EdgeInsets.only(bottom: 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: ShapeDecoration(
                        color: AppColors.blueNormal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              CustomImage(
                                imageSrc: AppImages.profileImg,
                                imageType: ImageType.png,
                                size: 50,
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: AppStrings.profileName,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteLight,
                                    left: 12,
                                  ),
                                  CustomText(
                                    text: AppStrings.profileNumber,
                                    color: AppColors.whiteLight,
                                    left: 12,
                                    top: 8,
                                  ),
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.profilesettingsScreen);
                              },
                              child: const CustomImage(
                                imageSrc: AppIcons.editProfileIcon,
                                imageType: ImageType.svg,
                                size: 18,
                              ))
                        ],
                      ),
                    ),
                    const ProfileDetails()
                  ],
                ),
              )),
    ));
  }
}
