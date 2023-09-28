import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/payment_method/payment_edit_card/inner_widgets/edit_card_bottom_nav_section.dart';
import 'package:renti_user/view/screens/payment_method/payment_edit_card/inner_widgets/edit_card_edit_section.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/text/custom_text.dart';

class PaymentEditCardScreen extends StatefulWidget {
  const PaymentEditCardScreen({super.key});

  @override
  State<PaymentEditCardScreen> createState() => _PaymentEditCardScreenState();
}

class _PaymentEditCardScreenState extends State<PaymentEditCardScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
      backgroundColor: AppColors.whiteLight,
      appBar: CustomAppBar(
          appBarContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                    text: AppStrings.editCard,
                    color: AppColors.blackNormal,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    left: 14,
                  )
                ],
              ),
              const CustomImage(imageSrc: AppIcons.delete,imageColor: AppColors.blackNormal,size: 18,)
            ],
          )),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            const SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 24),
              physics: BouncingScrollPhysics(),
              child:Column(

                children: [
                  CustomText(
                    textAlign: TextAlign.start,
                    text: AppStrings.addCarTitle,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                   EditCardEditSection() ,
                ],
              ),
            ),
      ),
      bottomNavigationBar:const EditCardBottomNavSection() ,
    ));
  }
}
