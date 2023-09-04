import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_strings.dart';

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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
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
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
              physics: const BouncingScrollPhysics(),
              child:Column(

                children: [
                    const CustomText(
                      textAlign: TextAlign.start,
                      text: AppStrings.addCarTitle,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  Form(
                    key: _formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //New Password Text and TextField
                        const CustomText(
                            text: AppStrings.cardNumber,
                            top: 16,
                            bottom: 12),
                        CustomTextField(
                          textInputAction: TextInputAction.done,
                          hintText: '1234 1234 1234 1234 ',
                          suffixIconColor: AppColors.whiteNormalActive,
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteNormalActive),
                        ),

                        const CustomText(
                            text: AppStrings.expireDate,
                            top: 16,
                            bottom: 12),
                        CustomTextField(
                          textInputAction: TextInputAction.done,
                          hintText: AppStrings.mm_yy,
                          suffixIconColor: AppColors.whiteNormalActive,
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteNormalActive),
                        ),
                        const CustomText(
                            text: AppStrings.cvv,
                            top: 16,
                            bottom: 12),
                        CustomTextField(
                          textInputAction: TextInputAction.done,
                          hintText: AppStrings.enterCvv,
                          suffixIconColor: AppColors.whiteNormalActive,
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteNormalActive),
                        ),
                        const CustomText(
                            text: AppStrings.accountHolderName,
                            top: 16,
                            bottom: 12),
                        CustomTextField(
                          textInputAction: TextInputAction.done,
                          hintText: AppStrings.enterName,
                          suffixIconColor: AppColors.whiteNormalActive,
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteNormalActive),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: CustomElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoute.paymentMethod);
            },
            titleText: AppStrings.addCard),
      ),
    ));
  }
}
