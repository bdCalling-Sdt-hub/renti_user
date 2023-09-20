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
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Upload Driving License",
              bottom: 12,
              textAlign: TextAlign.start,
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 115, width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 1, color: const Color(0xFFCCCCCC)),
                    borderRadius: BorderRadius.circular(8)
                ),
                alignment: Alignment.center,
                child: const CustomImage(imageSrc: "assets/icons/upload.svg"),
              ),
            ),
            const CustomText(
              text: "Upload INE/Passport",
              top: 16,
              bottom: 12,
              textAlign: TextAlign.start,
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 115, width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 1, color: const Color(0xFFCCCCCC)),
                    borderRadius: BorderRadius.circular(8)
                ),
                alignment: Alignment.center,
                child: const CustomImage(imageSrc: "assets/icons/upload.svg"),
              ),
            ),
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
                color: AppColors.whiteNormalActive
              ),
            ),
          ],
        ),
        const SizedBox(height: 190),
        CustomElevatedButton(
            buttonWidth: MediaQuery.of(context).size.width,
            onPressed: (){},
            titleText: "Continue"
        )
      ],
    );
  }
}
