import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_controller/car_details_controller.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class CarDetailsTopSection extends StatelessWidget {
  const CarDetailsTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarDetailsController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: AppColors.whiteLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 10,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 44,horizontal: 44),
                width: MediaQuery.of(context).size.width,
                decoration: controller.carDetailsModel.cars?.image != null ? BoxDecoration(
                    color: AppColors.whiteDArkHover,
                  image: DecorationImage(
                    image: NetworkImage(
                      controller.carDetailsModel.cars?.image![0] ?? ""
                    ),
                    fit: BoxFit.fill
                  )
                ) : const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          AppImages.carImage
                        ),
                        fit: BoxFit.fill
                    )
                ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 12,bottom: 12,top: 8),
              color: AppColors.whiteLight,
              child:    Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: controller.carDetailsModel.cars?.carModelName ?? "",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlueColor,
                        right: 8,
                        bottom: 8,
                      ),
                      CustomImage(
                        imageSrc: AppIcons.starIcon,
                        size: 12,),
                      CustomText(
                        text: "5",
                        fontSize: 10,
                        color: AppColors.blackNormal,
                        bottom: 8,
                        left: 8,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImage(imageSrc: AppIcons.lucidFuel,size: 12,),
                      CustomText(
                        text: "${controller.carDetailsModel.cars!.totalRun.toString()}/L",
                        fontSize: 12,
                        color: AppColors.whiteDarkActive,
                        right: 8,
                        left: 6,
                      ),
                      CustomText(
                        text: "\$${controller.carDetailsModel.cars!.hourlyRate}/hour",
                        fontSize: 12,
                        color: AppColors.whiteDarkActive,
                        left: 8,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
