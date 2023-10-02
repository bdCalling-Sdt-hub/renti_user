import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_model/rent_history_model.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';

class TopUploadSection extends StatefulWidget {
  const TopUploadSection({super.key, required this.rentHistoryModel});

  final UserWiseRent rentHistoryModel;
  @override
  State<TopUploadSection> createState() => _TopUploadSectionState();
}

class _TopUploadSectionState extends State<TopUploadSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Image.network(widget.rentHistoryModel.carId?.image?[0].toString()??"http://192.168.10.14:3001/public/uploads/image/1696067591683-download%20(1).jpg"),
          ),
          Container(
            padding: const EdgeInsets.only(left: 12,bottom: 12,top: 8),
            color: AppColors.whiteLight,
            child:  Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.rentHistoryModel.carId?.carModelName.toString()?? "carModelName",
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
                      text: widget.rentHistoryModel.carId?.averageRatings.toString()??"4.5",
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
                      text: widget.rentHistoryModel.carId?.totalRun.toString()?? "",
                      fontSize: 12,
                      color: AppColors.whiteDarkActive,
                      right: 8,
                      left: 6,
                    ),
                    CustomText(
                      text: '\$ ${widget.rentHistoryModel.carId?.hourlyRate.toString()?? " "}',
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
