import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';


import 'hsbc_méxico_card.dart';

class PaymentSection extends StatefulWidget {
     PaymentSection({
       super.key, required this.scrollController
     });
  final ScrollController scrollController;
  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
 bool isarrowup = false;
 void scrollToBottomExtentBefore() {
   widget.scrollController.animateTo(
     widget.scrollController.position.extentBefore,
     duration: const Duration(milliseconds: 50),
     curve: Curves.ease,
   );
 }

 void scrollToBottomExtentTotal() {
   widget.scrollController.animateTo(
     widget.scrollController.position.extentTotal,
     duration: const Duration(milliseconds: 1200),
     curve: Curves.easeIn,
   );
 }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
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
                color: AppColors.blueNormal,
              ),
              textAlign: TextAlign.right,
            )
          ],
        ),
        const SizedBox(height: 16),
               CustomContainer(
               borderColor:AppColors.blueNormal ,
               borderRadius: 4,
               containerBgColor: AppColors.whiteLight,
               paddingVertical: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
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
                      isarrowup?  scrollToBottomExtentTotal(): scrollToBottomExtentBefore();
                    });
                  },
                  child:isarrowup? const Icon(Icons.keyboard_arrow_up,
                    size: 20,
                    color: AppColors.blueNormal,

                  ):const Icon(Icons.keyboard_arrow_down,
                    size: 20,
                    color: AppColors.blueNormal ,
                  ),
                )
              ],
              )
               ),
            isarrowup ? const HsbcMexicoCard() : const SizedBox(),
            const SizedBox(height: 24),

      ],
    );
  }
}