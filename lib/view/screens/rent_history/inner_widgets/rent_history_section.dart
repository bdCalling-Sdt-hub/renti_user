import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/date_converter_helper.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class RentHistorySection extends StatefulWidget {
  const RentHistorySection({super.key});

  @override
  State<RentHistorySection> createState() => _RentHistorySectionState();
}


class _RentHistorySectionState extends State<RentHistorySection> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<RentHistoryController>(builder: (controller){
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:List.generate(controller.carList.length, (index) {
            return  Container(
              margin:const EdgeInsets.only(bottom: 8),
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
                            CustomText(
                              text: '\$ ${controller.carList[index].payment}',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                              textAlign: TextAlign.left,
                              bottom: 8,
                            ),
                            CustomText(
                              text: controller.carList[index].rentTripNumber.toString(),
                              fontSize: 12,
                              color: AppColors.whiteDarkActive,
                              bottom: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomImage(imageSrc: AppIcons.calenderIcon,size: 12,imageColor: AppColors.whiteDarkActive,),
                                CustomText(
                                  text: DateConverter.isoStringToLocalFormattedDateOnly(controller.carList[index].startDate ?? ""),
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
                                  text: controller.carList[index].hostId!.address.toString(),
                                  fontSize: 12,
                                  color: AppColors.whiteDarkActive,
                                  left: 10,
                                )
                              ],
                            ),
                            const SizedBox(height: 4,),

                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE6F6F4),
                                borderRadius: BorderRadius.circular(4),

                              ),
                              child: CustomText(text: controller.carList[index].requestStatus ?? "",
                                color: const Color(0xFF00A991),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 130,
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(controller.carList[index].hostId!.image.toString())
                          ),
                          borderRadius: const BorderRadius.only(
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
    });
  }
}
