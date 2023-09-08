import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/splash/inner_widgets/splash_bottom_section.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    DeviceUtils.splashUtils();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: .5,
                    image: AssetImage(AppImages.splashBgImage),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(AppColors.blueNormal, BlendMode.dstATop),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    CustomImage(
                        imageSrc: AppImages.splashLogo,
                        imageType: ImageType.png,
                        size: 200),
                    Spacer(),
                    SplashBottomSection()
                  ],
                ),
              ),
        ),

      ),
    );
  }
}