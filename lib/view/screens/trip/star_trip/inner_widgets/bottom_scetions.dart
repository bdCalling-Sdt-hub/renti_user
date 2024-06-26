import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class BottomScetions extends StatefulWidget {
  const BottomScetions({super.key, required this.index});
  final int index;
  @override
  State<BottomScetions> createState() => _BottomScetionsState();
}

class _BottomScetionsState extends State<BottomScetions> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RentHistoryController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomText(
              text:  AppStrings.rentalInformation.tr,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.blackNormal,
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 CustomText(
                  text: AppStrings.carmodel.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkHover,
                ),
                const SizedBox(),
                Text(controller.rentUser[widget.index].carId?.carModelName??"",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 CustomText(
                  text: AppStrings.carColor.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkHover,
                ),
                const SizedBox(),
                Text(controller.rentUser[widget.index].carId?.carColor??"",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppStrings.carlicenseno.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkHover,
                ),
                const SizedBox(),
                Text(controller.rentUser[widget.index].carId?.carLicenseNumber??"",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8,),
            ///==================Total run ====================///

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Total days".tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkHover,
                ),
                const SizedBox(),
                Text("${controller.rentUser[widget.index].totalDays}"??"--",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppStrings.rentalDate.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkHover,
                ),
                const SizedBox(),
                Text(controller.rentUser[widget.index].carId?.registrationDate??"",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 16),
            CustomText(
              text:  AppStrings.hostInformation.tr,
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
                CustomText(
                  text: AppStrings.name.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkHover,
                ),
                const SizedBox(),
                Text(controller.rentUser[widget.index].hostId?.fullName??"",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppStrings.ine.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkHover,
                ),
                const SizedBox(),
                Text(controller.rentUser[widget.index].hostId?.ine??"",style: const TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),

              ],
            ),
            const SizedBox(height: 8,),
          /*  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppStrings.drivingLicenseNo.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkHover,
                ),
                const SizedBox(),
                 Text(controller.rentUser[widget.index].hostId?.,style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
              ],
            ),*/
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppStrings.pickupLocation.tr,
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
      }
    );
  }
}