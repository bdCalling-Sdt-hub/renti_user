import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/otp/inner_widgets/otp_bottom_nav_section.dart';
import 'package:renti_user/view/screens/auth/otp/inner_widgets/otp_top_section.dart';
import 'package:renti_user/view/screens/auth/otp/otp_controller/otp_controller.dart';
import 'package:renti_user/view/screens/auth/otp/otp_repo/otp_repo.dart';
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
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(VerifyOtpRepo(apiService: Get.find()));
    Get.put(OtpController(verifyOtpRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.authUtils();
    super.dispose();
  }

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