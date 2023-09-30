
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forgot_password_controller/forgot_password_controller.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forgot_password_repo/forgot_password_repo.dart';
import 'package:renti_user/view/screens/auth/forgot_password/inner_widgets/fogot_password_top_section.dart';
import 'package:renti_user/view/screens/auth/forgot_password/inner_widgets/forgot_password_bottom_nav-section.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  @override
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ForgetPasswordRepo(apiService: Get.find()));
    Get.put(ForgetPasswordController(forgetPasswordRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.authUtils();
    ForgetPasswordController(forgetPasswordRepo: Get.find()).email.dispose();
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
            text: AppStrings.forgetPassword,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              CustomContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ForgotPasswordTopSection(),
                ),
              ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: ForgotPasswordBottomNavSection(),
      ),
    ));
  }
}
