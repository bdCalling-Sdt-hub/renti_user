import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/auth/signup/inner_widgets/bottom_nav_section.dart';
import 'package:renti_user/view/screens/auth/signup_continue/inner_widgets/sign_up_continue_auth_section.dart';
import 'package:renti_user/view/screens/auth/signup_continue/inner_widgets/sign_up_continue_bottom_nav_section.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text_field/custom_text_field.dart';

class SignUpContinueScreen extends StatefulWidget {
  const SignUpContinueScreen({super.key});

  @override
  State<SignUpContinueScreen> createState() => _SignUpContinueScreenState();
}

class _SignUpContinueScreenState extends State<SignUpContinueScreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.blueNormal,
        appBar: const CustomAppBar(appBarContent: CustomBack(text: AppStrings.signUp),),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              CustomContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SignUpContinueAuthSection(),
                ),
              ),
        ),
        bottomNavigationBar:SignUpContinueBottomNavSection() ,
      ),
    );
  }
}