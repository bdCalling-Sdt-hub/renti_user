import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rent_request_payment/inner_widgets/payment_section.dart';
import 'package:renti_user/view/screens/rent_request_payment/inner_widgets/host_information.dart';
import 'package:renti_user/view/screens/rent_request_payment/inner_widgets/rental_info.dart';
import 'package:renti_user/view/screens/rent_request_payment/inner_widgets/top_upload_scetion.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_nav_button.dart';
import '../../../utils/app_colors.dart';

class RentRequestScreen extends StatelessWidget {
  const RentRequestScreen({super.key});
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
                Icon(Icons.arrow_back_ios_new,color: AppColors.blackNormal,size: 18,),
                SizedBox(width: 8,),
                Text("Rent Request",
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
                  const TopUploadSection(),
                  const SizedBox(height: 16),
                  const RentalInfo(),
                  const SizedBox(height: 24,),
                  const HostInfo(),
                  const SizedBox(height: 32,),
                  PaymentSection(scrollController: scrollController,)
                ],
              ),
            );}
          ),
        bottomNavigationBar: BottomNavButton(onTap: (){
          Get.toNamed(AppRoute.startTrip);
        }, buttonName: AppStrings.makePayment, buttonColor: AppColors.primaryColor),
      )
    );
  }
}
