import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';

import '../../../../../core/route/app_route.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class ProfileTopSection extends StatelessWidget {

  const ProfileTopSection({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ProfileDetailsController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
            Row(
              children: [
                Container(
                  height: 50, width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: controller.profileImage.isEmpty ? const DecorationImage(
                        image: AssetImage("assets/images/user.png"),
                        fit: BoxFit.fill
                    ) : DecorationImage(
                      image: NetworkImage(controller.profileImage),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: controller.username,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteLight,
                      left: 12,
                    ),
                    CustomText(
                      text: controller.phoneNumber,
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
      ),
    );
  }
}
