
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_model/home_popular_model.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class PopularCarSection extends StatefulWidget {
  const PopularCarSection({super.key});

  @override
  State<PopularCarSection> createState() => _SearchCarScetionState();
}

class _SearchCarScetionState extends State<PopularCarSection> {
  PopularCarModel popularCarModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(popularCarModel.cars!.length.toInt(), (index) =>  Stack(
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
                        Row(
                          children: [
                            CustomText(
                              text: popularCarModel.cars![index].carModelName.toString(),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkBlueColor,
                            ),
                            const SizedBox(width: 8,),
                            const CustomImage(imageSrc: AppIcons.starIcon),
                            const SizedBox(width: 8,),
                            const CustomText(
                              text: "(4.5)",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackNormal,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                         Row(
                          children: [
                            const CustomImage(imageSrc: AppIcons.lucidFuel, size: 16),
                            Row(
                              children: [
                                CustomText(
                                  text: popularCarModel.cars![index].totalRun.toString(),
                                  color: AppColors.whiteDarkActive,
                                  left: 8,
                                  textAlign: TextAlign.start,
                                ),
                                const CustomText(
                                    text: "/L",
                                    color: AppColors.whiteDarkActive),
                                const SizedBox(width: 16),
                                 CustomText(
                                  text: "${"\$"}${ popularCarModel.cars![index].hourlyRate.toString()}",

                                ),
                                const SizedBox(width: 8),
                                // const CustomText(
                                //   text: "\$25",
                                //   textDecoration: TextDecoration.lineThrough,
                                // ),
                                const CustomText(
                                  text:"/hr",
                                    color: AppColors.primaryColor
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
                   Expanded(
                    child: Container(
                       height: 60,
                       width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(popularCarModel.cars![index].image[0].toString()),
                        fit: BoxFit.fill),
                      ),
                    )
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
      ),)
    );

  }
}
