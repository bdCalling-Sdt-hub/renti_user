import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 18, top: 8, bottom: 10),
          margin: const EdgeInsets.only(bottom: 8),
          width: MediaQuery.of(context).size.width,
          decoration: ShapeDecoration(
            color: AppColors.whiteLight,
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
          child:  const Row(
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
                    text: AppStrings.profileEmail,
                    color: AppColors.blackNormal,
                    left: 14,
                    top: 8,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 18, top: 8, bottom: 10),
          margin: const EdgeInsets.only(bottom: 8),
          width: MediaQuery.of(context).size.width,
          decoration: ShapeDecoration(
            color: AppColors.whiteLight,
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
          child: const Row(
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
                    text: AppStrings.birthdayDate,
                    color: AppColors.blackNormal,
                    left: 14,
                    top: 8,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 18, top: 8, bottom: 10),
          margin: const EdgeInsets.only(bottom: 8),
          width: MediaQuery.of(context).size.width,
          decoration: ShapeDecoration(
            color: AppColors.whiteLight,
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
          child: const Row(
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
                    text: AppStrings.profileNumber,
                    color: AppColors.blackNormal,
                    left: 14,
                    top: 8,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 18, top: 8, bottom: 10),
          margin: const EdgeInsets.only(bottom: 8),
          width: MediaQuery.of(context).size.width,
          decoration: ShapeDecoration(
            color: AppColors.whiteLight,
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
          child: const Row(
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
          ),
        ),
      ],
    );
  }
}
