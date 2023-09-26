import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/route/app_route.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class PaymentMethodDebidCardSection extends StatefulWidget {
  const PaymentMethodDebidCardSection({super.key});

  @override
  State<PaymentMethodDebidCardSection> createState() => _PaymentMethodDebidCardSectionState();
}

class _PaymentMethodDebidCardSectionState extends State<PaymentMethodDebidCardSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate( 3, (index){
        return   Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: InkWell(
            onTap: (){
              Get.toNamed(AppRoute.paymentEditCard);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xffcccccc),width: 1)
              ),
              child:  const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.location),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: AppStrings.debit,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackNormal,
                            left: 16,
                          ),
                          CustomText(
                            text: '**** **** **** 6432',

                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                            top: 8,
                            left: 16,
                          ),
                        ],
                      )

                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xFF2E2C2C),
                  )
                ],
              ),
            ),
          ),
        );

      }
      ),
    );
  }
}
