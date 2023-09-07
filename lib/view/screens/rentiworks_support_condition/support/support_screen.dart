import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(

      backgroundColor: AppColors.blueNormal,
      appBar: const CustomAppBar(
        appBarContent: CustomBack(
          text:AppStrings.support,
        ),
      ),
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:  const SingleChildScrollView(

                physics: BouncingScrollPhysics(),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: CustomText(text: AppStrings.rentiTitle,fontSize: 16,fontWeight: FontWeight.w500,bottom: 12,),
                    ),
                    CustomText(text: AppStrings.rentiDescription,textAlign: TextAlign.start,),
                    FittedBox(child: CustomText(text: AppStrings.rentiTitle,fontSize: 16,fontWeight: FontWeight.w500,bottom: 12,top: 16,)),
                    CustomText(text: AppStrings.rentiDescription,textAlign: TextAlign.start,),
                    FittedBox(child: CustomText(text: AppStrings.rentiTitle,fontSize: 16,fontWeight: FontWeight.w500,bottom: 12,top: 16,)),
                    CustomText(text: AppStrings.rentiDescription,textAlign: TextAlign.start,),
                  ],
                )
              ),
            ),
      ),
    ));
  }
}
