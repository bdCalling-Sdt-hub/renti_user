import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_controller/about_controller.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_repo/about_repo.dart';
import '../../../../service/api_service.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(AboutRepo(apiService: Get.find()));
    Get.put(AboutController(aboutRepo: Get.find()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(
        appBarContent: CustomBack(
          text: AppStrings.aboutUs,
        ),
      ),
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:   SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
                physics: const BouncingScrollPhysics(),
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

                    GetBuilder<AboutController>(builder: (controller) {
                      if (controller.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Html(data: controller.aboutModel.about!.content.toString());
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
