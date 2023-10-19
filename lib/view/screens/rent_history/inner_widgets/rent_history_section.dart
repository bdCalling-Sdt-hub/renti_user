import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/date_converter_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class RentHistorySection extends StatelessWidget {

  const RentHistorySection({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<RentHistoryController>(
      builder: (controller) => Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(controller.rentUser.length, (index) {
              return  GestureDetector(
                onTap: (){
                  if(controller.rentUser[index].requestStatus == "Accepted"){
                    Get.toNamed(AppRoute.rentRequest, arguments: index);
                  }else if(controller.rentUser[index].requestStatus == "Reserved"){
                    Get.toNamed(AppRoute.endTrip, arguments: controller.rentUser[index]);
                  }else if(controller.rentUser[index].requestStatus == "Pending"){
                    Get.toNamed(AppRoute.cancelRequestScreen, arguments: index);
                  }

                  // payment complete hole start trip e jabe
                },
                child: Container(
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
                                  text: '\$${controller.rentUser[index].totalAmount ?? "---"}',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                  textAlign: TextAlign.left,
                                  bottom: 8,
                                ),
                                CustomText(
                                  text: "Trip no: ${controller.rentUser[index].rentTripNumber ?? "---"}",
                                  fontSize: 12,
                                  color: AppColors.whiteDarkActive,
                                  bottom: 8,
                                ),
                                Row(
                                  children: [
                                    const CustomImage(imageSrc: AppIcons.calenderIcon,size: 14,imageColor: AppColors.whiteDarkActive,),
                                    CustomText(
                                      text: DateConverter.isoStringToLocalFormattedDateOnly(controller.rentUser[index].startDate.toString()),
                                      fontSize: 12,
                                      color: AppColors.whiteDarkActive,
                                      left: 8,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const CustomImage(imageSrc: AppIcons.location,size: 14, imageColor: AppColors.whiteDarkActive),
                                    CustomText(
                                      text: controller.rentUser[index].hostId!.address.toString(),
                                      fontSize: 12,
                                      color: AppColors.whiteDarkActive,
                                      left: 8,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: controller.rentUser[index].requestStatus == "Pending" ?
                                    const Color(0xffFFEED0) :
                                    controller.rentUser[index].requestStatus == "Reserved" ? 
                                    const Color(0xFFFBE9EC) : controller.rentUser[index].requestStatus == "Cancel" ? 
                                    AppColors.primaryColor.withOpacity(0.1)  : const Color(0xffE6F6F4),
                                    borderRadius: BorderRadius.circular(4),

                                  ),
                                  child: CustomText(
                                    text: controller.rentUser[index].requestStatus ?? "",
                                    color: controller.rentUser[index].requestStatus == "Pending" ?
                                    const Color(0xffFBA91D) :
                                    controller.rentUser[index].requestStatus == "Reserved" ?
                                    const Color(0xffD7263D) : controller.rentUser[index].requestStatus == "Cancel" ? 
                                    AppColors.primaryColor  : const Color(0xff00A991),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 160,
                            decoration:  BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(controller.rentUser[index].carId!.image![0])
                              ),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8)
                              ),
                            ),

                          )
                      )
                    ],
                  ),
                ),
              );
            }
            )
        ),
      )
    );
  }
}
