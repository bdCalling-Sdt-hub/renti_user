import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class SearchesCarSection extends StatelessWidget {
  const SearchesCarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children:   List.generate(10, (index) =>  Container(
            margin: const EdgeInsetsDirectional.only(top: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.whiteNormalActive,width: 1),
              color: AppColors.whiteLight,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      textAlign: TextAlign.start,
                      left: 12,
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
                                right: 8,
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
                                            ))
                                      ]
                                  )
                              )
                            ],
                          ),
                        ],),
                    ),

                  ],
                ),
                Container(
                  width: 120,
                  height: 80,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.carBg),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)
                      ),
                    ),
                  ),
                ),

              ],
            )
        ))
    );
  }
}
