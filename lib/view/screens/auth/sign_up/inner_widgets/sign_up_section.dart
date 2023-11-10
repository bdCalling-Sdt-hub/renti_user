import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            CustomText(text: "Full Name".tr, bottom: 12),
            CustomTextField(
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return AppStrings.notBeEmpty.tr;
                }

                return null;
              },
              textEditingController: controller.fullNameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              hintText: "Enter your full name".tr,
              inputTextStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackNormal),
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteNormalActive),
            ),
            CustomText(text: AppStrings.email.tr, top: 16, bottom: 12),
            CustomTextField(
              textEditingController: controller.emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              inputTextStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackNormal),
              hintText: "Enter your email".tr,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.notBeEmpty.tr;
                } else if (!value.contains(RegExp('\@'))) {
                  return AppStrings.enterValidEmail.tr;
                } else {
                  return null;
                }
              },
            ),
            CustomText(text: AppStrings.gender.tr, top: 16, bottom: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  controller.genderList.length,
                  (index) => GestureDetector(
                        onTap: () => controller.changeGender(index),
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              padding: const EdgeInsetsDirectional.all(0.5),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: AppColors.blackNormal
                                          .withOpacity(0.2)),
                                  shape: BoxShape.circle),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: index == controller.selectedGender
                                        ? AppColors.darkBlueColor
                                        : Colors.transparent,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              controller.genderList[index].tr,
                              style: GoogleFonts.poppins(
                                  color: AppColors.blackNormal,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )),
            ),
            CustomText(text: AppStrings.dateOfBirth.tr, top: 16, bottom: 12),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9-]")),
                      LengthLimitingTextInputFormatter(2),
                      DayFormatter(),
                    ],
                    textEditingController: controller.dateController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputTextStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackNormal,
                    ),
                    hintText: "DD".tr,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.notBeEmpty.tr;
                      } else if (value.length > 2) {
                        return "Please enter valid date".tr;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9-]")),
                      LengthLimitingTextInputFormatter(2),
                      MonthFormatter(),
                    ],
                    textEditingController: controller.monthController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputTextStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackNormal,
                    ),
                    hintText: "MM".tr,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.notBeEmpty.tr;
                      } else if (value.length > 2) {
                        return "Please enter valid month".tr;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9-]")),
                      LengthLimitingTextInputFormatter(4),
                      YearFormatter(),
                    ],
                    textEditingController: controller.yearController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputTextStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackNormal,
                    ),
                    hintText: "YYYY".tr,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.notBeEmpty.tr;
                      } else if (value.length > 4) {
                        return "Please enter valid year".tr;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),

            //Password Text and TextField
            CustomText(text: AppStrings.password.tr, bottom: 12, top: 16),
            CustomTextField(
              isPassword: true,
              hintText: "Enter your password".tr,
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
                  return AppStrings.notBeEmpty.tr;
                } else if (value.length < 6) {
                  return AppStrings.passwordShouldBe.tr;
                } else {
                  return null;
                }
              },
            ),
            CustomText(
                text: AppStrings.confirmPassword.tr, bottom: 12, top: 16),
            CustomTextField(
              isPassword: true,
              textInputAction: TextInputAction.done,
              hintText: "Enter confirm password".tr,
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
                  return AppStrings.notBeEmpty.tr;
                } else if (value.length < 6) {
                  return AppStrings.passwordShouldBe.tr;
                } else if (controller.passwordController.text !=
                    controller.confirmPasswordController.text) {
                  return "Doesn't match password".tr;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(
                buttonWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setDataToLocalStore(controller,
                        fullName: controller.fullNameController.text,
                        email: controller.emailController.text,
                        gender: controller.genderList[controller.selectedGender]
                            .toString(),
                        dob:
                            "${controller.dateController.text}/${controller.monthController.text}/${controller.yearController.text}",
                        password: controller.confirmPasswordController.text);

                    Get.toNamed(AppRoute.signUpContinueScreen);
                  }
                },
                titleText: "Continue".tr)
          ],
        ),
      ),
    );
  }

  setDataToLocalStore(SignUpController signUpController,
      {required String fullName,
      required String email,
      required String gender,
      required String dob,
      required String password}) async {
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.fullName, fullName);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.email, email);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.gender, gender);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.dob, dob);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.password, password);

    print("full name: $fullName");
    print("email: $email");
    print("gender: $gender");
    print("dob: $dob");
    print("password: $password");
  }
}

class DayFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue prevText, TextEditingValue currText) {
    int selectionIndex;
    // Get the previous and current input strings
    String pText = prevText.text;
    String cText = currText.text;
    // Abbreviate lengths
    int cLen = cText.length;
    int pLen = pText.length;

    if (cLen == 1) {
      // Can only be 0, 1, 2 or 3
      if (int.parse(cText) > 3) {
        // Remove char
        cText = '';
      }
    } else if (cLen == 2 && pLen == 1) {
      // Days cannot be greater than 31
      int dd = int.parse(cText.substring(0, 2));
      if (dd == 0 || dd > 31) {
        // Remove char
        cText = cText.substring(0, 1);
      } else {
        // Add a / char
      }
    }

    selectionIndex = cText.length;
    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class MonthFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue prevText, TextEditingValue currText) {
    String cText = currText.text;
    int cLen = cText.length;

    if (cLen == 1) {
      // If the input has only one character, it can only be 0, 1, 2, or 3.
      if (int.tryParse(cText) == null || int.parse(cText) > 3) {
        // Invalid input, remove the character.
        return TextEditingValue(
          text: '',
          selection: TextSelection.collapsed(offset: 0),
        );
      }
    } else if (cLen == 2) {
      // If the input has exactly 2 characters, validate the month.
      int? mm = int.tryParse(cText);
      if (mm == null || mm < 1 || mm > 12) {
        // Invalid month, keep only the first character.
        return TextEditingValue(
          text: cText.substring(0, 1),
          selection: TextSelection.collapsed(offset: 1),
        );
      }
    }

    // If the input is valid, allow it to continue.
    return currText;
  }
}

class YearFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue prevText, TextEditingValue currText) {
    // Get the previous and current input strings
    String pText = prevText.text;
    String cText = currText.text;

    // Abbreviate lengths
    int cLen = cText.length;
    int pLen = pText.length;

    if (cLen == 5 && pLen == 4) {
      // User has entered a complete 4-digit year, do not modify
      return currText;
    } else if (cLen == 1) {
      // Ensure the first character is within 1-2 (i.e., 19 or 20)
      int y1 = int.parse(cText);
      if (y1 < 1 || y1 > 2) {
        // Remove the first character
        cText = '';
      }
    } else if (cLen == 2) {
      // Ensure the first two characters are within 19 or 20
      int y1 = int.parse(cText.substring(0, 2));
      if (y1 < 19 || y1 > 20) {
        // Remove the second character
        cText = cText.substring(0, 1);
      }
    } else if (cLen > 4) {
      // User has entered more than 4 digits, truncate it
      cText = cText.substring(0, 4);
    }

    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: cText.length),
    );
  }
}
