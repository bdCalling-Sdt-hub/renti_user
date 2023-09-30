import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/settings/change_password/change_password_controller/change_password_controller.dart';
import 'package:renti_user/view/screens/settings/change_password/change_password_repo/change_password_repo.dart';
import 'package:renti_user/view/screens/settings/change_password/inner_widgets/change_password_auth_section.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
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
    DeviceUtils.authUtils();

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ChangePasswordRepo(apiService: Get.find()));
    Get.put(ChangePasswordController(changePasswordRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {

    DeviceUtils.screenUtils();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      builder: (controller){
        return SafeArea(child: Scaffold(
          extendBody: true,
          appBar:  const CustomAppBar(appBarContent: CustomBack(text:AppStrings.changePassword,),),
          backgroundColor: AppColors.primaryColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                CustomContainer(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:  const SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 24,left: 20,bottom: 100,right: 20),
                      child: Column(

                        children: [
                          CustomText(
                            textAlign: TextAlign.start,
                            text: AppStrings.changePasswordTitle,
                            fontSize: 16,
                            color: AppColors.blackNormal,

                          ),
                          ChangePasswordAuthSection()
                        ],
                      )
                  ),
                ),
          ),
          bottomNavigationBar: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: CustomElevatedButton(
                onPressed: () {
                  controller.changePasswordResponse();
                }, titleText: AppStrings.changePassword),
          ),
        ),

        );
      },
    );
  }
}
