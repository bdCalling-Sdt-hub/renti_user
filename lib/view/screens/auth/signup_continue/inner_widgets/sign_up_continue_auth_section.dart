import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class SignUpContinueAuthSection extends StatefulWidget {

  const SignUpContinueAuthSection({
    super.key,
  });

  @override
  State<SignUpContinueAuthSection> createState() => _SignUpContinueAuthSectionState();
}

class _SignUpContinueAuthSectionState extends State<SignUpContinueAuthSection> {
  
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {

    return GetBuilder<SignUpController>(
      builder: (controller) => Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: AppStrings.phoneNumber, bottom: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.whiteLight,
                      border: Border.all(
                          color: AppColors.whiteDark,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    child: Row(
                      children: [
                        const CustomImage(
                            imageSrc: AppIcons.flafMaxico,
                            imageType: ImageType.svg,
                            size: 40
                        ),
                        CustomText(
                            text: controller.phoneCode,
                            left: 10,
                            color: AppColors.blackNormal
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    textEditingController: controller.phoneNumberController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    hintText: AppStrings.enterPhoneNumber,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteNormalActive),
                  ),
                ),
              ],
            ),

            //Address Text and TextField
            const CustomText(text: AppStrings.address, top: 16, bottom: 12),
            CustomTextField(
              textEditingController: controller.addressController,
              hintText: AppStrings.enterAddress,
              maxLines: 4,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive
              ),
            ),
            const CustomText(text: AppStrings.creditCardNum, bottom: 12, top: 16),
            CustomTextField(
              hintText: AppStrings.enterCreditCardNum,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
            ),

            //Confirm Password Text and TextField
            const CustomText(
                text: AppStrings.expireDate,
                bottom: 12,
                top: 16),
            CustomTextField(
              hintText: AppStrings.mm_yy,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
            ),
            const CustomText(
                text: AppStrings.cvv,
                bottom: 12,
                top: 16),
            CustomTextField(
              hintText: AppStrings.enterCVV,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(
                buttonWidth: MediaQuery.of(context).size.width,
                onPressed: () => setDataToLocalStore(
                  controller,
                  phoneNumber: "${controller.phoneCode} ${controller.phoneNumberController.text}",
                  address: controller.addressController.text
                ),
                titleText: "Continue"
            )
          ],
        ),
      ),
    );
  }

  setDataToLocalStore(SignUpController signUpController, {required String phoneNumber, required String address}) async{

    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.phoneNumber, phoneNumber);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.address, address);

    print("phone number: $phoneNumber");
    print("address: $address");

    Get.toNamed(AppRoute.kycScreen);
  }
}
