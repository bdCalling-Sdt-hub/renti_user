import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';
import 'package:renti_user/view/screens/trip_details/inner_widgets/host_information.dart';
import 'package:renti_user/view/screens/trip_details/inner_widgets/payment_section.dart';
import 'package:renti_user/view/screens/trip_details/inner_widgets/rental_info.dart';
import 'package:renti_user/view/screens/trip_details/inner_widgets/top_upload_scetion.dart';
import 'package:renti_user/view/screens/trip_details/trip_detasils_controller/trip_details_controller.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';

class TripDetailsScreen extends StatefulWidget {

  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {

  late int index;

  @override
  void initState() {
    DeviceUtils.authUtils();
    index = Get.arguments[1];
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(RentHistoryRepo(apiService: Get.find()));
    final controller = Get.put(RentHistoryController(rentHistoryRepo: Get.find()));
    print(index);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
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

    return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
              appBarContent: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child:  Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_new,color: AppColors.blackNormal,size: 18,),
                     const SizedBox(width: 8),
                    Text(
                      "Trip Details",
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
          body: LayoutBuilder(builder: (context, constraint) => GetBuilder<RentHistoryController>(
            builder: (controller) => SingleChildScrollView(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
              child: controller.isLoading ? const Center(
                child: CircularProgressIndicator(),
              ) : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopUploadSection(index: index),
                  const SizedBox(height: 16),
                  RentalInfo(index: index),
                  const SizedBox(height: 24,),
                  HostInfo(index: index),
                  const SizedBox(height: 32,),
                  PaymentSection(index: index)
                ],
              ),
            ),
          )),
          bottomNavigationBar: GetBuilder<RentHistoryController>(
            builder: (controller) => Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
              child: CustomElevatedButton(
                onPressed: () async{
                  Get.snackbar("Success", "Payment SuccessFully",backgroundColor: Colors.black,colorText: Colors.white);
                  final String id = controller.rentUser[index].id ?? "";
                  await Future.delayed(const Duration(milliseconds: 2000), (){
                    Get.toNamed(AppRoute.startTrip,arguments: id);
                  });
                },
                titleText: "Make Payment",
                buttonWidth: MediaQuery.of(context).size.width,
              ),
            )
          ),
        )
    );
  }
}
