import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final _formKey = GlobalKey<FormState>();
  int _radioGroupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Full name And TextField
          const CustomText(
              text: AppStrings.fullName, bottom: 12),
          CustomTextField(
            hintText: AppStrings.typeFullName,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteNormalActive),
          ),

          //Email and TextField
          const CustomText(
            text: AppStrings.email,
            top: 16,
            bottom: 12,
          ),
          CustomTextField(
            textInputAction: TextInputAction.done,
            hintText: AppStrings.typeFullName,
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

          //Gender Selection
          const CustomText(text: AppStrings.gender, top: 16),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    fillColor: const MaterialStatePropertyAll(
                        AppColors.primaryColor),
                    value: 1,
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(
                            () {
                          _radioGroupValue = value!;
                        },
                      );
                    },
                  ),
                  const CustomText(
                    text: AppStrings.male,
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    fillColor: const MaterialStatePropertyAll(
                        AppColors.primaryColor),
                    value: 2,
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value!;
                      });
                    },
                  ),
                  const CustomText(
                    text: AppStrings.female,
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    activeColor:Colors.red,
                    fillColor: const MaterialStatePropertyAll(
                        AppColors.primaryColor),
                    value: 3,
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value!;
                      });
                    },
                  ),
                  const CustomText(
                    text: AppStrings.others,
                  )
                ],
              ),
            ],
          ),
          //Date Of Birth
          const CustomText(
              text: AppStrings.dateOfBirth, top: 8, bottom: 12),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
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
            hintText: AppStrings.typeHere,
            keyboardType: TextInputType.visiblePassword,
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

          //Confirm Password Text and TextField
          const CustomText(
              text: AppStrings.confirmPassword,
              bottom: 12,
              top: 16),
          CustomTextField(
            isPassword: true,
            textInputAction: TextInputAction.done,
            hintText: AppStrings.typeHere,
            keyboardType: TextInputType.visiblePassword,
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
        ],
      ),
    );
  }
}
