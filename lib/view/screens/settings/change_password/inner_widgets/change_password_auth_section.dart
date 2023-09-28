import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/route/app_route.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class ChangePasswordAuthSection extends StatefulWidget {
  const ChangePasswordAuthSection({super.key});

  @override
  State<ChangePasswordAuthSection> createState() => _ChangePasswordAuthSectionState();
}

class _ChangePasswordAuthSectionState extends State<ChangePasswordAuthSection> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //New Password Text and TextField
          const CustomText(
              text: AppStrings.currentPassword,
              top: 24,
              bottom: 12),
          CustomTextField(
            isPassword: true,
            textInputAction: TextInputAction.done,
            hintText: 'Old Password',
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
              text: AppStrings.newPassword,
              top: 24,
              bottom: 12),
          CustomTextField(
            isPassword: true,
            textInputAction: TextInputAction.done,
            hintText: AppStrings.newPassword,
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
          const CustomText(
              text: AppStrings.confirmNewPassword,
              top: 24,
              bottom: 12),
          CustomTextField(
            isPassword: true,
            textInputAction: TextInputAction.done,
            hintText: AppStrings.confirmPassword,
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
          GestureDetector(
            onTap: (){
              Get.toNamed(AppRoute.forgotPasswordScreen);
            },
            child: const CustomText(
              text: AppStrings.forgetPassword,
              color: AppColors.darkBlueColor,
              top: 24,
            ),
          )
        ],
      ),
    );
  }
}
