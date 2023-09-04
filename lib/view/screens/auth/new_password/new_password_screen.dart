import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_strings.dart';

import '../../../../core/route/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text_field/custom_text_field.dart';
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => NewPasswordScreenState();
}

class NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.blueNormal,
        appBar:  const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStrings.newPassword,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              CustomContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const CustomText(text: AppStrings.newPasswordRange, fontSize: 16),
                      Form(
                        key: _formKey,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //New Password Text and TextField
                            const CustomText(
                                text: AppStrings.password,
                                top: 24,
                                bottom: 12),
                            CustomTextField(
                              isPassword: true,
                              textInputAction: TextInputAction.done,
                              hintText: AppStrings.enterPassword,
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
                                text: AppStrings.confirmPassword,
                                top: 24,
                                bottom: 12),
                            CustomTextField(
                              isPassword: true,
                              textInputAction: TextInputAction.done,
                              hintText: AppStrings.enterPassword,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: CustomElevatedButton(
              onPressed: () {
                Get.offAllNamed(AppRoute.signInScreen);
              },
              titleText: AppStrings.update),
        ),
      ),
    );
  }
}