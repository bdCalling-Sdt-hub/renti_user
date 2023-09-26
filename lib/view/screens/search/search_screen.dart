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
import 'package:renti_user/view/screens/search/search_model/search_model.dart';
import 'package:renti_user/view/screens/search/search_repo/search_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(SearchRepo(apiService: Get.find()));
    Get.put(SearchScreenController(searchRepo: Get.find()));
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SearchScreenController>(
        builder: (controller) {
          return Scaffold(
            appBar: CustomAppBar(
                appBarContent: Text(
                  "Search Car",
                  style: GoogleFonts.poppins(
                    color: AppColors.blackNormal,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                    prefixIconSrc: AppIcons.searchIcon,
                    isPrefixIcon: true,
                    suffixIcon: SvgPicture.asset(
                      AppIcons.deleteIcon,
                      color: AppColors.primaryColor,
                    ),
                    fieldBorderRadius: 8,
                    hintText: AppStrings.searchCar,
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
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: SearchesCarSection(searchModel: SearchModel(),)),
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