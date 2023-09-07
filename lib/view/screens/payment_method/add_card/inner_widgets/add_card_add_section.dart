import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class AddCardAddSection extends StatefulWidget {
  const AddCardAddSection({super.key});

  @override
  State<AddCardAddSection> createState() => _AddCardAddSectionState();
}

class _AddCardAddSectionState extends State<AddCardAddSection> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //New Password Text and TextField
          const CustomText(
              text: AppStrings.cardNumber,
              top: 16,
              bottom: 12),
          CustomTextField(
            textInputAction: TextInputAction.done,
            hintText: '1234 1234 1234 1234 ',
            suffixIconColor: AppColors.whiteNormalActive,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteNormalActive),
          ),

          const CustomText(
              text: AppStrings.expireDate,
              top: 16,
              bottom: 12),
          CustomTextField(
            textInputAction: TextInputAction.done,
            hintText: AppStrings.mm_yy,
            suffixIconColor: AppColors.whiteNormalActive,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteNormalActive),
          ),
          const CustomText(
              text: AppStrings.cvv,
              top: 16,
              bottom: 12),
          CustomTextField(
            textInputAction: TextInputAction.done,
            hintText: AppStrings.enterCvv,
            suffixIconColor: AppColors.whiteNormalActive,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteNormalActive),
          ),
          const CustomText(
              text: AppStrings.accountHolderName,
              top: 16,
              bottom: 12),
          CustomTextField(
            textInputAction: TextInputAction.done,
            hintText: AppStrings.enterName,
            suffixIconColor: AppColors.whiteNormalActive,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteNormalActive),
          ),
        ],
      ),
    );
  }
}
