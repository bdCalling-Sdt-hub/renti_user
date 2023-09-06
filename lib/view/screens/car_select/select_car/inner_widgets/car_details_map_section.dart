import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/image/custom_image.dart';

class CarDetailsMapSection extends StatefulWidget {
  const CarDetailsMapSection({super.key});

  @override
  State<CarDetailsMapSection> createState() => _CarDetailsMapSectionState();
}

class _CarDetailsMapSectionState extends State<CarDetailsMapSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: AppColors.whiteLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),

      ),
      child: const CustomImage(
        imageSrc: AppImages.mapLocationCar,
        imageType: ImageType.png,

      ),
    );
  }
}
