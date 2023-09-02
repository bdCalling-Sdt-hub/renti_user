import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import '../../../utils/app_images.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/text/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: .6,
                    image: AssetImage(AppImages.splashBgImage),
                    fit: BoxFit.fill,
                    colorFilter:
                    ColorFilter.mode(AppColors.blueNormal, BlendMode.dstATop),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    const CustomImage(
                        imageSrc: AppImages.splashLogo,
                        imageType: ImageType.png,
                        size: 200),
                    const Spacer(),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.selectLanguageScreen);
                          },
                          child:  const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: AppStrings.lanmguageName,
                                color: AppColors.whiteLight,
                                fontSize: 16,
                                right: 8,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColors.whiteLight,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomElevatedButton(
                          onPressed: () {
                              Get.toNamed(AppRoute.signInScreen);
                          },
                          titleText: AppStrings.getStarted,
                          buttonWidth: double.maxFinite,
                          buttonColor: AppColors.whiteLight,
                          titleColor: AppColors.blueNormal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}