import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_controller/cancel_request_controller.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_repo/cancel_request_repo.dart';
import 'package:renti_user/view/screens/cancel_request/inner_widgets/cancel_request_car_info_section.dart';
import 'package:renti_user/view/screens/cancel_request/inner_widgets/cancel_request_host_information.dart';
import 'package:renti_user/view/screens/cancel_request/inner_widgets/cancel_request_time_date_section.dart';
import 'package:renti_user/view/screens/cancel_request/inner_widgets/cancel_request_top_scetion.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import '../../../utils/app_colors.dart';

class CancelRequestScreen extends StatefulWidget {

  const CancelRequestScreen({super.key});
  @override
  State<CancelRequestScreen> createState() => _CancelRequestScreenState();
}

class _CancelRequestScreenState extends State<CancelRequestScreen> {

  late String rentId;

  @override
  void initState() {
    DeviceUtils.authUtils();

    rentId = Get.arguments;
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(CancelRequestRepo(apiService: Get.find()));
    final controller = Get.put(CancelRequestController(cancelRequestRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData(rentId);
    });
    super.initState();
  }

  @override
  void dispose() {

    DeviceUtils.screenUtils();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final ScrollController scrollController = ScrollController();
    return  SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBarContent: GestureDetector(
            onTap: (){
              Get.back();
            },
            child:  Row(
              children: [
                const Icon(Icons.arrow_back_ios_new,color: AppColors.blackNormal,size: 18,),
                const SizedBox(width: 8,),
                Text(
                  "Car Details",
                  style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackNormal
                ),
                )
              ],
            ),
          )
        ),
          body: LayoutBuilder(builder: (context, constraint) => GetBuilder<CancelRequestController>(
            builder: (controller) {
              return SingleChildScrollView(
                controller: scrollController,
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CancelRequestTopSection(),
                      SizedBox(height: 24),
                      CancelRequestTimeDateSection(),
                      SizedBox(height: 24),
                      CancelRequestCarInfoSection(),
                      SizedBox(height: 24),
                      CancelRequestHostInfo(),
                    ],
                  ),
                );
            }
          )
        ),
        bottomNavigationBar: GetBuilder<CancelRequestController>(
          builder: (controller) => Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
            child: CustomElevatedButton(
              onPressed: () => controller.cancelRequest(rentId),
              buttonColor: Colors.transparent,
              titleText: "Cancel Request",
              titleColor: AppColors.primaryColor,
              buttonWidth: MediaQuery.of(context).size.width,
              isBorder: true,
            ),
          )
        ),
      )
    );
  }
}
