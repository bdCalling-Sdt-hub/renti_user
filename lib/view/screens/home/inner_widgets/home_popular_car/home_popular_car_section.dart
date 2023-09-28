import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_controller/home_popular_controller.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_model/home_popular_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_repo/home_popular_repo.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class HomePopularSection extends StatelessWidget {

   const HomePopularSection({super.key,});

  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(PopularCarRepo(apiService: Get.find()));
    Get.put(PopularCarController(popularCarRepo: Get.find()));
  }


  @override
  Widget build(BuildContext context) {

    return GetBuilder<PopularCarController>(builder: (controller){
     if(controller.isLoading == true
     ){
       return const Center(
         child: CircularProgressIndicator(),
       );
     }
     PopularCarModel popularCarModel = controller.popularCarModel;
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             const CustomText(
               text: "Popular Cars",
               color: AppColors.blackNormal,
               fontSize: 14,
               fontWeight: FontWeight.w500,
             ),
             InkWell(
               onTap: (){
                 Get.toNamed(AppRoute.popularCarScreen, arguments: popularCarModel);
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
             physics:  const BouncingScrollPhysics(),
             child: Row(
               children: List.generate(
                   controller.popularCarList.length, (index) => Stack(
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
                               image: NetworkImage(controller.popularCarList[index].image[0]??""),
                               // image: AssetImage(AppImages.carBg),
                               fit: BoxFit.fill,
                             ),
                             shape: const RoundedRectangleBorder(
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
                           text: controller.popularCarList[index].carModelName??"",
                           color: AppColors.primaryColor,
                           fontSize: 12,
                           fontWeight: FontWeight.w500,
                         ),

                         Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 12.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Row(
                                 children: [
                                   SvgPicture.asset(AppIcons.lucidFuel),

                                   CustomText(
                                     left: 8,
                                     text: controller.popularCarList[index].totalRun.toString()??"",
                                    // text:"${controller.popularCarModel.cars![index].totalRun.toString()}${"/L"}",
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
                                                text: "${"\$"}${controller.popularCarList[index].hourlyRate.toString()?? ""}",
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
               ),
             )
         )
       ],
     );
    });
  }
}
