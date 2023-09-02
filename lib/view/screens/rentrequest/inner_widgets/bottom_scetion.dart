import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import 'hsbc_méxico_card.dart';

class BottomScetion extends StatefulWidget {
  const BottomScetion({super.key});

  @override
  State<BottomScetion> createState() => _BottomScetionState();
}

class _BottomScetionState extends State<BottomScetion> {
 bool isarrowup = false;
  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.totalAmount,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.blueNormal ,
            ),
            Text(
              "\$ 250",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff000b90),
              ),
              textAlign: TextAlign.right,
            )
          ],
        ),
        SizedBox(height: 16),
               CustomContainer(
               borderColor:AppColors.blueNormal ,
               borderRadius: 4,
               containerBgColor: AppColors.whiteLight,
               paddingVertical: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomImage(
                        imageSrc: AppIcons.paymentIcon,
                    ),
                    SizedBox(width: 16),
                    CustomText(
                      text: AppStrings.bankMexico,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueNormal,
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      isarrowup  =! isarrowup;
                    });

                  },
                  child:isarrowup? Icon(Icons.keyboard_arrow_up,
                    size: 20,
                    color: Color(0xff000B90) ,

                  ):Icon(Icons.keyboard_arrow_down,
                    size: 20,
                    color: Color(0xff000B90) ,

                  ),
                )
              ],
            )
               ),
         isarrowup ? HsbcMexicoCard() : const SizedBox()
      ],
    );
  }
}
