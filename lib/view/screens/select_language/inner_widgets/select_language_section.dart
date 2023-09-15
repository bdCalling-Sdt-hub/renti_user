import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/text/custom_text.dart';

class SelectLanguageSection extends StatefulWidget {
  const SelectLanguageSection({super.key});

  @override
  State<SelectLanguageSection> createState() => _SelectLanguageSectionState();
}

class _SelectLanguageSectionState extends State<SelectLanguageSection> {
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
    'Swedish',
    'Swedish',
    'Swedish',
    'Bangla',
  ];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                shadows: const [
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
                            color: Colors.black12.withOpacity(.2), width: 1),
                        color: index == selectedItem
                            ? AppColors.primaryColor
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
    );
  }
}
