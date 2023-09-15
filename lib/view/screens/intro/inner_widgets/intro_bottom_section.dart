import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class IntroBottomSection extends StatelessWidget {
  const IntroBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.selectLanguageScreen);
          },
          child:const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: AppStrings.lanmguageName,
                color: AppColors.whiteLight,
                fontSize: 16,
                right: 8,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.whiteLight,
                size: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        CustomElevatedButton(
          onPressed: () {
            Get.toNamed(
                AppRoute.signInScreen
            );
          },
          titleText: AppStrings.getStarted,
          buttonWidth: double.maxFinite,
          buttonColor: AppColors.whiteLight,
          titleColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
