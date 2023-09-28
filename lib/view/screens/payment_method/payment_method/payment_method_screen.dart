import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/payment_method/payment_method/inner_widgets/payment_method_debit_card_section.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/text/custom_text.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
      backgroundColor: AppColors.whiteLight,
      appBar: CustomAppBar(
          appBarContent: Row(
            children: [
              GestureDetector(
                  onTap: () {
                  Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: AppColors.blackNormal,
                  )),
              const CustomText(
                text: AppStrings.paymentMethod,
                color: AppColors.blackNormal,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                left: 14,
              )
            ],
          )),
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const PaymentMethodDebidCardSection(),
                  const SizedBox(height: 28,),
                  GestureDetector(
                    onTap: (){
                    Get.toNamed(AppRoute.addCard);
                    },
                    child: const Row(
                      children: [
                        CustomImage(imageSrc: AppIcons.addCardIcon,size: 24,),
                       CustomText(
                         text: AppStrings.addCard,
                         fontSize: 18,
                         fontWeight: FontWeight.w600,
                         color: AppColors.primaryColor,
                         left: 10,
                       )
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    ));
  }
}
