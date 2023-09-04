
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({super.key});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}
class _ReviewDialogState extends State<ReviewDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainer(
        containerBgColor: AppColors.whiteLight,
        paddingHorizontal: 16,
        borderRadius: 8,
        height: 370,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
          child: Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 GestureDetector(
                   onTap: (){
                     Get.back();
                   },
                   child: CustomImage(
                     size: 22,
                     imageType: ImageType.svg,
                     imageSrc:
                       AppIcons.deleteIcon
                   ),
                 )
                ],
                  ),
              const SizedBox(height: 24,),
              Column(
                children: [
              const CustomText(
                text: AppStrings.giveReviewTitle,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              const SizedBox(height: 16,),
              RatingBarIndicator(
                rating: 3.75,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 50.0,
                direction: Axis.horizontal,
              ),
              const SizedBox(height: 32,),
              const CustomContainer(
                paddingVertical: 8,
                 paddingHorizontal: 16,
                 borderRadius:8,
                borderColor: AppColors.whiteNormalActive,
                containerBgColor: AppColors.whiteLight,
                child: Text(
                 maxLines: 3,
                  "Lorem ipsum dolor sit amet consectetur. Turpis venenatis pulvinarut duis cursus ipsum  honcus.",
                  style: TextStyle(
                     color: AppColors.blackNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                   ),
                  const SizedBox(height: 14,),
                  CustomElevatedButton(
                    buttonWidth: MediaQuery.of(context).size.width,
                    onPressed: () {

                    },
                    titleText: AppStrings.sendReview,
                    titleSize: 18,
                    titleWeight: FontWeight.w600,
                  ),
            ],
          )

          ]
      )
      ),
    )
    );

  }
}
