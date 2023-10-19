import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forget_password_controller/forget_password_controller.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forget_password_repo/forget_password_repo.dart';
import 'package:renti_user/view/screens/auth/forgot_password/inner_widgets/fogot_password_top_section.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primaryColor,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStrings.forgetPassword,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => GetBuilder<ForgetPasswordController>(
            builder: (controller) {
              return CustomContainer(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const SingleChildScrollView(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
                      physics: BouncingScrollPhysics(),
                      child: ForgotPasswordTopSection(),
                    ),
                  );
            }
          ),
        ),
        bottomNavigationBar: GetBuilder<ForgetPasswordController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: controller.isSubmit ? const CustomElevatedLoadingButton() : CustomElevatedButton(
                  buttonWidth: MediaQuery.of(context).size.width,
                  onPressed: () => controller.verifyEmail(),
                  titleText: "Verify Email"
              )
            );
          }
        ),
    ));
  }
}
