import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/view/screens/auth/select_photo/inner_widgets/select_photo_bottom_nav_section.dart';

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

  fromGellery () async{
   image = await _imagePicker.pickImage(source: ImageSource.gallery);
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primaryColor,
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
                     image == null ? Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor,
                              width: 2,
                              strokeAlign: 1,
                              style: BorderStyle.solid),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: AppColors.lightBlueColor, shape: BoxShape.circle),
                          height: 130,
                          width: 130,
                          child: InkWell(
                            onTap: (){
                              fromGellery();
                            },
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 50,
                              color: AppColors.lightBlueColorActive,
                            ),
                          ),
                        ),
                      ):
                     Container(
                       margin:  EdgeInsets.only(top: 20),
                       height: 150,
                       width: 150,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         border: Border.all(
                             color: AppColors.primaryColor,
                             width: 2,
                             strokeAlign: 1,
                             style: BorderStyle.solid),
                         shape: BoxShape.circle,
                       ),
                       child: CircleAvatar(
                         child: Image.file(File(image!.path),height: 100,width: 100,fit: BoxFit.cover,),
                       )
                     ) ,
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
        bottomNavigationBar: const SelectPhotoBottomNavSection()
      ),
    );
  }
}
