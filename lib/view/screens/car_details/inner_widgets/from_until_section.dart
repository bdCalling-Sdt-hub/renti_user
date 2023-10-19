import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_details/car_details_controller/car_details_controller.dart';
import 'package:renti_user/view/screens/car_details/inner_widgets/car_details_car_info_section.dart';
import 'package:renti_user/view/screens/car_details/inner_widgets/car_details_host_info_section.dart';
import 'package:renti_user/view/screens/car_details/inner_widgets/car_details_map_section.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';
class FromUntilSection extends StatefulWidget {

  final String carId;
  const FromUntilSection({required this.carId, super.key});

  @override
  State<FromUntilSection> createState() => _FromUntilSectionState();
}

class _FromUntilSectionState extends State<FromUntilSection> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CarDetailsController>(
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: AppStrings.from,
                      color: AppColors.blackNormal,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 12,),
                    CustomTextField(
                      readOnly: true,
                      textEditingController: controller.startTripDateController,
                      textAlign: TextAlign.start,
                      fieldBorderRadius: 4,
                      hintText: "YYYY-MM-DD",
                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.whiteDarkActive,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                      fillColor: Colors.transparent,
                      isPrefixIcon: true,
                      prefixIconSrc: AppIcons.calenderIcon,
                      prefixIconColor: AppColors.whiteDarkActive,
                      onTap: () => controller.startTripDatePicker(context),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: AppStrings.until,
                      color: AppColors.blackNormal,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 12,),
                    CustomTextField(
                      readOnly: true,
                      textEditingController: controller.endTripDateController,
                      fieldBorderRadius: 4,
                      hintText: "YYYY-MM-DD",
                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.whiteDarkActive,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                      fillColor: Colors.transparent,
                      isPrefixIcon: true,
                      prefixIconSrc: AppIcons.calenderIcon,
                      prefixIconColor: AppColors.whiteDarkActive,
                      onTap: () => controller.endTripDatePicker(context),
                    )
                  ],
                ),
              )
            ],
          ),
          const CarDetailsCarInfoSection(),
          const CarDetailsHostInfoSection(),
          const CarDetailsMapSection(),
          const SizedBox(height: 24),
          controller.isSubmit ? CustomElevatedLoadingButton(buttonWidth: MediaQuery.of(context).size.width) : CustomElevatedButton(
            buttonWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              controller.sentRentRequest(
                carId: widget.carId,
                startDate: controller.startTripDateController.text.toString(),
                endDate: controller.endTripDateController.text.toString()
              );


            },
            titleText: AppStrings.sentRentRequest
          ),
        ],
      ),
    );
  }
}
