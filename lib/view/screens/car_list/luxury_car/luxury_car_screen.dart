import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/inner_widgets/luxury_car_details.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/luxury_car_controller/luxury_car_controller.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/luxury_car_repo/luxury_car_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class AllCarScreen extends StatefulWidget {

  const AllCarScreen({super.key});
  @override
  State<AllCarScreen> createState() => _AllCarScreenState();
}
class _AllCarScreenState extends State<AllCarScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(LuxuryCarRepo(apiService: Get.find()));
    final controller = Get.put(LuxuryCarController(luxuryCarRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar:  CustomAppBar(
            appBarContent: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: AppColors.blackNormal,
                    )),
                const CustomText(
                  text: "Luxury Cars",
                  color: AppColors.blackNormal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  left: 14,
                )
              ],
            )),
        body: GetBuilder<LuxuryCarController>(builder: (controller){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
            child: Column(
              children: [
                TextFormField(
                  cursorColor: AppColors.blackNormal,
                  showCursor: true,
                  style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.blackNormal),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_outlined,size: 20,color: AppColors.whiteNormalActive),
                    hintText: AppStrings.searchCar,
                    hintStyle: const TextStyle(
                        color: AppColors.whiteNormalActive,
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.whiteNormalActive,width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.whiteNormalActive,width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const AllCarDetaills()
              ],
            ),
          );
        })
      ),
    );
  }
}