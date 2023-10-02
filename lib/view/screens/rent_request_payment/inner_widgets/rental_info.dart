import 'package:flutter/cupertino.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_model/rent_history_model.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';

class RentalInfo extends StatelessWidget {
  const RentalInfo({super.key, required this.rentHistoryModel});
  final UserWiseRent rentHistoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text:  AppStrings.rentalInformation,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.blackNormal,
        ),
        SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           CustomText(
             text: AppStrings.carmodel,
             fontSize: 16,
             fontWeight: FontWeight.w400,
             color: AppColors.whiteDarkHover,
           ),

            Text(rentHistoryModel.carId?.carModelName.toString()?? "",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           CustomText(
             text: AppStrings.carColor,
             fontSize: 16,
             fontWeight: FontWeight.w400,
             color: AppColors.whiteDarkHover,
           ),
            SizedBox(),
            Text(rentHistoryModel.carId?.carColor.toString()?? "",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           CustomText(
             text: AppStrings.carlicenseno,
             fontSize: 16,
             fontWeight: FontWeight.w400,
             color: AppColors.whiteDarkHover,
           ),
            SizedBox(),
            Text(rentHistoryModel.carId?.carLicenseNumber.toString()?? "",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        CustomText(
          text: AppStrings.rentalTime,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteDarkHover,
        ),
            SizedBox(),
            Text(rentHistoryModel.totalHours?? " ",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           CustomText(
             text: AppStrings.rentalDate,
             fontSize: 16,
             fontWeight: FontWeight.w400,
             color: AppColors.whiteDarkHover,
           ),
            SizedBox(),
            Text(rentHistoryModel.startDate?? "",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}