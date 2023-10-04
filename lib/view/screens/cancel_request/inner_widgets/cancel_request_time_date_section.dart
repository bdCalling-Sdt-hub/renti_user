import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/date_converter_helper.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_controller/cancel_request_controller.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class CancelRequestTimeDateSection extends StatelessWidget {

  const CancelRequestTimeDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CancelRequestController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Time & Date",
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.blackNormal,
            bottom: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "From",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: DateConverter.isoStringToLocalDateOnly(controller.model.rents?.startDate ?? "---"),
                color: AppColors.blackNormal,
                bottom: 12,
                right: 8,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Until",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteDarkActive,
                bottom: 12,
              ),
              CustomText(
                text: DateConverter.isoStringToLocalDateOnly(controller.model.rents?.endDate ?? "---"),
                color: AppColors.blackNormal,
                bottom: 12,
                right: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
