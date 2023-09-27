import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_controller/all_cars_controller.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_model/all_cars_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_repo/all_cars_repo.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_model/home_popular_model.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class HomeAllCarSection extends StatelessWidget {

  HomeAllCarSection({super.key , required this.allCarsModel});

  // void initState() {
  //   Get.put(ApiService(sharedPreferences: Get.find()));
  //   Get.put(AllCarsRepo(apiService: Get.find()));
  //   Get.put(AllCarsController(allCarsRepo: Get.find()));
  // }

  AllCarsModel allCarsModel;
  @override
  Widget build(BuildContext context) {

    return GetBuilder<AllCarsController>(builder: (controller){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "All Cars",
                color: AppColors.blackNormal,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoute.allCarScreen,arguments: allCarsModel);
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
              physics:   BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    allCarsModel.cars!.length.toInt(),(index) => Stack(
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.only(end: 12),
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
                            decoration:  ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(allCarsModel.cars![index].image[0]) ,
                                // image: AssetImage(AppImages.carImage),
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
                          CustomText(
                            left:12,
                            top:12,
                            bottom: 12,
                            text: allCarsModel.cars![index].carModelName.toString(),
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
                                      text:"${allCarsModel.cars![index].totalRun.toString()}${"/L"}",
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
                                                text: "${"\$"}${allCarsModel.cars![index].hourlyRate.toString()}",
                                                style: GoogleFonts.poppins(
                                                  color: const Color(0xFF595959),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),

                                              // TextSpan(
                                              //   text: popularCarModel.cars![index].hourlyRate,
                                              //   style: GoogleFonts.poppins(
                                              //     color: const Color(0xFF595959),
                                              //     fontSize: 10,
                                              //     fontWeight: FontWeight.w400,
                                              //     height: 1.4),
                                              // ),
                                              TextSpan(
                                                  text: '/hr',
                                                  style: GoogleFonts.openSans(
                                                    color: AppColors.primaryColor,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
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
                    ),

                  ],
                )
                ),
              )
          )
        ],
      );
    });
  }
}

