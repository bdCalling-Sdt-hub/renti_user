import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/select_photo/inner_widgets/select_photo_bottom_nav_section.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';

class SelectPhotoScreen extends StatefulWidget {
  const SelectPhotoScreen({super.key});

  @override
  State<SelectPhotoScreen> createState() => _SelectPhotoScreenState();
}

class _SelectPhotoScreenState extends State<SelectPhotoScreen> {

  final ImagePicker _imagePicker = ImagePicker();
  XFile ? image;

  fromCamera ()async{
   image = await _imagePicker.pickImage(source: ImageSource.camera);
   setState(() {
   });
  }

  fromGallery () async{
   image = await _imagePicker.pickImage(source: ImageSource.gallery);
   setState(() {

   });
  }

  @override
  void initState() {
    DeviceUtils.screenUtils();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false, bottom: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primaryColor,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(text: AppStrings.selectPhoto),
        ),
        body: GetBuilder<SignUpController>(
          builder: (controller) => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                CustomContainer(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 44),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.openGallery();
                          },
                          child: controller.profileImage == null? Container(
                            width: 150,
                            height: 150,
                            alignment: Alignment.center,
                            padding: const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(width: 2, color: AppColors.darkBlueColor)
                            ),
                            child: Container(
                              width: 130,
                              height: 130,
                              alignment: Alignment.center,
                              padding: const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 10),
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/images/user.png"), fit: BoxFit.fill)
                              ),
                            ),
                          ):Container(
                            width: 150,
                            height: 150,
                            alignment: Alignment.center,
                            padding: const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(width: 2, color: AppColors.darkBlueColor)
                            ),
                            child: Container(
                              width: 150,
                              height: 150,
                              alignment: Alignment.center,
                              padding: const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: FileImage(controller.profileImage!), fit: BoxFit.fill),
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        const CustomText(
                          top: 16,
                          text: AppStrings.uploadYourPhoto,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
        bottomNavigationBar: const SelectPhotoBottomNavSection()
      ),
    );
  }
}
