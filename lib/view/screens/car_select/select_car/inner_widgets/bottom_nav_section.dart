import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_controller/car_details_controller.dart';
import 'package:renti_user/view/screens/car_select/select_car/inner_widgets/cancel_show_dialogue.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';

import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class BottomNavSection extends StatefulWidget {

  final String carId;

  const BottomNavSection({required this.carId,super.key});

  @override
  State<BottomNavSection> createState() => _BottomNavSectionState();
}

class _BottomNavSectionState extends State<BottomNavSection> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<CarDetailsController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: controller.isSubmit ? const CustomElevatedLoadingButton() : CustomElevatedButton(
            onPressed: () {
              print("Car Id: ${widget.carId}");
              controller.sentRentRequest(carId: widget.carId);
            },
            titleText: AppStrings.sentRentRequest
          ),
        );
      }
    );
  }
}
