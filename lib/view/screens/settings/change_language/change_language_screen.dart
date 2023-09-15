import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/settings/change_language/inner_widgets/change_language_bottom_nav_section.dart';
import 'package:renti_user/view/screens/settings/change_language/inner_widgets/change_language_section.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStrings.changeLanguage,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              CustomContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            paddingHorizontal: 0,
            paddingVertical: 0,
            child: const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding:
                  EdgeInsets.only(top: 24, left: 20, bottom: 100, right: 20),
              child: ChangeLanguageSection(),
            ),
          ),
        ),
        bottomNavigationBar:const ChangeLanguageBottomNavSection(),
      ),
    );
  }
}
