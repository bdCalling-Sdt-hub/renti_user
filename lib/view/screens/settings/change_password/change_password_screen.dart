import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/settings/change_password/change_password_controller/change_password_controller.dart';
import 'package:renti_user/view/screens/settings/change_password/change_password_repo/change_password_repo.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/container/custom_container.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ChangePasswordRepo(apiService: Get.find()));
    Get.put(ChangePasswordController(repo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      extendBody: true,
      appBar:   CustomAppBar(appBarContent: CustomBack(text:AppStrings.changePassword.tr,),),
      backgroundColor: AppColors.primaryColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => GetBuilder<ChangePasswordController>(
          builder: (controller) {
            return CustomContainer(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 24,left: 20,bottom: 100,right: 20),
                    child: Column(
                      children: [
                         CustomText(
                          textAlign: TextAlign.start,
                          text: AppStrings.changePasswordTitle.tr,
                          fontSize: 16,
                          color: AppColors.blackNormal,
                        ),
                        Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //New Password Text and TextField
                              const CustomText(
                                  text: AppStrings.currentPassword,
                                  top: 24,
                                  bottom: 12
                              ),
                              CustomTextField(
                                isPassword: true,
                                textEditingController: controller.currentPasswordController,
                                textInputAction: TextInputAction.done,
                                hintText: "Enter current password".tr,
                                suffixIconColor: AppColors.whiteNormalActive,
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
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
                              const CustomText(
                                  text: AppStrings.newPassword,
                                  top: 24,
                                  bottom: 12
                              ),
                              CustomTextField(
                                isPassword: true,
                                textEditingController: controller.newPasswordController,
                                textInputAction: TextInputAction.done,
                                hintText: "Enter new password".tr,
                                suffixIconColor: AppColors.whiteNormalActive,
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
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
                              const CustomText(
                                  text: AppStrings.confirmNewPassword,
                                  top: 24,
                                  bottom: 12),
                              CustomTextField(
                                isPassword: true,
                                textEditingController: controller.confirmPasswordController,
                                textInputAction: TextInputAction.done,
                                hintText: "Retype new password".tr,
                                suffixIconColor: AppColors.whiteNormalActive,
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.whiteNormalActive),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppStrings.notBeEmpty;
                                  } else if (value.length < 6) {
                                    return AppStrings.passwordShouldBe;
                                  } else if(controller.newPasswordController.text != controller.confirmPasswordController.text){
                                    return "Password doesn't match".tr;
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                );
          }
        ),
      ),
      bottomNavigationBar: GetBuilder<ChangePasswordController>(
        builder: (controller) => Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: controller.isSubmit ? const CustomElevatedLoadingButton() : CustomElevatedButton(
              onPressed: () {
                if(controller.formKey.currentState!.validate()){
                  controller.changePassword();
                }
              },
              titleText: AppStrings.changePassword
          ),
        ),
      ),
    ));
  }
}
