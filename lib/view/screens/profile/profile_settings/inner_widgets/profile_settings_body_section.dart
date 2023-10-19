import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';
import 'package:renti_user/view/screens/profile/profile_settings/inner_widgets/profile_image_section.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class ProfileSettingsBodySection extends StatelessWidget {
  const ProfileSettingsBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileDetailsController>(
      builder: (controller) => Column(
        children: [
          ProfileImageSection(imagePath: controller.profileImage, isEdit: true),
          const SizedBox(height: 16),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(text: AppStrings.fullName, bottom: 12),
                CustomTextField(
                  textEditingController: controller.fullNameController,
                  hintText: AppStrings.typeFullName,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive),
                ),
                const CustomText(
                  text: AppStrings.email,
                  top: 16,
                  bottom: 12,
                ),
                CustomTextField(
                  textEditingController: controller.emailController,
                  textInputAction: TextInputAction.done,
                  hintText: AppStrings.typeFullName,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      color: AppColors.whiteNormalActive),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.notBeEmpty;
                    } else if (!value.contains(RegExp('\@'))) {
                      return AppStrings.enterValidEmail;
                    } else {
                      return null;
                    }
                  },
                ),
                const CustomText(
                  text: AppStrings.phoneNumber,
                  bottom: 12,
                  top: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.whiteLight,
                          border: Border.all(
                              color: AppColors.whiteDark,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        child: const Row(
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
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        textEditingController: controller.phoneNumberController,
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
                const CustomText(text: AppStrings.address, top: 16, bottom: 12),
                Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.whiteLight,
                      border: Border.all(
                          color: AppColors.whiteNormalActive,
                          style: BorderStyle.solid,
                          width: 1.0,
                          strokeAlign: 1)),
                  child: CustomTextField(
                    textEditingController: controller.addressController,
                    textInputAction: TextInputAction.done,
                    fieldBorderColor: AppColors.whiteLight,
                    hintText: AppStrings.enterAddress,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteNormalActive),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
