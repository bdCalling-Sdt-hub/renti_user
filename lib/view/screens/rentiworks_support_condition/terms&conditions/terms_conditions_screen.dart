import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/terms_conditions_controller/terms_conditions_controller.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/terms_conditions_repo/terms_conditions_repo.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(TermsConditionsRepo(apiService: Get.find()));
    Get.put(TermsConditionsController(termsConditionsRepo: Get.find()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(
        appBarContent: CustomBack(
          text:AppStrings.termsConditions,
        ),
      ),
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:   SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FittedBox(
                    //   child: CustomText(text: AppStrings.rentiTitle,fontSize: 16,fontWeight: FontWeight.w500,bottom: 12,),
                    // ),
                    // CustomText(text: AppStrings.rentiDescription,textAlign: TextAlign.start,),
                    // FittedBox(child: CustomText(text: AppStrings.rentiTitle,fontSize: 16,fontWeight: FontWeight.w500,bottom: 12,top: 16,)),
                    // CustomText(text: AppStrings.rentiDescription,textAlign: TextAlign.start,),
                    // FittedBox(child: CustomText(text: AppStrings.rentiTitle,fontSize: 16,fontWeight: FontWeight.w500,bottom: 12,top: 16,)),
                    // CustomText(text: AppStrings.rentiDescription,textAlign: TextAlign.start,),

                    GetBuilder<TermsConditionsController>(builder: (controller) {
                      if (controller.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Html(data: controller.termsConditionsModel.termsCondition!.content.toString());
                      }
                    })
                  ],
                ),
              ),
            ),
      ),
    ));
  }
}
