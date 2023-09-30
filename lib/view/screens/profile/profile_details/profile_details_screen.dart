import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/profile/profile_details/inner_widget/profile_details.dart';
import 'package:renti_user/view/screens/profile/profile_details/inner_widget/profile_top_section.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_repo/profile_details_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import '../../../../utils/app_colors.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ProfileDetailsRepo(apiService: Get.find()));
    Get.put(ProfileDetailsController(profileDetailsRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {

    DeviceUtils.screenUtils();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
        child: Scaffold(
      backgroundColor: AppColors.whiteLight,
      
      appBar: const CustomAppBar(
        appBarContent: CustomText(
          text: AppStrings.profile,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.blackNormal,
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding:
                    EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  children: [
                    ProfileTopSection(),
                    ProfileDetails()
                  ],
                ),
              )),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    ));
  }
}
