import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/view/screens/auth/new_password/reset_password_controller/reset_password_controller.dart';

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

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ResetPasswordController>(
      builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: AppStrings.password,
                top: 24,
                bottom: 12
              ),
              CustomTextField(
                isPassword: true,
                textEditingController: controller.passwordController,
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
              const CustomText(
                  text: AppStrings.confirmPassword,
                  top: 24,
                  bottom: 12
              ),
              CustomTextField(
                isPassword: true,
                textEditingController: controller.confirmPasswordController,
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
                  } else if(controller.passwordController.text != controller.confirmPasswordController.text){
                    return "Password doesn't match";
                  }
                  else{
                    return null;
                  }
                },
              ),
            ],
          ),
        );
      }
    );
  }
}
