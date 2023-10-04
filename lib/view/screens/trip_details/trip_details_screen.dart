import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
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
          body: LayoutBuilder(builder: (context, constraint) => GetBuilder<TripDetailsController>(
            builder: (controller) => const SingleChildScrollView(
              padding: EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopUploadSection(),
                  SizedBox(height: 16),
                  RentalInfo(),
                  SizedBox(height: 24,),
                  HostInfo(),
                  SizedBox(height: 32,),
                  PaymentSection()
                ],
              ),
            ),
          )),
          bottomNavigationBar: GetBuilder<TripDetailsController>(
            builder: (controller) => Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
              child: CustomElevatedButton(
                onPressed: (){},
                titleText: "Make Payment",
                buttonWidth: MediaQuery.of(context).size.width,
              ),
            )
          ),
        )
    );
  }
}
