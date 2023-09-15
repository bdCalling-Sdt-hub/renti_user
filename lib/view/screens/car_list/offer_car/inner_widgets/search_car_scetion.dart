import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class OfferCarSection extends StatefulWidget {
  const OfferCarSection({super.key});

  @override
  State<OfferCarSection> createState() => _SearchCarScetionState();
}

class _SearchCarScetionState extends State<OfferCarSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Container(
            margin: const EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsetsDirectional.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.whiteNormalActive,width: 1),
              color: AppColors.whiteLight,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.whiteNormalActive,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex:2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CustomText(
                            text: AppStrings.toyotaHarrier,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkBlueColor,
                          ),
                          SizedBox(width: 8,),
                          CustomImage(imageSrc: AppIcons.starIcon),
                          SizedBox(width: 8,),
                          CustomText(
                            text: "(4.5)",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackNormal,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          CustomImage(imageSrc: AppIcons.lucidFuel, size: 16),
                          Row(
                            children: [
                              CustomText(
                                text: "10",
                                color: AppColors.whiteDarkActive,
                                left: 8,
                                textAlign: TextAlign.start,
                              ),
                              CustomText(
                                  text: "km/L",
                                  color: AppColors.whiteDarkActive),
                              SizedBox(width: 8),
                              CustomText(
                                text: "\$12",
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8),
                              CustomText(
                                text: "\$25",
                                textDecoration: TextDecoration.lineThrough,
                              ),
                              CustomText(
                                text: "/hr",
                              )

                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomElevatedButton(onPressed: (){
                            Get.toNamed(AppRoute.carDetails);
                      }
                        , titleText: AppStrings.seeDetails,
                        titleWeight: FontWeight.w400,
                        titleSize: 10,
                        buttonRadius: 4,
                        textAlign: TextAlign.center,
                        buttonHeight: 28,
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: CustomImage(
                    imageSrc: AppImages.carImage,
                    imageType: ImageType.png,
                  ),
                ),
              ],
            ),
          ),
            Positioned.fill(
              top: 0,right: 0,
              child: Align(
                alignment: Alignment.topRight          ,
                child: Container(
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 4,horizontal: 6),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4),)
                    ),
                    child: const CustomText(
                      textAlign: TextAlign.center,
                      text: '12%Off',
                      color: AppColors.whiteLight,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,)
                ),
              ),
            ),
          ]
      );

  }
}
