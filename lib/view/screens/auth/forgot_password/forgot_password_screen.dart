
import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_strings.dart';
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
