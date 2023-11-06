import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class ProfileImageSection extends StatefulWidget {

  final String imagePath;
  final bool isEdit;

  const ProfileImageSection({required this.imagePath, this.isEdit = false, super.key});

  @override
  State<ProfileImageSection> createState() => _ProfileImageSectionState();
}

class _ProfileImageSectionState extends State<ProfileImageSection> {

  XFile? imageFile;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ProfileDetailsController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !widget.isEdit ? buildDefaultImage() : buildImage(),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => openGallery(context),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(
                  imageSrc: AppIcons.selectCamera,
                  size: 18,
                  imageColor: AppColors.primaryColor,
                ),
                CustomText(
                  text: AppStrings.changePhoto,
                  color: AppColors.primaryColor,
                  left: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDefaultImage() {

    return const CustomImage(
      imageSrc: "assets/images/user.png",
      imageType: ImageType.png,
      size: 100,
    );
  }

  Widget buildImage() {

    return Container(
      height: 100, width: 100,
      decoration: BoxDecoration(
        shape:  BoxShape.circle,
        image: imageFile != null ? DecorationImage(
          image: FileImage(File(imageFile!.path)),
          fit: BoxFit.fill
        ) : widget.imagePath.contains("http") ? DecorationImage(
          image: NetworkImage(widget.imagePath),
          fit: BoxFit.fill
        ) : const DecorationImage(image: AssetImage("assets/images/user.png"), fit: BoxFit.fill)
      ),
    );
  }

  void openGallery(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (result != null && result.files.isNotEmpty) {
      Get.find<ProfileDetailsController>().imageFile = File(result.files.single.path!);
      setState(() {
        imageFile = XFile(result.files.single.path!);
      });
      print("Selected Image Path: ${imageFile?.path}");
    } else {
      print("No image selected.");
    }
  }
}
