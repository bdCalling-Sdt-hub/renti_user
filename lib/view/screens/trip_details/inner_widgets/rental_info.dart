import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/trip_details/trip_detasils_controller/trip_details_controller.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';

class RentalInfo extends StatelessWidget {
  const RentalInfo({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<TripDetailsController>(builder: (controller){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: AppStrings.carInformation,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.blackNormal,
            top: 24,
            bottom: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.totalMileage,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: controller.tripDetailsModel.rents?.carId?.totalRun ?? "---",
                color: AppColors.blackNormal,
                bottom: 12,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: controller.tripDetailsModel.rents?.carId?.carColor ?? "---",
                color: AppColors.blackNormal,
                bottom: 12,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.capacity,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: controller.tripDetailsModel.rents?.carId?.carSeats ?? "---",
                color: AppColors.blackNormal,
                bottom: 12,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.gearType,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: controller.tripDetailsModel.rents?.carId?.gearType ?? "---",
                color: AppColors.blackNormal,
                bottom: 12,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: AppStrings.fuelTankCapacity,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
              ),
              CustomText(
                text: '70 L',
                color: AppColors.blackNormal,
              ),
            ],
          ),
        ],
      );

    });
  }
}