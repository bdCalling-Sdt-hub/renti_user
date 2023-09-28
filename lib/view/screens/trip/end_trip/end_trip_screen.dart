import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/trip/end_trip/inner_widgets/review_dialog.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_nav_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import 'inner_widgets/bottom_info_scetion.dart';
import 'inner_widgets/top_upload_scetion.dart';

class EndTripScreen extends StatefulWidget {
  const EndTripScreen({super.key});

  @override
  State<EndTripScreen> createState() => _EndTripScreenState();
}

class _EndTripScreenState extends State<EndTripScreen> {
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
                        text: AppStrings.endTrip,
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
                    TopUploadScetion(),
                    SizedBox(height: 24,),
                    BottomInfoScetion()
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: BottomNavButton(onTap: (){
            showDialog(context: context, builder: (context){
              return ReviewDialog();
             }
            );
          }, buttonName: AppStrings.endTrip, buttonColor: AppColors.primaryColor),
        ),



    );
  }
}
