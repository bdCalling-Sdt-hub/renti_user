import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class SignUpAuthSection extends StatefulWidget {

  const SignUpAuthSection({super.key});

  @override
  State<SignUpAuthSection> createState() => _SignUpAuthSectionState();
}

class _SignUpAuthSectionState extends State<SignUpAuthSection> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Full name And TextField
            const CustomText(text: AppStrings.fullName, bottom: 12),
            CustomTextField(
              textEditingController: controller.fullNameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              hintText: "Enter your full name",
              inputTextStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.blackNormal),
              hintStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.whiteNormalActive),
            ),
            const CustomText(text: AppStrings.email, top: 16, bottom: 12),
            CustomTextField(
              textEditingController: controller.emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              inputTextStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.blackNormal),
              hintText: "Enter your email",
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.notBeEmpty;
                } else if (!value.contains(RegExp('\@'))) {
                  return AppStrings.enterValidEmail;
                } else {
                  return null;
                }
              },
            ),
            const CustomText(text: AppStrings.gender, top: 16, bottom: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(controller.genderList.length, (index) => GestureDetector(
                onTap: () => controller.changeGender(index),
                child: Row(
                  children: [
                    Container(
                      height: 20, width: 20,
                      padding: const EdgeInsetsDirectional.all(0.5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: AppColors.blackNormal.withOpacity(0.2)),
                        shape: BoxShape.circle
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: index == controller.selectedGender ? AppColors.darkBlueColor : Colors.transparent,
                            shape: BoxShape.circle
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      controller.genderList[index],
                      style: GoogleFonts.poppins(
                        color: AppColors.blackNormal,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
              )),
            ),
            const CustomText(
                text: AppStrings.dateOfBirth, top: 16, bottom: 12),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    textEditingController: controller.dateController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputTextStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackNormal,
                    ),
                    hintText: AppStrings.dd,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    textEditingController: controller.monthController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputTextStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackNormal,
                    ),
                    hintText: AppStrings.mm,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    textEditingController: controller.yearController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputTextStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackNormal,
                    ),
                    hintText: AppStrings.yy,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive,
                    ),
                  ),
                ),
              ],
            ),

            //Password Text and TextField
            const CustomText(
                text: AppStrings.password, bottom: 12, top: 16),
            CustomTextField(
              isPassword: true,
              hintText: "Enter your password",
              keyboardType: TextInputType.visiblePassword,
              textEditingController: controller.passwordController,
              textInputAction: TextInputAction.next,
              inputTextStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.blackNormal,
              ),
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
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
            const CustomText(text: AppStrings.confirmPassword, bottom: 12, top: 16),
            CustomTextField(
              isPassword: true,
              textInputAction: TextInputAction.done,
              hintText: "Enter confirm password",
              keyboardType: TextInputType.visiblePassword,
              textEditingController: controller.confirmPasswordController,
              inputTextStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.blackNormal,
              ),
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
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
            const SizedBox(height: 24),
            CustomElevatedButton(
              buttonWidth: MediaQuery.of(context).size.width,
              onPressed: () => setDataToLocalStore(
                controller,
                fullName: controller.fullNameController.text,
                email: controller.emailController.text,
                gender: controller.genderList[controller.selectedGender].toString(),
                dob: "${controller.dateController.text}/${controller.monthController.text}/${controller.yearController.text}",
                password: controller.confirmPasswordController.text
              ),
              titleText: "Continue"
            )
          ],
        ),
      ),
    );
  }

  setDataToLocalStore(SignUpController signUpController, {required String fullName, required String email, required String gender, required String dob, required String password}) async{

    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.fullName, fullName);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.email, email);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.gender, gender);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.dob, dob);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.password, password);

    print("full name: $fullName");
    print("email: $email");
    print("gender: $gender");
    print("dob: $dob");
    print("password: $password");

    Get.toNamed(AppRoute.signUpContinueScreen);
  }
}
