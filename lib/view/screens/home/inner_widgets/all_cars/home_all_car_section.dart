import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_list/all_cars/all_car_controller/all_car_controller.dart';
import 'package:renti_user/view/screens/car_list/all_cars/all_car_model/all_car_model.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';



class HomeOfferCarSection extends StatelessWidget {
   HomeOfferCarSection({super.key,required this.allCarModel});
 AllCarModel allCarModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllCarController>(

      builder: (controller) {
        return FutureBuilder(
            future: controller.allCarGetResponse(),
            builder:(context, snapshot){
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
              allCarModel=snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: AppStrings.offerCars,
                        color: AppColors.blackNormal,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      InkWell(
                        onTap: (){
                          Get.toNamed(AppRoute.offerCarScreen);
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
                            allCarModel.cars!.length.toInt(),
                                (index) => Stack(
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
                                    decoration:  const ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.carBg),
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
                                    text: allCarModel.cars![index].carModelName.toString(),
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
                                                        text: '\$20  ',
                                                        style: GoogleFonts.poppins(
                                                          color: AppColors.primaryColor,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),

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
                            ),
                            Positioned.fill(
                              left: 0, top: 0,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    padding: const EdgeInsetsDirectional.symmetric(vertical: 4,horizontal: 6),
                                    decoration: const BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomRight: Radius.circular(4))
                                    ),
                                    child: const CustomText(
                                      textAlign: TextAlign.center,
                                      text: '12%Off',
                                      color: AppColors.whiteLight,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,)
                                ),
                              ),
                            ),
                          ],
                        )
                    ))
                  )
                ],
              );
            }
        );
      }
    );
  }
}
