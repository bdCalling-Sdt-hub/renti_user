import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class CarDetailsHostInfoSection extends StatefulWidget {
  const CarDetailsHostInfoSection({super.key});

  @override
  State<CarDetailsHostInfoSection> createState() => _CarDetailsHostInfoSectionState();
}

class _CarDetailsHostInfoSectionState extends State<CarDetailsHostInfoSection> {
  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.hostInformation,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: AppColors.blackNormal,
          top: 24,
          bottom: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.name,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteDarkActive,
              bottom: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Robert Fox',
                  color: AppColors.blackNormal,
                  bottom: 12,
                  right: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: CustomImage(imageSrc: AppIcons.starIcon,size: 12,),
                ),
                CustomText(
                  text: '(4.5)',
                  color: AppColors.blackNormal,
                  bottom: 12,
                  left: 8,
                ),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.contact,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteDarkActive,
              bottom: 12,
            ),
            CustomText(
              text: '0929 555 2726',
              color: AppColors.blackNormal,
              bottom: 12,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.email,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteDarkActive,
              bottom: 12,
            ),
            CustomText(
              text: 'bill.sanders@email.com',
              color: AppColors.blackNormal,
              bottom: 12,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.address,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteDarkActive,
              bottom: 24,
            ),
            CustomText(
              text:'''6391 Elgin St. Celina,
      Delaware 10299''',
              color: AppColors.blackNormal,
              bottom: 24,
            ),
          ],
        ),

      ],
    );
  }
}
