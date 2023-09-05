import 'package:flutter/material.dart';

import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class SelectPhotoBottomNavSection extends StatefulWidget {
  const SelectPhotoBottomNavSection({super.key});

  @override
  State<SelectPhotoBottomNavSection> createState() => _SelectPhotoBottomNavSectionState();
}

class _SelectPhotoBottomNavSectionState extends State<SelectPhotoBottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
      child: CustomElevatedButton(onPressed: (){

      }, titleText:AppStrings.continuw),
    );
  }
}
