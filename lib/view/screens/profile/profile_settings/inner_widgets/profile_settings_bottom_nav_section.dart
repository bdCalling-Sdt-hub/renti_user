import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/profile/profile_settings/profile_settings_controller/profile_settings_controller.dart';
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
      builder: (controller){
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: CustomElevatedButton(
              onPressed: () {
                controller.profileSettingsResult();
              }, titleText: AppStrings.updateprofile),
        );
      },
    );
  }
}
