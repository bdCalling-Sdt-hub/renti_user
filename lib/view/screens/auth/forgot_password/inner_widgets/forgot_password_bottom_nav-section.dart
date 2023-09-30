import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forgot_password_controller/forgot_password_controller.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class ForgotPasswordBottomNavSection extends StatefulWidget {
  const ForgotPasswordBottomNavSection({super.key});

  @override
  State<ForgotPasswordBottomNavSection> createState() => _ForgotPasswordBottomNavSectionState();
}

class _ForgotPasswordBottomNavSectionState extends State<ForgotPasswordBottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller){
        return  CustomElevatedButton(
            onPressed: () {
              controller.forgetPasswordResponse();
            },
            titleText: "Continue"
        );
      },
    );
  }
}
