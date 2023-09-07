import 'package:flutter/material.dart';

import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class ChangeLanguageBottomNavSection extends StatefulWidget {
  const ChangeLanguageBottomNavSection({super.key});

  @override
  State<ChangeLanguageBottomNavSection> createState() => _ChangeLanguageBottomNavSectionState();
}

class _ChangeLanguageBottomNavSectionState extends State<ChangeLanguageBottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: CustomElevatedButton(
          onPressed: () {}, titleText: AppStrings.select),
    );
  }
}
