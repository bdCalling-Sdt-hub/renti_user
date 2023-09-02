import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/text/custom_text.dart';
class HostInformationScreen extends StatefulWidget {
  const HostInformationScreen({super.key});
  @override
  State<HostInformationScreen> createState() => _HostInformationScreenState();
}
class _HostInformationScreenState extends State<HostInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

