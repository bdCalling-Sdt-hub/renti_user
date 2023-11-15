import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/home/home_controller/home_controller.dart';
import 'package:renti_user/view/screens/home/home_repo/home_repo.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_car_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_offer_car/home_offer_car_section.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_top_section.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_repo/profile_details_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/drawer/custom_drawer.dart';
import 'package:renti_user/view/widgets/error_widget/no_data_found_widget.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();


 // late ProfileDetailsController  profileController;

  @override
  void initState() {

    DeviceUtils.screenUtils();
    Get.put(ProfileDetailsRepo(apiService: Get.find()));
    Get.put(ProfileDetailsController(profileDetailsRepo: Get.find()));
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
        builder: (controller) =>  Scaffold(
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
                      margin:  const EdgeInsets.symmetric(horizontal: 16),
                      padding:
                       const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.whiteLight,
                        border: Border.all(color: AppColors.whiteNormalActive),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:  Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.search,
                              size: 20, color: AppColors.whiteNormalActive),
                          CustomText(
                              text:AppStrings.searchCar.tr,
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
          body: controller.isLoading? const Center(
            child: CircularProgressIndicator(color: AppColors.darkBlueColor,),
          ): controller.offerCarList.isEmpty && controller.luxuryCarList.isEmpty ? const NoDataFoundWidget() : SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTopSection(),
                controller.offerCarList.isNotEmpty ? const Column(
                  children: [
                    SizedBox(height: 24),
                     HomePopularSection(),
                  ],
                ) : const SizedBox(),
                controller.luxuryCarList.isNotEmpty ? const Column(
                  children: [
                    SizedBox(height: 24),
                    HomeLuxuryCarSection(),
                  ],
                ) : const SizedBox()
              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
        ),
      ),
    ) ;
  }
}
