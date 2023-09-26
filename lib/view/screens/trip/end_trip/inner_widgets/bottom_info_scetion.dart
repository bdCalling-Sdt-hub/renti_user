import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
class BottomInfoScetion extends StatefulWidget {
  const BottomInfoScetion({super.key});
  @override
  State<BottomInfoScetion> createState() => _BottomInfoScetionState();
}
class _BottomInfoScetionState extends State<BottomInfoScetion> {
  @override
  Widget build(BuildContext context) {
    return const Column(
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
            SizedBox(),
            Text("Toyota Corolla",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
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
            Text("Blue",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
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
            Text("61-10-TMD",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
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
            Text("48 Hr",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
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
            Text('08 Aug 2023',style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
          ],
        ),
        SizedBox(height: 16),
        CustomText(
          text:  AppStrings.hostInformation,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.blackNormal,
        ),
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.name,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarkHover,
            ),
            SizedBox(),
            Text("Md Jubayed",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.ine,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarkHover,
            ),
            SizedBox(),
            Text("12345678964",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),

          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.drivingLicenseNo,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarkHover,
            ),
            SizedBox(),
            Text("61-10-2222",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.pickupLocation,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteDarkHover,
            ),
            SizedBox(),
            Text("Mexico",style: TextStyle(color: Color(0xff2E2C2C),fontSize: 16,fontWeight:FontWeight.w500)),

          ],
        ),
      ],
    );
  }
}
