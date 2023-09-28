import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/search/search_controller/search_controller.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class SearchesCarSection extends StatelessWidget {
  const SearchesCarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
      builder: (controller) {
        if(controller.isLoading== true){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
            children: List.generate(
            controller.searchModel.cars!.length,
            (index) =>  Container(
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
                         CustomText(
                          textAlign: TextAlign.start,
                          left: 12,
                          bottom: 12,
                          text: controller.searchModel.cars![index].carModelName.toString(),
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
                                   CustomText(
                                    left: 8,
                                    right: 8,
                                    text: controller.searchModel.cars![index].totalRun.toString(),
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
                                              text: '\$ ${controller.searchModel.cars![index].hourlyRate.toString() }',
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
                      decoration:  ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(controller.searchModel.cars![index].image[0]),
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
    );
  }
}
