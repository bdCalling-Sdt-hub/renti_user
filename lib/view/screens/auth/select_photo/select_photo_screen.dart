import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/view/screens/auth/select_photo/inner_widgets/select_photo_bottom_nav_section.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';

class SelectPhotoScreen extends StatefulWidget {
  const SelectPhotoScreen({super.key});

  @override
  State<SelectPhotoScreen> createState() => _SelectPhotoScreenState();
}

class _SelectPhotoScreenState extends State<SelectPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.blueNormal,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(text: AppStrings.selectPhoto),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              CustomContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.blueNormal,
                              width: 2,
                              strokeAlign: 1,
                              style: BorderStyle.solid),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: AppColors.blueLight, shape: BoxShape.circle),
                          height: 130,
                          width: 130,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 50,
                            color: AppColors.blueLightActive,
                          ),
                        ),
                      ),
                      const CustomText(
                        top: 16,
                        text: AppStrings.uploadYourPhoto,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blueNormal,
                      ),
                    ],
                  ),
                ),
              ),
        ),
        bottomNavigationBar: const SelectPhotoBottomNavSection()
      ),
    );
  }
}
