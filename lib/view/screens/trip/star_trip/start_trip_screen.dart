import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_nav_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'inner_widgets/bottom_scetions.dart';
import 'inner_widgets/top_upload_scetions.dart';

class StartTripScreen extends StatefulWidget {
  const StartTripScreen({super.key});
  @override
  State<StartTripScreen> createState() => _StartTripScreenState();
}
class _StartTripScreenState extends State<StartTripScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                appBarContent: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: const Row(
              children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.blackNormal,
                    size: 18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                 CustomText(
                   text: AppStrings.startTrip,
                     fontSize: 18,
                     fontWeight: FontWeight.w500,
                     color: AppColors.blackNormal
                 )
              ],
            ),
                )),
            body: LayoutBuilder(
              builder: (context, constraint) {
                return const SingleChildScrollView(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top Section with upload button
                      TopUploadSections(),
                      SizedBox(height: 24),
                      BottomScetions()
                    ],
                  ),
                );
              },
            ),
          bottomNavigationBar: BottomNavButton(onTap: (){
            Get.toNamed(AppRoute.endTrip);
          }, buttonName: AppStrings.startTrip, buttonColor: AppColors.primaryColor),
        )
    );
  }
}
