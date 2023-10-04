import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_model/rent_history_model.dart';
import 'package:renti_user/view/screens/rent_request_payment/inner_widgets/payment_section.dart';
import 'package:renti_user/view/screens/rent_request_payment/inner_widgets/host_information.dart';
import 'package:renti_user/view/screens/rent_request_payment/inner_widgets/rental_info.dart';
import 'package:renti_user/view/screens/rent_request_payment/inner_widgets/top_upload_scetion.dart';
import 'package:renti_user/view/screens/rent_request_payment/rent_request_payment_controller/rent_request_payment_controller.dart';
import 'package:renti_user/view/screens/rent_request_payment/rent_request_payment_repo/rent_request_payment_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_nav_button.dart';
import '../../../utils/app_colors.dart';

class RentRequestScreen extends StatefulWidget {
  const RentRequestScreen({super.key});
  @override
  State<RentRequestScreen> createState() => _RentRequestScreenState();
}

class _RentRequestScreenState extends State<RentRequestScreen> {

  late UserWiseRent wiseRent;

  @override
  void initState() {
    DeviceUtils.authUtils();
    wiseRent = Get.arguments;
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(RentRequestPaymentRepo(apiService: Get.find()));
    Get.put(RentRequestPaymentController(rentRequestPaymentRepo: Get.find()));
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
                Text("Trip Details",
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
          body: LayoutBuilder(builder: (context, constraint) {
            return  SingleChildScrollView(
            controller: scrollController,
              padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // top Section with upload button
                  TopUploadSection(rentHistoryModel: wiseRent,),
                  const SizedBox(height: 16),
                  RentalInfo(rentHistoryModel: wiseRent),
                  const SizedBox(height: 24,),
                  HostInfo(rentHistoryModel: wiseRent,),
                  const SizedBox(height: 32,),
                  PaymentSection(scrollController: scrollController, rentHistoryModel: wiseRent)
                ],
              ),
            );}
          ),
        bottomNavigationBar: GetBuilder<RentRequestPaymentController>(
          builder: (controller){
            return BottomNavButton(onTap: (){
              controller.rentRequestPaymentResult(wiseRent.id??"", wiseRent.totalAmount??"100", wiseRent.carId?.carModelName??"");
            }, buttonName: AppStrings.makePayment, buttonColor: AppColors.primaryColor);
          },
        ),
      )
    );
  }
}
