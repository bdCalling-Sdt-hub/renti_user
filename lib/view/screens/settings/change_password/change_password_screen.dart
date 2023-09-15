import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/settings/change_password/inner_widgets/change_password_auth_section.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text_field/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      extendBody: true,
      appBar:  const CustomAppBar(appBarContent: CustomBack(text:AppStrings.changePassword,),),
      backgroundColor: AppColors.primaryColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              paddingHorizontal: 0,paddingVertical: 0,
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

            }, titleText: AppStrings.changePassword),
      ),
    ),

    );
  }
}
