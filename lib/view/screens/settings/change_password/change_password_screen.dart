import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text_field/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      extendBody: true,
      appBar:  const CustomAppBar(appBarContent: CustomBack(text:AppStrings.changePassword,),),
      backgroundColor: AppColors.blueNormal,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              paddingHorizontal: 0,paddingVertical: 0,
              child:  SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 24,left: 20,bottom: 100,right: 20),
                child: Column(

                  children: [
                    const CustomText(
                      textAlign: TextAlign.start,
                      text: AppStrings.changePasswordTitle,
                      fontSize: 16,
                      color: AppColors.blackNormal,

                    ),
                    Form(
                      key: _formKey,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //New Password Text and TextField
                          const CustomText(
                              text: AppStrings.currentPassword,
                              top: 24,
                              bottom: 12),
                          CustomTextField(
                            isPassword: true,
                            textInputAction: TextInputAction.done,
                            hintText: 'Old Password',
                            suffixIconColor: AppColors.whiteNormalActive,
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteNormalActive),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.notBeEmpty;
                              } else if (value.length < 6) {
                                return AppStrings.passwordShouldBe;
                              } else {
                                return null;
                              }
                            },
                          ),

                          //Confirm Password Text and TextField
                          const CustomText(
                              text: AppStrings.newPassword,
                              top: 24,
                              bottom: 12),
                          CustomTextField(
                            isPassword: true,
                            textInputAction: TextInputAction.done,
                            hintText: AppStrings.newPassword,
                            suffixIconColor: AppColors.whiteNormalActive,
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteNormalActive),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.notBeEmpty;
                              } else if (value.length < 6) {
                                return AppStrings.passwordShouldBe;
                              } else {
                                return null;
                              }
                            },
                          ),
                          const CustomText(
                              text: AppStrings.confirmNewPassword,
                              top: 24,
                              bottom: 12),
                          CustomTextField(
                            isPassword: true,
                            textInputAction: TextInputAction.done,
                            hintText: AppStrings.confirmPassword,
                            suffixIconColor: AppColors.whiteNormalActive,
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteNormalActive),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.notBeEmpty;
                              } else if (value.length < 6) {
                                return AppStrings.passwordShouldBe;
                              } else {
                                return null;
                              }
                            },
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoute.forgotPasswordScreen);
                            },
                            child: const CustomText(
                              text: AppStrings.forgetPassword,
                              color: AppColors.blueDark,
                              top: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ),
      ),
      bottomNavigationBar: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: CustomElevatedButton(
            onPressed: () {

            }, titleText: AppStrings.changePassword),
      ),
    ),

    );
  }
}
