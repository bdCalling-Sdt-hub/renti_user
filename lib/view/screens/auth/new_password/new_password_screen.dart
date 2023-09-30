import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/new_password/inner_widgets/new_password_auth_section.dart';
import 'package:renti_user/view/screens/auth/new_password/inner_widgets/new_password_bottom_nav_section.dart';
import 'package:renti_user/view/screens/auth/new_password/new_password_controller/new_password_controller.dart';
import 'package:renti_user/view/screens/auth/new_password/new_password_repo/new_password_repo.dart';

import '../../../../core/route/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text_field/custom_text_field.dart';
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => NewPasswordScreenState();
}

class NewPasswordScreenState extends State<NewPasswordScreen> {

  @override
  void initState() {
    DeviceUtils.authUtils();

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(NewPasswordRepo(apiService: Get.find()));
    Get.put(NewPasswordController(newPasswordRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {

    DeviceUtils.screenUtils();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primaryColor,
        appBar:  const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStrings.newPassword,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              CustomContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       CustomText(text: AppStrings.newPasswordRange, fontSize: 16),
                     NewPasswordAuthSection(),
                    ],
                  ),
                ),
              ),
        ),
        bottomNavigationBar:const NewPassWordBottomNavSection(),
      ),
    );
  }
}