import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/route/app_route.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class ForgotPasswordBottomNavSection extends StatefulWidget {
  const ForgotPasswordBottomNavSection({super.key});

  @override
  State<ForgotPasswordBottomNavSection> createState() => _ForgotPasswordBottomNavSectionState();
}

class _ForgotPasswordBottomNavSectionState extends State<ForgotPasswordBottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return  CustomElevatedButton(
        onPressed: () {
          Get.toNamed(AppRoute.otpScreen);
        },
        titleText: (AppStrings.continuw)
    );
  }
}
