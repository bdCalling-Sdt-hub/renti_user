import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';

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
        Navigator.push(context, MaterialPageRoute(builder: (_)=>CustomNavBar()));
      }, titleText:AppStrings.continuw),
    );
  }
}
