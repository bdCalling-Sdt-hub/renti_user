import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart%20';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/trip_details/make_payment/Controller/payment_controller.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';

import '../../rent_history/rent_history_controller/rent_history_controller.dart';

class MakePaymentScreen extends StatefulWidget {
   const MakePaymentScreen({super.key,required this.rentId, required this.index});

   final int index;
   final String rentId;

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {

  final PaymentController  _controller= Get.put(PaymentController());
  final _rentController =Get.find<RentHistoryController>();


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("host id ${widget.rentId}");
    return Scaffold(
      appBar:  CustomAppBar(
          appBarContent: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: AppColors.blackNormal,
                  )),
              CustomText(
                text: "Payment".tr,
                color: AppColors.blackNormal,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                left: 14,
              )
            ],
          )),
      body:  Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     CustomText(text: "Card Number".tr, bottom: 12),
                     CustomTextField(
                       hintText: "Enter Your Card Number".tr,
                       textEditingController: _controller.cardNumber,
                       textInputAction: TextInputAction.next,
                       keyboardType: TextInputType.number,
                       // focusNode: controller.emailFocusNode,
                       hintStyle: GoogleFonts.poppins(
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           letterSpacing: 1,
                           color: AppColors.whiteNormalActive),
                     ),
                     CustomText(
                       text: "Expired Date".tr,
                       bottom: 12,
                       top: 16,
                     ),
                     CustomTextField(

                       textEditingController: _controller.expiryDate,
                       // focusNode: controller.passwordFocusNode,
                       textInputAction: TextInputAction.next,
                       hintText:"MM-YY".tr,
                       keyboardType: TextInputType.text,
                       hintStyle: GoogleFonts.poppins(
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           letterSpacing: 1,
                           color: AppColors.whiteNormalActive),

                     ),
                     CustomText(
                       text: "CVV".tr,
                       bottom: 12,
                       top: 16,
                     ),
                     CustomTextField(
                       textEditingController: _controller.cvvCode,
                       textInputAction: TextInputAction.next,
                       // focusNode: controller.passwordFocusNode,

                       hintText:"Enter CVV ".tr,
                       keyboardType: TextInputType.number,
                       hintStyle: GoogleFonts.poppins(
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           letterSpacing: 1,
                           color: AppColors.whiteNormalActive),

                     ),
                   ],
                 ),
            ],
          ),
        ),
      ),
     bottomNavigationBar: GetBuilder<PaymentController>(
       builder: (controller){
         return Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
           child: controller.isLoading ? const CustomElevatedLoadingButton()
               : CustomElevatedButton(
               buttonWidth: MediaQuery.of(context).size.width,
               onPressed: ()
               {
                 controller.tokenizeCard(rentId:widget.rentId,amount:int.parse(_rentController.rentUser[widget.index].totalAmount!),email:_rentController.rentUser[widget.index].userId!.email!,productName:_rentController.rentUser[widget.index].carId!.carModelName!,index:widget.index
                 );
               }, titleText: "Pay Now".tr),
         );
       },
     ),
    );
  }
}
