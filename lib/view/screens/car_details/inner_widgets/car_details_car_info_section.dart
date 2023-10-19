import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_controller/car_details_controller.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_controller/all_cars_controller.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_model/all_cars_model.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_details/car_details_controller/car_details_controller.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class CarDetailsCarInfoSection extends StatefulWidget {
  const CarDetailsCarInfoSection({super.key});

  @override
  State<CarDetailsCarInfoSection> createState() => _CarDetailsCarInfoSectionState();
}

class _CarDetailsCarInfoSectionState extends State<CarDetailsCarInfoSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarDetailsController>(builder: (controller){
      return controller.isLoading? const Center(child: CircularProgressIndicator(),) : Column(
    return GetBuilder<CarDetailsController>(builder: (controller){
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
                text: controller.carDetailsModel.cars!.totalRun ?? "",
                text: controller.carDetailsModel.cars?.totalRun ?? "",
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
                text: controller.carDetailsModel.cars!.carColor.toString(),
                text: controller.carDetailsModel.cars?.carColor ?? "",
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
                text: controller.carDetailsModel.cars!.carSeats.toString(),
                text: controller.carDetailsModel.cars?.carSeats ?? "",
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
                text: controller.carDetailsModel.cars!.gearType.toString(),
                text: controller.carDetailsModel.cars?.gearType ?? "",
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
                text: "80/L",
                // text: controller.carDetailsModel.cars!..toString(),
                color: AppColors.blackNormal,
              ),
            ],
          ),
        ],
      );

    });
  }
}
