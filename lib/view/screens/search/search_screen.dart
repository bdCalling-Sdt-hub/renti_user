import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/search/inner_widgets/searches_car_section.dart';
import 'package:renti_user/view/screens/search/search_controller/search_controller.dart';
import 'package:renti_user/view/screens/search/search_repo/search_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/error_widget/no_data_found_widget.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';

import '../../../core/global/api_url_container.dart';
import '../../../core/route/app_route.dart';
import '../../widgets/text/custom_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    DeviceUtils.screenUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(SearchRepo(apiService: Get.find()));
    final controller = Get.put(SearchScreenController(searchRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       controller.searchResult();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SearchScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteLight,
          appBar: CustomAppBar(
              appBarContent: Text(
                "Search Car".tr,
                style: GoogleFonts.poppins(
                  color: AppColors.blackNormal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
          ),
          body: Padding(
            padding:  const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              children: [
                CustomTextField(
                  textEditingController: controller.searchController,
                  onChanged: (value) {
                    controller.searchResult(search: value.toString());
                     },
                  prefixIconSrc: AppIcons.searchIcon,
                  isPrefixIcon: true,
                  suffixIcon: GestureDetector(
                    onTap: (){
                      controller.searchController.clear();
                      controller.searchResult(search: "");

                    },
                    child: SvgPicture.asset(
                      AppIcons.deleteIcon,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  fieldBorderRadius: 8,
                  hintText: AppStrings.searchCar.tr,
                  inputTextStyle: GoogleFonts.poppins(
                    color: AppColors.blackNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                  Expanded(
                  child:controller.isLoading? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                      :controller.carList.isNotEmpty ?  SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: List.generate(
                            controller.carList.length,
                                (index) {
                              print("====================Length ${controller.carList.length}");
                              return GestureDetector(
                                onTap: () =>
                                    Get.toNamed(AppRoute.carDetails, arguments: controller.carList[index].id),
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      top: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.whiteNormalActive,
                                          width: 1),
                                      color: AppColors.whiteLight,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          CustomText(
                                            textAlign: TextAlign.start,
                                            left: 12,
                                            bottom: 12,
                                            text: controller.carList[index]
                                                .carModelName ?? "",
                                            color: AppColors.primaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        AppIcons.lucidFuel),
                                                    CustomText(
                                                      left: 8,
                                                      right: 8,
                                                      text: controller
                                                          .carList[index]
                                                          .totalRun ?? "",
                                                      color: AppColors
                                                          .whiteDark,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight
                                                          .w400,
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    RichText(
                                                        text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                '\$ ${controller
                                                                    .carList[index]
                                                                    .hourlyRate ??
                                                                    ""}',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                  color: const Color(
                                                                      0xFF595959),
                                                                  fontSize: 10,
                                                                  fontWeight: FontWeight
                                                                      .w400,
                                                                  height: 1.40,
                                                                ),
                                                              ),
                                                              const TextSpan(
                                                                  text: '/day',
                                                                  style: TextStyle(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight
                                                                        .w400,
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
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${ApiUrlContainer
                                                    .imageUrl}${controller
                                                    .carList[index]
                                                    .image?[0]}"),
                                            // image: AssetImage(AppImages.carBg),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(
                                                    8)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }))

                  ):const NoDataFoundWidget()
                  ),

              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
           );
          }
        );
      }
}
