import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/profile/profile_settings/profile_settings_controller/profile_settings_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';

import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class ProfileSettingsBottomNavSection extends StatefulWidget {
  const ProfileSettingsBottomNavSection({super.key});

  @override
  State<ProfileSettingsBottomNavSection> createState() => _ProfileSettingsBottomNavSectionState();
}

class _ProfileSettingsBottomNavSectionState extends State<ProfileSettingsBottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileSettingsController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: controller.isSubmit ? const CustomElevatedLoadingButton() : CustomElevatedButton(
            onPressed: () => controller.updateProfile(),
            titleText: AppStrings.updateprofile
        ),
      ),
    );
  }
}
