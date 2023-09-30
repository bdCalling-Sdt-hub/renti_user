import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';

class RentHistorySection extends StatefulWidget {
  const RentHistorySection({super.key});

  @override
  State<RentHistorySection> createState() => _RentHistorySectionState();
}

class _RentHistorySectionState extends State<RentHistorySection> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<RentHistoryController>(
      builder: (controller) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:List.generate(controller.carList.length, (index) {
              return  Container(
                margin: const EdgeInsets.only(bottom: 8),
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  color: AppColors.whiteLight,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: AppColors.lightBlueColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: '\$ ${'400'}',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                                textAlign: TextAlign.left,
                                bottom: 8,
                              ),
                              const CustomText(
                                text: 'Trip no 003',
                                fontSize: 12,
                                color: AppColors.whiteDarkActive,
                                bottom: 8,
                              ),
                              const Row(
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
                                  const CustomImage(imageSrc: AppIcons.location,size: 12,imageColor: AppColors.whiteDarkActive),
                                  CustomText(
                                    text: controller.carList[index].carId!.carModelName ??'',
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
                        child: Container(
                          height: 130,
                          decoration:   BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: NetworkImage(controller.carList[index].carId!.image![0])
                            ),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),bottomRight: Radius.circular(8)
                            ),
                          ),

                        )
                    )
                  ],
                ),
              );
            }
            )
        );
      }
    );
  }
}
