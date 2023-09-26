import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
class HomeLuxuryCarSection extends StatefulWidget {
  const HomeLuxuryCarSection({super.key});

  @override
  State<HomeLuxuryCarSection> createState() => _HomeLuxuryCarSectionState();
}

class _HomeLuxuryCarSectionState extends State<HomeLuxuryCarSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(
              text: AppStrings.luxuryCars,
              color: AppColors.blackNormal,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            InkWell(
              onTap: (){
                Get.toNamed(AppRoute.luxuryCars);
              },
              child:  const CustomText(
                text: AppStrings.seeAll,
                color: AppColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(
                  4, (index) => Container(
                margin: EdgeInsetsDirectional.only(end: 12),
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsetsDirectional.only(bottom: 12),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 2,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 95,
                          decoration: const ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.carBgh),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        const CustomText(
                          left:12,
                          top:12,
                          bottom: 12,
                          text: AppStrings.toyotaHarrier,
                          color: AppColors.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(AppIcons.lucidFuel),
                                  const CustomText(
                                    left: 8,
                                    text: "10 km/h",
                                    color: AppColors.whiteDark,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  )
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(

                                              text: '\$25',
                                              style: GoogleFonts.poppins(
                                                color: const Color(0xFF595959),
                                                fontSize: 10,

                                                fontWeight: FontWeight.w400,
                                                height: 1.40,
                                              ),
                                            ),
                                            const TextSpan(
                                                text: '/hr',
                                                style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.40,
                                                )
                                            )
                                          ]
                                      )
                                  )
                                ],
                              ),
                            ],),
                        ),
                      ],
                    ),
                  )
              ),
            )
        )
      ],
    );
  }
}
