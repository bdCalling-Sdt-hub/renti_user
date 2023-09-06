import 'package:flutter/material.dart';
import 'package:renti_user/view/widgets/container/custom_container_card.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomContainerCard(
            pleft: 16,
            ptop: 8,
            pbottom: 10,
            bottom: 8,
            radius: 8,
            color: AppColors.whiteLight,
            cardContent:  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(

                  imageSrc: AppIcons.emailIcon,
                  imageType: ImageType.svg,
                  size: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.email,
                      fontSize: 12,
                      color: AppColors.whiteDark,
                      left: 14,
                    ),
                    CustomText(
                      text: 'jane.c@gmail.com',
                      color: AppColors.blackNormal,
                      left: 14,
                      top: 8,
                    )
                  ],
                )
              ],
            )
        ),
        CustomContainerCard(
            pleft: 16,
            ptop: 8,
            pbottom: 10,
            bottom: 8,
            radius: 8,
            color: AppColors.whiteLight,
            cardContent:  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(

                  imageSrc: AppIcons.birthdayIcon,
                  imageType: ImageType.svg,
                  size: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.dateOfBirth,
                      fontSize: 12,
                      color: AppColors.whiteDark,
                      left: 14,
                    ),
                    CustomText(
                      text: '8-01-1999',
                      color: AppColors.blackNormal,
                      left: 14,
                      top: 8,
                    )
                  ],
                )
              ],
            )
        ),
        CustomContainerCard(
            pleft: 16,
            ptop: 8,
            pbottom: 10,
            bottom: 8,
            radius: 8,
            color: AppColors.whiteLight,
            cardContent:  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(

                  imageSrc: AppIcons.phoneIcon,
                  imageType: ImageType.svg,
                  size: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.phoneNumber,
                      fontSize: 12,
                      color: AppColors.whiteDark,
                      left: 14,
                    ),
                    CustomText(
                      text: '(+52) 555-0103',
                      color: AppColors.blackNormal,
                      left: 14,
                      top: 8,
                    )
                  ],
                )
              ],
            )
        ),
        CustomContainerCard(
            pleft: 16,
            ptop: 8,
            pbottom: 10,
            bottom: 8,
            radius: 8,
            color: AppColors.whiteLight,
            cardContent:  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(

                  imageSrc: AppIcons.location,
                  imageType: ImageType.svg,
                  size: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.address,
                      fontSize: 12,
                      color: AppColors.whiteDark,
                      left: 14,
                    ),
                    CustomText(
                      text: AppStrings.addressplace,
                      color: AppColors.blackNormal,
                      left: 14,
                      top: 8,
                    )
                  ],
                )
              ],
            )
        ),

      ],
    );
  }
}
