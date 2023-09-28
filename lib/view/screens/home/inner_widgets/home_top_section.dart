import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/text/custom_text.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomImage(imageSrc: AppImages.bannerHome,
          imageType: ImageType.png,),
        const SizedBox(height: 24,),
        const CustomText(
          text: AppStrings.searchNearCar,
          fontSize:14,
          fontWeight: FontWeight.w500 ,
        ),
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
                child: CustomTextField(
                  isPrefixIcon: true  ,
                  hintText: AppStrings.searchCar,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.whiteNormalActive,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIconSrc: AppIcons.location,
                  fillColor: AppColors.whiteLight,
                )

            ),
            const SizedBox(width: 12),
            Container(
                padding: const EdgeInsetsDirectional.all(12),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightBlueColor
                ),
                child: SvgPicture.asset(AppIcons.locationHome)
            )
          ],
        )
      ],
    );
  }
}
