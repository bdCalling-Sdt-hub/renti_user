import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../offer_car/inner_widgets/search_filter.dart';

class LuxuryCarsScreen extends StatefulWidget {
  const LuxuryCarsScreen({super.key});
  @override
  State<LuxuryCarsScreen> createState() => _LuxuryCarsScreenState();
}
class _LuxuryCarsScreenState extends State<LuxuryCarsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: CustomAppBar(
            appBarContent: Row(
              children: [
                GestureDetector(
                    onTap: () {

                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: AppColors.blackNormal,
                    )),
                const CustomText(
                  text: AppStrings.luxuryCars,
                  color: AppColors.blackNormal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  left: 20,
                )
              ],
            )),
        body:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
          child: Column(
            children: [
              const SearchFilter(),
              const SizedBox(height: 24),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                      children:  List.generate(
                        40, (index) =>
                          Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(bottom: 16),
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
                                          color: AppColors.blueDark,
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
                                              text: "\$25",

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
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}