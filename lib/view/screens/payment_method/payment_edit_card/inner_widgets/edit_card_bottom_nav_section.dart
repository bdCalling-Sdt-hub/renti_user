import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/route/app_route.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class EditCardBottomNavSection extends StatefulWidget {
  const EditCardBottomNavSection({super.key});

  @override
  State<EditCardBottomNavSection> createState() => _EditCardBottomNavSectionState();
}

class _EditCardBottomNavSectionState extends State<EditCardBottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: CustomElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoute.paymentMethod);
          },
          titleText:AppStrings.update),
    );
  }
}
