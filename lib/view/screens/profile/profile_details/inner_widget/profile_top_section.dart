import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/route/app_route.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class ProfileTopSection extends StatefulWidget {
  const ProfileTopSection({super.key});

  @override
  State<ProfileTopSection> createState() => _ProfileTopSectionState();
}

class _ProfileTopSectionState extends State<ProfileTopSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 17, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
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
                Get.toNamed(AppRoute.profileSettingsScreen);
              },
              child: const CustomImage(
                imageSrc: AppIcons.editProfileIcon,
                imageType: ImageType.svg,
                size: 18,
              ))
        ],
      ),
    );
  }
}
