import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';

class ForgotPassOTP extends StatelessWidget {
  const ForgotPassOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.blueNormal,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStrings.otp,
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
                      const CustomText(
                        text: AppStrings.optCodeTitle,
                        fontSize: 16,
                        bottom: 24,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundColor: AppColors.blueNormal,
                          maxRadius: 50,
                          child: CustomImage(imageSrc: AppIcons.otpLogo),
                        ),
                      ),
                      const SizedBox(height: 40),
                      PinCodeTextField(
                        length: 6,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        textStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackNormal),
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            disabledColor: Colors.blue,
                            fieldHeight: 56,
                            fieldWidth: 44,
                            activeColor: AppColors.whiteNormalActive,
                            inactiveColor: AppColors.whiteNormalActive,
                            activeFillColor: AppColors.whiteNormalActive,
                            inactiveFillColor: AppColors.whiteNormalActive,
                            selectedFillColor: AppColors.whiteNormalActive,
                            selectedColor: AppColors.whiteNormalActive),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: false,
                        onCompleted: (v) {},
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomText(text:AppStrings.notGetOtp),
                          GestureDetector(
                            onTap: () {},
                            child: const CustomText(
                              text: AppStrings.resend,
                              color: AppColors.blueNormal,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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

              },
              titleText: AppStrings.verify),
        ),
      ),
    );
  }
}