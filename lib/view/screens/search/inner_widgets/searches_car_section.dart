import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/search/search_controller/search_controller.dart';
import 'package:renti_user/view/screens/search/search_model/search_model.dart';
import 'package:renti_user/view/screens/search/search_repo/search_repo.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class SearchesCarSection extends StatelessWidget {
  SearchesCarSection({super.key,required this.searchModel
  });



  SearchModel searchModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(builder: (controller){
      return Column(
        children: List.generate(
          controller.searchModel.cars!.length,
              (index) => Container(
            margin: const EdgeInsetsDirectional.only(top: 8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.whiteNormalActive, width: 1),
                color: AppColors.whiteLight,
                borderRadius: BorderRadius.circular(8)),
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
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.lucidFuel),
                              CustomText(
                                left: 8,
                                right: 8,
                                text:controller.searchModel.cars![index].totalRun.toString(),
                                color: AppColors.whiteDark,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                      '\$ ${controller.searchModel.cars![index].hourlyRate.toString() }',
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
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 120,
                  height: 80,
                  decoration:  const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.carBg),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                    ),
    return GetBuilder<SearchScreenController>(builder: (controller){
      return FutureBuilder<SearchModel>(
          future: controller.searchGetResponse(),
          builder: (context , snapshot) {


            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                  CircularProgressIndicator()); // Show a loading indicator while waiting for data
            } else if (snapshot.hasError) {
              return Text(
                  "Error: ${snapshot.error}"); // Show an error message if data fetch fails
            } else if (!snapshot.hasData) {
              return const Text(
                  "No data available"); // Handle case where no data is available
            }

            searchModel = snapshot.data!;



            return Column(
              children: List.generate(
                searchModel.cars!.length.toInt(),
                    (index) => Container(
                  margin: const EdgeInsetsDirectional.only(top: 8),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.whiteNormalActive, width: 1),
                      color: AppColors.whiteLight,
                      borderRadius: BorderRadius.circular(8)),
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
                            text: searchModel.cars![index].carModelName.toString(),
                            color: AppColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.lucidFuel),
                                    CustomText(
                                      left: 8,
                                      right: 8,
                                      text:searchModel.cars![index].totalRun.toString(),
                                      color: AppColors.whiteDark,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text:
                                            '\$ ${searchModel.cars![index].hourlyRate.toString() }',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF595959),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              height: 1.40,
                                            ),
                                          ),

                                            TextSpan(
                                              text:searchModel.cars![index]. registrationDate.toString() ,
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ))
                                        ]))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 120,
                        height: 80,
                        decoration:   ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(searchModel.cars![index].image[0].toString()),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
              ),
            );
          }
      );
    });
  }
}