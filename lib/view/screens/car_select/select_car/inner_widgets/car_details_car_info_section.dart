import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/text/custom_text.dart';

class CarDetailsCarInfoSection extends StatefulWidget {
  const CarDetailsCarInfoSection({super.key});

  @override
  State<CarDetailsCarInfoSection> createState() => _CarDetailsCarInfoSectionState();
}

class _CarDetailsCarInfoSectionState extends State<CarDetailsCarInfoSection> {
  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.carInformation,
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
              text: AppStrings.totalMileage,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteDarkActive,
              bottom: 12,
            ),
            CustomText(
              text: '360000 km',
              color: AppColors.blackNormal,
              bottom: 12,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteDarkActive,
              bottom: 12,
            ),
            CustomText(
              text: 'Black',
              color: AppColors.blackNormal,
              bottom: 12,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.capacity,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteDarkActive,
              bottom: 12,
            ),
            CustomText(
              text: '5 Person',
              color: AppColors.blackNormal,
              bottom: 12,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.gearType,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteDarkActive,
              bottom: 12,
            ),
            CustomText(
              text: 'Mannual',
              color: AppColors.blackNormal,
              bottom: 12,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.fuelTankCapacity,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteDarkActive,
            ),
            CustomText(
              text: '70 L',
              color: AppColors.blackNormal,
            ),
          ],
        ),
      ],
    );
  }
}
