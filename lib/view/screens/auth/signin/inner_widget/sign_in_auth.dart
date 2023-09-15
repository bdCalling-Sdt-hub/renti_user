import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/home/home_screen.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../widgets/buttons/custom_elevated_button_with_icon.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class SignInAuth extends StatefulWidget {
  const SignInAuth({super.key});
  @override
  State<SignInAuth> createState() => _SignInAuthState();
}

class _SignInAuthState extends State<SignInAuth> {

  final _formKey = GlobalKey<FormState>();
  bool isClicked = false;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Email pass auth section
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Email Text and TextField.
               const CustomText(text: AppStrings.email, bottom: 12),
              CustomTextField(
                hintText: AppStrings.enterEmail,
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

              //Password Text and TextField.
               const CustomText(
                text: AppStrings.password,
                bottom: 12,
                top: 16,
              ),
              CustomTextField(
                isPassword: true,
                textInputAction: TextInputAction.done,
                isPrefixIcon: false,
                hintText:AppStrings.enterPassword,
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

              //Forget Password Button
              GestureDetector(
                onTap: () {
                    Get.toNamed(AppRoute.forgotPasswordScreen);
                },
                child:  const Align(
                  alignment: Alignment.bottomRight,
                  child: CustomText(
                    text: AppStrings.forgetPassword,
                    fontSize: 16,
                    color: AppColors.darkBlueColor,
                    bottom: 24,
                    top: 16,
                  ),
                ),
              ),

              //Sign In button
              CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(AppStrings.successful);
                  } else {
                    print(AppStrings.failed);
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));

                },
                titleText: AppStrings.signIn,
                buttonWidth: double.maxFinite,
              ),
            ],
          ),
        ),
        //Or Text
         const Align(
          alignment: Alignment.center,
          child: CustomText(
            text: AppStrings.or,
            top: 24,
            bottom: 24,
            fontSize: 16,
          ),
        ),
        //SIgn In with Google and apple
        Row(
          children: [
            Expanded(
              child: CustomElevatedButtonWithIcon(
                onPressed: () {},
                titleText: AppStrings.google,
                iconSrc: AppIcons.googleIcon,
                imageType: ImageType.svg,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomElevatedButtonWithIcon(
                onPressed: () {},
                titleText: AppStrings.apple,
                iconSrc: AppIcons.appleIcon,
                imageType: ImageType.svg,
              ),
            ),
          ],
        ),
      ],
    );
  }
}