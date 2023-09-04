import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/container/custom_container.dart';
import '../../widgets/text/custom_text.dart';

class RentHistoryScreen extends StatefulWidget {
  const RentHistoryScreen({super.key});

  @override
  State<RentHistoryScreen> createState() => _RentHistoryScreenState();
}

class _RentHistoryScreenState extends State<RentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteLight,
      appBar: CustomAppBar(
          appBarContent: Row(
        children: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: AppColors.blackNormal,
              )),
          const CustomText(
            text: AppStrings.rentiHistory,
            color: AppColors.blackNormal,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            left: 14,
          )
        ],
      )),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:List.generate(3, (index) {
              return  Container(
                margin: EdgeInsets.only(bottom: 8),
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  color: AppColors.whiteLight,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: AppColors.blueLight),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: '\$ ${'400'}',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blueNormal,
                                textAlign: TextAlign.left,
                                bottom: 8,
                              ),
                              CustomText(
                                text: 'Trip no 003',
                                fontSize: 12,
                                color: AppColors.whiteDarkActive,
                                bottom: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImage(imageSrc: AppIcons.calenderIcon,size: 12,imageColor: AppColors.whiteDarkActive,),
                                  CustomText(
                                    text: '09 Aug 2023',
                                    fontSize: 12,
                                    color: AppColors.whiteDarkActive,
                                    bottom: 8,
                                    left: 10,
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImage(imageSrc: AppIcons.location,size: 12,imageColor: AppColors.whiteDarkActive),
                                  CustomText(
                                    text: 'Mexico',
                                    fontSize: 12,
                                    color: AppColors.whiteDarkActive,
                                    left: 10,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          AppImages.carBg,
                          height: 131,
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
              );
            }
            )
          ),
        ),
      ),
    ));
  }
}
