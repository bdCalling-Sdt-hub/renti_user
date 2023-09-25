import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/term_condition_controller/term_condition_controller.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/term_condition_repo/term_condition_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_back_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(TermConditionRepo(apiService: Get.find()));
    Get.put(TermConditionController(termConditionRepo: Get.find()));
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
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        /*           FittedBox(
                      child: CustomText(text: AppStrings.rentiTitle,fontSize: 16,fontWeight: FontWeight.w500,bottom: 12,),
                    ),
                    CustomText(text: AppStrings.rentiDescription,textAlign: TextAlign.start,),
                    FittedBox(child: CustomText(text: AppStrings.rentiTitle,fontSize: 16,fontWeight: FontWeight.w500,bottom: 12,top: 16,)),
                    CustomText(text: AppStrings.rentiDescription,textAlign: TextAlign.start,),
                    FittedBox(child: CustomText(text: AppStrings.rentiTitle,fontSize: 16,fontWeight: FontWeight.w500,bottom: 12,top: 16,)),
                    CustomText(text: AppStrings.rentiDescription,textAlign: TextAlign.start,),*/


                    GetBuilder<TermConditionController>(builder: (controller) {
                      if (controller.isLoading){
                        return const Center(
                          child: CircularProgressIndicator(color: AppColors.primaryColor,),
                        );
                      } else {
                        return CustomText(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          text: controller.termConditionModel.termsCondition!.content.toString(),
                          maxLines: null,
                        );
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
