import 'package:flutter/material.dart';
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
  List<String> languageName = [
    'English',
    'English UK',
    'Hindi',
    'Spanish',
    'Japanese',
    'Chinese',
    'Dutch',
    'Korean',
    'Swedish',
    'Bangla',

  ];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar:  const CustomAppBar(appBarContent: CustomBack(text:AppStrings.selectLanguage,),),
        backgroundColor: AppColors.blueNormal,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              CustomContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                paddingHorizontal: 0,paddingVertical: 0,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 24,left: 20,bottom: 100,right: 20),
                  child: Column(
                    children: List.generate(
                      languageName.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedItem = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            width: MediaQuery.of(context).size.width,
                            decoration: ShapeDecoration(
                              color: AppColors.whiteLight,
                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(8),
                              ),
                              shadows:  const [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  blurRadius: 10,
                                  offset: Offset(0, 1),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 16, bottom: 16),
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.black12.withOpacity(.2),
                                          width: 1),
                                      color: index == selectedItem
                                          ? AppColors.blueNormal
                                          : AppColors.whiteLight,
                                    ),
                                  ),
                                  CustomText(
                                    text: languageName[index],
                                    color: AppColors.blackNormal,
                                    left: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
        ),
        bottomNavigationBar: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: CustomElevatedButton(
              onPressed: () {

              }, titleText: AppStrings.confirm),
        ),
      ),
    );
  }
}