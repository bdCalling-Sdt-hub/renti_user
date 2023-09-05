import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/route/app_route.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class SignUpBottomSection extends StatefulWidget {
  const SignUpBottomSection({super.key});

  @override
  State<SignUpBottomSection> createState() => _SignUpBottomSectionState();
}

class _SignUpBottomSectionState extends State<SignUpBottomSection> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: CustomElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoute.signUpContinueScreen);
          },
          titleText: AppStrings.continuw),
    );
  }
}
