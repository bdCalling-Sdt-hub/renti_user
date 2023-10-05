import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/auth/new_password/inner_widgets/new_password_auth_section.dart';
import 'package:renti_user/view/screens/auth/new_password/inner_widgets/new_password_bottom_nav_section.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => NewPasswordScreenState();
}

class NewPasswordScreenState extends State<NewPasswordScreen> {


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