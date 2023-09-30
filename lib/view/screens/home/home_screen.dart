import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_controller/offer_car_controller.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_repo/offer_car_repo.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_from_until_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_offer_car_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_top_section.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/drawer/custom_drawer.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import 'inner_widgets/home_luxery_car_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(OfferCarRepo(apiService: Get.find()));
    final controller = Get.put(OfferCarController(offerCarRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
    });
    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: CustomAppBar(
          appBarContent: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => scaffoldKey.currentState?.openDrawer(),
                child: const Icon(Icons.menu,
                    color: AppColors.primaryColor, size: 40),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: ()=>Get.toNamed(AppRoute.searchScreen),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.whiteLight,
                      border: Border.all(color: AppColors.whiteNormalActive),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.search,
                            size: 20, color: AppColors.whiteNormalActive),
                        CustomText(
                            text:AppStrings.searchCar,
                            color: AppColors.whiteNormalActive,
                            left: 8),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.profileDetails);
                },
                child: const CustomImage(
                    imageSrc: AppImages.profileImg,
                    imageType: ImageType.png,
                    size: 40),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<OfferCarController>(
            builder: (controller) => controller.isLoading ? const Center(
              child: CircularProgressIndicator(),
            ) :  const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTopSection(),
                SizedBox(height: 16),
                HomeFromUntilSection(),
                SizedBox(height: 24),
                HomePopularSection(),
                SizedBox(height: 24,),
                HomeOfferCarSection(),


              ],
            ),
          ),
        ),

        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),

    ) ;
  }
}
