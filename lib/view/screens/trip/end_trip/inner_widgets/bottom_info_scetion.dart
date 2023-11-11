import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/date_converter_helper.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
class BottomInfoScetion extends StatefulWidget {
  const BottomInfoScetion({super.key, required this.index});
  final int index;
  @override
  State<BottomInfoScetion> createState() => _BottomInfoScetionState();
}
class _BottomInfoScetionState extends State<BottomInfoScetion> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RentHistoryController>(builder: (controller){
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text:  AppStrings.rentalInformation,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackNormal,
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.carmodel,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.carModelName ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.carColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.carColor ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.carlicenseno,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.carLicenseNumber ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.rentalTime,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.totalRun ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.rentalDate,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].carId?.insuranceEndDate ?? "--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 16),
          const CustomText(
            text:  AppStrings.hostInformation,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackNormal,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.name,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].hostId?.fullName ?? "",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.ine,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].hostId?.ine ?? "",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),

            ],
          ),
          const SizedBox(height: 8,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: AppStrings.drivingLicenseNo,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              SizedBox(),
              Text("--",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.pickupLocation,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteDarkHover,
              ),
              const SizedBox(),
              Text(controller.rentUser[widget.index].hostId?.address?.city??"",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),

            ],
          ),
        ],
      );
    });
  }
}