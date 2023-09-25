import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class TopUploadScetion extends StatefulWidget {
  const TopUploadScetion({super.key});
  @override
  State<TopUploadScetion> createState() => _TopUploadScetionState();
}
class _TopUploadScetionState extends State<TopUploadScetion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: AppStrings.uploadecarphoto,
          color: AppColors.blackNormal,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: DottedBorder(
                  padding: const EdgeInsets.all(0),
                  dashPattern: const [
                    8,
                    8,
                  ],
                  color: const Color(0xffB0B3DD),
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  child: Container(
                    padding: EdgeInsets.all(56),
                    width: MediaQuery.of(context).size.width,
                    // height: 150,
                    // height: MediaQuery.of(context).size.height*19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffE6E7F4),
                    ),
                    child: const Center(
                        child: CustomImage(
                          imageSrc: AppIcons.imageIcons,
                          size: 40,
                        )),
                  )),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  DottedBorder(
                      padding: const EdgeInsets.all(0),
                      dashPattern: const [
                        8,
                        8,
                      ],
                      color: const Color(0xffB0B3DD),
                      strokeWidth: 1,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      child: Container(
                        padding: EdgeInsetsDirectional.symmetric(vertical: 16),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffE6E7F4),
                        ),
                        child: const Center(
                            child: CustomImage(
                              imageSrc: AppIcons.imageIcons,
                              size: 40,
                            )),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  DottedBorder(
                      padding: const EdgeInsets.all(0),
                      dashPattern: const [
                        8,
                        8,
                      ],
                      color: const Color(0xffB0B3DD),
                      strokeWidth: 1,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      child: Container(
                        padding: EdgeInsetsDirectional.symmetric(vertical: 16),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffE6E7F4),
                        ),
                        child: const Center(
                            child: CustomImage(
                              imageSrc: AppIcons.imageIcons,
                              size: 40,
                            )),
                      ))
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
