import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_controller/about_controller.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_repo/about_repo.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/private_policy_controller/private_policy_controller.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/private_policy_repo/private_policy_repo.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';

class PrivatePolicyScreen extends StatefulWidget {
  const PrivatePolicyScreen({super.key});

  @override
  State<PrivatePolicyScreen> createState() => _PrivatePolicyScreenState();
}

class _PrivatePolicyScreenState extends State<PrivatePolicyScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(PrivatePolicyRepo(apiService: Get.find()));
    Get.put(PrivatePolicyController(privatePolicyRepo: Get.find()));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(
        appBarContent: CustomBack(
          text: AppStrings.privacyPolicy,
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

                    GetBuilder<PrivatePolicyController>(builder: (controller) {
                      if (controller.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return CustomText(
                          textAlign: TextAlign.start,
                          text: controller.privatePolicyModel.privacyPolicy!.content.toString(),
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
