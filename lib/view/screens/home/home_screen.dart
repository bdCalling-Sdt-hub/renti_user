import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/home/home_controller/home_controller.dart';
import 'package:renti_user/view/screens/home/home_repo/home_repo.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_controller/all_cars_controller.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_repo/all_cars_repo.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_from_until_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/home_luxury_car_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_car_section.dart';
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

    DeviceUtils.screenUtils();

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(HomeRepo(apiService: Get.find()));
    final controller = Get.put(HomeController(homeRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: GetBuilder<HomeController>(
        builder: (controller) => controller.isLoading ? const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ) : Scaffold(
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
                  child: Container(
                    height: 40, width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: controller.profileImage.isEmpty ? const DecorationImage(
                        image: AssetImage("assets/images/user.png"),
                        fit: BoxFit.fill
                      ) : DecorationImage(
                          image: NetworkImage(controller.profileImage),
                          fit: BoxFit.fill
                      )
                    )
                  )
                ),
              ],
            ),
          ),
          body: const SingleChildScrollView(
            padding: EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTopSection(),
                SizedBox(height: 16),
                HomeFromUntilSection(),
                SizedBox(height: 24),
                HomePopularSection(),
                SizedBox(height: 24,),
                HomeLuxuryCarSection()
              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
        ),
      ),
    ) ;
  }
}
