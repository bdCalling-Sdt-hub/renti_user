import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class KycBodySection extends StatefulWidget {
  const KycBodySection({super.key});

  @override
  State<KycBodySection> createState() => _KycBodySectionState();
}

class _KycBodySectionState extends State<KycBodySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Image Upload Section
        Container(

          decoration: BoxDecoration(
            color: AppColors.lightBlueColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DottedBorder(
            strokeWidth: 1,
            dashPattern: const [10, 10],
            color: AppColors.lightBlueColorActive,
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            padding: const EdgeInsets.all(2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  const CustomImage(
                    imageSrc:AppIcons.kycVector ,
                    imageType: ImageType.svg,
                    size: 50,
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    onPressed: () {},
                    titleText: AppStrings.upload,
                    buttonWidth: double.maxFinite,
                    buttonHeight: 48,
                  )
                ],
              ),
            ),
          ),
        ),

        //Upload Image Type Text..
        const CustomText(
          text: AppStrings.uploadDL,
          color: AppColors.whiteDarkActive,
          top: 16,
          textAlign: TextAlign.start,
        ),
        const CustomText(
          text: AppStrings.uploadINE,
          color: AppColors.whiteDarkActive,
          textAlign: TextAlign.start,
        ),
        //RFC Text and TextField
        const CustomText(
          text: AppStrings.inePassword,
          top: 16,
          bottom: 12,
          textAlign: TextAlign.start,
        ),
        CustomTextField(
          textInputAction: TextInputAction.done,
          hintText: AppStrings.enterIne,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteNormalActive),
        ),
      ],
    );
  }
}
