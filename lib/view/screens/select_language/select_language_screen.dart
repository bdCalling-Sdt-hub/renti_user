import 'package:flutter/material.dart';
import 'package:renti_user/view/screens/select_language/inner_widgets/select_language_section.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/buttons/custom_back_button.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/container/custom_container.dart';
import '../../widgets/text/custom_text.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStrings.selectLanguage,
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
              padding: EdgeInsets.only(
                  top: 24, left: 20,bottom: 100, right: 20),
              child: SelectLanguageSection(),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: CustomElevatedButton(
              onPressed: () {}, titleText: AppStrings.confirm),
        ),
      ),
    );
  }
}
