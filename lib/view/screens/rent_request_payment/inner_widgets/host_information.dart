import 'package:flutter/material.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';

class HostInfo extends StatefulWidget {
  const HostInfo({super.key});
  @override
  State<HostInfo> createState() => _HostInfoState();
}
class _HostInfoState extends State<HostInfo> {
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

