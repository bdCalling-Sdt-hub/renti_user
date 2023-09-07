import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class SignUpContinueAuthSection extends StatefulWidget {
  const SignUpContinueAuthSection({super.key});

  @override
  State<SignUpContinueAuthSection> createState() => _SignUpContinueAuthSectionState();
}

class _SignUpContinueAuthSectionState extends State<SignUpContinueAuthSection> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Phone Number Text
          const CustomText(text: AppStrings.phoneNumber, bottom: 12),
          //Country Flag and Enter Phone Number TextField
          SizedBox(
            height: 56,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 110,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.whiteLight,
                    border: Border.all(
                        color: AppColors.whiteDark,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                  child:  const Row(
                    children: [
                      CustomImage(
                          imageSrc: AppIcons.flafMaxico,
                          imageType: ImageType.svg,
                          size: 40),

                      CustomText(
                          text: AppStrings.phone,
                          left: 10,
                          color: AppColors.whiteNormalActive)
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(

                    keyboardType: TextInputType.phone,
                    hintText: AppStrings.enterPhoneNumber,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteNormalActive),
                  ),
                ),
              ],
            ),
          ),

          //Address Text and TextField
          const CustomText(text: AppStrings.address, top: 16, bottom: 12),

          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteLight,border: Border.all(color: AppColors.whiteNormalActive,style: BorderStyle.solid,width: 1.0,strokeAlign: 1)
            ),
            child: CustomTextField(
              textInputAction: TextInputAction.done,
              fieldBorderColor: AppColors.whiteLight,
              hintText: AppStrings.enterAddress,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteNormalActive),
            ),
          ),
          const CustomText(
              text: AppStrings.creditCardNum, bottom: 12, top: 16),
          CustomTextField(
            hintText: AppStrings.enterCreditCardNum,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
                color: AppColors.whiteNormalActive),
          ),

          //Confirm Password Text and TextField
          const CustomText(
              text: AppStrings.expireDate,
              bottom: 12,
              top: 16),
          CustomTextField(
            hintText: AppStrings.mm_yy,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
                color: AppColors.whiteNormalActive),
          ),
          const CustomText(
              text: AppStrings.cvv,
              bottom: 12,
              top: 16),
          CustomTextField(
            hintText: AppStrings.enterCVV,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
                color: AppColors.whiteNormalActive),
          ),
        ],
      ),
    );
  }
}
