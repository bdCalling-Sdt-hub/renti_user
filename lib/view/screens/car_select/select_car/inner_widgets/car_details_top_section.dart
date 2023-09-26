import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class CarDetailsTopSection extends StatefulWidget {
  const CarDetailsTopSection({super.key});

  @override
  State<CarDetailsTopSection> createState() => _CarDetailsTopSectionState();
}

class _CarDetailsTopSectionState extends State<CarDetailsTopSection> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 44,horizontal: 44),
              color: AppColors.whiteDArkHover,

              width: MediaQuery.of(context).size.width,
              child: const CustomImage(imageSrc: AppImages.carImage,imageType: ImageType.png,)
          ),
          Container(
            padding: const EdgeInsets.only(left: 12,bottom: 12,top: 8),
            color: AppColors.whiteLight,
            child:   const Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Toyota Harrier',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlueColor,
                      right: 8,
                      bottom: 8,
                    ),
                    CustomImage(
                      imageSrc: AppIcons.starIcon,
                      size: 12,),
                    CustomText(
                      text: '(4.5)',
                      fontSize: 10,
                      color: AppColors.blackNormal,
                      bottom: 8,
                      left: 8,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImage(imageSrc: AppIcons.lucidFuel,size: 12,),
                    CustomText(
                      text: '10 km/L',
                      fontSize: 12,
                      color: AppColors.whiteDarkActive,
                      right: 8,
                      left: 6,
                    ),
                    CustomText(
                      text: '\$25/hour',
                      fontSize: 12,
                      color: AppColors.whiteDarkActive,
                      left: 8,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
