import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forget_password_controller/forget_password_controller.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class ForgotPasswordTopSection extends StatefulWidget {
  const ForgotPasswordTopSection({super.key});

  @override
  State<ForgotPasswordTopSection> createState() => _ForgotPasswordTopSectionState();
}

class _ForgotPasswordTopSectionState extends State<ForgotPasswordTopSection> {


  @override
  Widget build(BuildContext context) {

    return GetBuilder<ForgetPasswordController>(builder: (controller) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: AppStrings.emailSentTitle,
          textAlign: TextAlign.start,
          fontSize: 16,
          bottom: 24,
        ),
        const Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            maxRadius: 50,
            child: CustomImage(imageSrc: AppIcons.emailLogo,imageType: ImageType.svg,),
          ),
        ),
        const CustomText(text: AppStrings.email, top: 24, bottom: 12),
        Form(
          key: controller.formKey,
          child: CustomTextField(
            textEditingController: controller.emailController,
            textInputAction: TextInputAction.done,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
              color: AppColors.whiteNormalActive
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.notBeEmpty;
              } else if (!value.contains(RegExp('@'))) {
                return AppStrings.enterValidEmail;
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    ));
  }
}
