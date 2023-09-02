import 'package:flutter/cupertino.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/text/custom_text.dart';

class RentalInfostart extends StatelessWidget {
  const RentalInfostart({super.key});
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
      ],
    );
  }
}