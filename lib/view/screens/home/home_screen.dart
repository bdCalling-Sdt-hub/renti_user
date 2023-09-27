import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_controller/all_cars_controller.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_model/all_cars_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_repo/all_cars_repo.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_from_until_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/home_all_car_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_car_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_controller/home_popular_controller.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_model/home_popular_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_repo/home_popular_repo.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_top_section.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/drawer/custom_drawer.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {

    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(PopularCarRepo(apiService: Get.find()));
    Get.put(PopularCarController(popularCarRepo: Get.find()));
    Get.put(AllCarsRepo(apiService: Get.find()));
    Get.put(AllCarsController(allCarsRepo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<PopularCarController>(
        builder: (controller) {
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
              body:  SingleChildScrollView(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeTopSection(),
                    const SizedBox(height: 16),
                    const HomeFromUntilSection(),
                    const SizedBox(height: 24),
                    HomePopularSection(popularCarModel: PopularCarModel()),
                    const SizedBox(height: 24,),
                    HomeAllCarSection(allCarsModel: AllCarsModel(),)
                    
                  
                  ],
                ),
              ),

              bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),

          );
        }
      ),
    ) ;
  }
}
