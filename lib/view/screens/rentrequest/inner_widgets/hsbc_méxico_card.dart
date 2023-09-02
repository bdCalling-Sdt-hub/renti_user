import 'package:flutter/cupertino.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';

class HsbcMexicoCard extends StatelessWidget {
  const HsbcMexicoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
            margin:  const EdgeInsetsDirectional.symmetric(horizontal: 4),
            padding:  const EdgeInsetsDirectional.symmetric(vertical: 16, horizontal: 12),
            decoration: const BoxDecoration(
            border: BorderDirectional(
            top: BorderSide.none,
            bottom: BorderSide(color: Color(0xFFBFBFBF),width:0.5),
            start: BorderSide(color: Color(0xFFBFBFBF),width:0.5),
            end: BorderSide(color: Color(0xFFBFBFBF),width:0.5)
    ),

    ),
      child: const Row(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          CustomImage(
            imageSrc: AppIcons.paymentIcon,
          ),
          SizedBox(width: 16),
          CustomText(
            text: AppStrings.bankMexico,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.blackNormal,
          ),
        ],
      )

    );
  }
}
