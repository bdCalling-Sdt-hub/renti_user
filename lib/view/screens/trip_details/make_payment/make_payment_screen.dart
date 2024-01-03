import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/trip_details/make_payment/Controller/payment_controller.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';

import '../../rent_history/rent_history_controller/rent_history_controller.dart';

class MakePaymentScreen extends StatefulWidget {
  const MakePaymentScreen(
      {super.key, required this.rentId, required this.index});

  final int index;
  final String rentId;

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {
  final PaymentController _controller = Get.put(PaymentController());
  final _rentController = Get.find<RentHistoryController>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("host id ${widget.rentId}");
    return Scaffold(
      appBar: CustomAppBar(
          appBarContent: Row(
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: AppColors.blackNormal,
              )),
          CustomText(
            text: "Payment".tr,
            color: AppColors.blackNormal,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )
        ],
      )),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Card Number".tr, bottom: 12),
                  CustomTextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardNumberFormatter()
                    ],
                    hintText: "XXXX XXXX XXXX XXXX".tr,
                    textEditingController: _controller.cardNumber,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    // focusNode: controller.emailFocusNode,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        color: AppColors.whiteNormalActive),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your Credit card number".tr;
                      } else if (value.length > 19 || value.length < 19) {
                        return "Enter your valid card number";
                      }
                      return null;
                    },
                  ),
                  CustomText(
                    text: "Expired Date".tr,
                    bottom: 12,
                    top: 16,
                  ),
                  CustomTextField(
                    inputFormatters: [CardExpirationFormatter()],
                    textEditingController: _controller.expiryDate,
                    // focusNode: controller.passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    hintText: "MM/YY".tr,
                    keyboardType: TextInputType.number,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        color: AppColors.whiteNormalActive),
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return "Enter your Expire date".tr;
                      } else if (value.toString().length > 5) {
                        return "Enter your valid Expire date".tr;
                      }
                      return null;
                    },
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

                    hintText: "Enter CVV".tr,
                    keyboardType: TextInputType.number,
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        color: AppColors.whiteNormalActive),
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return "Enter your CVV number".tr;
                      } else if (value.toString().length > 4) {
                        return "Enter your valid CVV number";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<PaymentController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: controller.isLoading
                ? const CustomElevatedLoadingButton()
                : CustomElevatedButton(
                    buttonWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      controller.tokenizeCard(
                          rentId: widget.rentId,
                          amount: int.parse(_rentController
                              .rentUser[widget.index].totalAmount!),
                          email: _rentController
                              .rentUser[widget.index].userId!.email!,
                          productName: _rentController
                              .rentUser[widget.index].carId!.carModelName!,
                          index: widget.index);
                    },
                    titleText: "Pay Now".tr),
          );
        },
      ),
    );
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
