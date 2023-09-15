import 'package:flutter/material.dart';
import 'package:renti_user/view/screens/home/home_screen.dart';

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
        Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomeScreen()));
      }, titleText:AppStrings.continuw),
    );
  }
}
