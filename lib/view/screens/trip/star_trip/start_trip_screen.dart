import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/screens/trip/star_trip/star_trip_controller/star_trip_controller.dart';
import 'package:renti_user/view/screens/trip/star_trip/star_trip_repo/star_trip_repo.dart';
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
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    // Get.put(StarTripRepo(apiService: Get.find()));
    Get.put(StarTripController());
    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.screenUtils();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments;
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
                return GetBuilder<RentHistoryController>(
                  builder: (controller) {
                    return const SingleChildScrollView(
                      padding: EdgeInsetsDirectional.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AddCarImage(),
                          SizedBox(height: 24),
                          BottomScetions()
                        ],
                      ),
                    );
                  }
                );
              },
            ),
          bottomNavigationBar: GetBuilder<StarTripController>(
            builder: (controller) {
              return BottomNavButton(onTap: (){
                controller.addCarMultipleFilesAndParams(id);
                print("okay");
              }, buttonName: AppStrings.startTrip, buttonColor: AppColors.primaryColor);
            }
          ),
        )
    );
  }
}
