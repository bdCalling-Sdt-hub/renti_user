import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_repo/sign_in_repo.dart';
import 'package:renti_user/view/screens/home/home_screen.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'inner_widget/sign_in_auth.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(SignInRepo(apiService: Get.find()));
    Get.put(SignInController(signInRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.screenUtils();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar:  CustomAppBar(
              appBarContent: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: AppStrings.signIn.tr,color: AppColors.whiteLight,fontWeight: FontWeight.w500,top: 15,fontSize: 18,),
                 TextButton(onPressed: () async{
                   // final  SharedPreferences prefres =  await SharedPreferences.getInstance();
                   // String token =  prefres.getString(SharedPreferenceHelper.userIdKey)??"";
                   // if(token.isEmpty){
                   //   Get.toNamed(AppRoute.homeScreen);
                   // }
                   //  else{}

                   Get.toNamed(AppRoute.homeScreen);

                 }, child:  const CustomText(text:"Skip",color: AppColors.whiteLight,fontWeight: FontWeight.w500,top: 15,fontSize: 18,),)

                ],
              ),
            ),
            body: GetBuilder<SignInController>(
              builder: (controller) => LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) =>
                    CustomContainer(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SignInAuth(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 CustomText(
                                  top: 24,
                                  text: AppStrings.anAcount.tr,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  left: 4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoute.signUpScreen);
                                  },
                                  child:  CustomText(
                                    top: 24,
                                    text: AppStrings.signUp.tr,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    left: 4,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            )),
      ),
    );
  }
}
