import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_controller/cancel_request_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';

class CancelRequestHostInfo extends StatefulWidget {
  const CancelRequestHostInfo({super.key});
  @override
  State<CancelRequestHostInfo> createState() => _CancelRequestHostInfoState();
}
class _CancelRequestHostInfoState extends State<CancelRequestHostInfo> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<CancelRequestController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: AppStrings.hostInformation,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.blackNormal,
              bottom: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: AppStrings.name,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteDarkActive,
                  bottom: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: controller.model.rents?.hostId?.fullName ?? "---",
                      color: AppColors.blackNormal,
                      bottom: 12,
                      right: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: CustomImage(imageSrc: AppIcons.starIcon, size: 12),
                    ),
                    const CustomText(
                      text: '(4.5)',
                      color: AppColors.blackNormal,
                      bottom: 12,
                      left: 8,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: AppStrings.contact,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteDarkActive,
                  bottom: 12,
                ),
                CustomText(
                  text: controller.model.rents?.hostId?.phoneNumber ?? "---",
                  color: AppColors.blackNormal,
                  bottom: 12,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: AppStrings.email,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteDarkActive,
                  bottom: 12,
                ),
                CustomText(
                  text: controller.model.rents?.hostId?.email ?? "---",
                  color: AppColors.blackNormal,
                  bottom: 12,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: AppStrings.address,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteDarkActive,
                  bottom: 24,
                ),
                CustomText(
                  text: controller.model.rents?.hostId?.address ?? "---",
                  color: AppColors.blackNormal,
                  bottom: 24,
                ),
              ],
            ),
          ],
        )
    );
  }
}

