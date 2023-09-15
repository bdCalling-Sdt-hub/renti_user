import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/profile/profile_details/inner_widget/profile_details.dart';
import 'package:renti_user/view/screens/profile/profile_details/inner_widget/profile_top_section.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
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
