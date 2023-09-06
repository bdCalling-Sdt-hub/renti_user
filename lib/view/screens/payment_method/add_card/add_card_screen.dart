import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/payment_method/add_card/inner_widgets/add_card_add_section.dart';
import 'package:renti_user/view/screens/payment_method/add_card/inner_widgets/add_card_bottom_nav_section.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text_field/custom_text_field.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                text: AppStrings.addCard,
                color: AppColors.blackNormal,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                left: 14,
              )
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
                    AddCardAddSection() ,
                ],
              ),
            ),
      ),
      bottomNavigationBar: const AddCardBottomNavSection(),
    ));
  }
}
