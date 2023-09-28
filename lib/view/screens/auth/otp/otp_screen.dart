import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/auth/otp/inner_widgets/otp_bottom_nav_section.dart';
import 'package:renti_user/view/screens/auth/otp/inner_widgets/otp_top_section.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';

class ForgotPassOTP extends StatefulWidget {
  const ForgotPassOTP({super.key});

  @override
  State<ForgotPassOTP> createState() => _ForgotPassOTPState();
}

class _ForgotPassOTPState extends State<ForgotPassOTP> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primaryColor,
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
                child: const SingleChildScrollView(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  child: OtpTopSection(),
                ),
              ),
        ),
        bottomNavigationBar: const OtpBottomNavSection(),
      ),
    );
  }
}