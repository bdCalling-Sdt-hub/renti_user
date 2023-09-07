import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class NewPasswordAuthSection extends StatefulWidget {
  const NewPasswordAuthSection({super.key});

  @override
  State<NewPasswordAuthSection> createState() => _NewPasswordAuthSectionState();
}

class _NewPasswordAuthSectionState extends State<NewPasswordAuthSection> {
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
              text: AppStrings.password,
              top: 24,
              bottom: 12),
          CustomTextField(
            isPassword: true,
            textInputAction: TextInputAction.done,
            hintText: AppStrings.enterPassword,
            suffixIconColor: AppColors.whiteNormalActive,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteNormalActive),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.notBeEmpty;
              } else if (value.length < 6) {
                return AppStrings.passwordShouldBe;
              } else {
                return null;
              }
            },
          ),

          //Confirm Password Text and TextField
          const CustomText(
              text: AppStrings.confirmPassword,
              top: 24,
              bottom: 12),
          CustomTextField(
            isPassword: true,
            textInputAction: TextInputAction.done,
            hintText: AppStrings.enterPassword,
            suffixIconColor: AppColors.whiteNormalActive,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteNormalActive),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.notBeEmpty;
              } else if (value.length < 6) {
                return AppStrings.passwordShouldBe;
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}
