import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/logout/logout_controller/logout_controller.dart';
import 'package:renti_user/view/screens/logout/logout_repo/logout_repo.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
class CustomDrawer extends StatefulWidget {

  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}


class _CustomDrawerState extends State<CustomDrawer> {

  bool changeColor = false;

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(LogoutRepo(apiService: Get.find()));
    Get.put(LogoutController(repo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogoutController>(
      builder: (controller) => Drawer(
        width: 230,
        backgroundColor: AppColors.whiteLight,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Drawer Top Section
              const SizedBox(height: 30),
              const CustomImage(imageSrc: AppImages.profileImg, imageType: ImageType.png, size: 50),
              const CustomText(text: "Jane Cooper", fontSize: 16, fontWeight: FontWeight.w500,top: 8),
              const CustomText(text: "(480) 555-0103", fontSize: 12, color: AppColors.whiteDarkHover,top: 8,bottom: 8),
              const Divider(color: AppColors.blackLightHover,thickness: 1),
              // rent history
              InkWell(
                onTap: () => Get.toNamed(AppRoute.rentiHistory),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: AppColors.whiteLight,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.history,size: 18,),
                      CustomText(text: AppStrings.rentHistory,color: AppColors.whiteDarkHover,left: 8)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Get.toNamed(AppRoute.rentiWorks),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: AppColors.whiteLight,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.howRentiWorks,size: 18,),
                      CustomText(text: AppStrings.howRentiWorks,color: AppColors.whiteDarkHover,left: 8)
                    ],
                  ),
                ),
              ),
              //support
              InkWell(
                onTap: () => Get.toNamed(AppRoute.support),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: AppColors.whiteLight,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.support1,size: 18,),
                      CustomText(text: AppStrings.support,color: AppColors.whiteDarkHover,left: 8)
                    ],
                  ),
                ),
              ),
              //aboutUs
              InkWell(
                onTap: () => Get.toNamed(AppRoute.aboutUs),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: AppColors.whiteLight,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.aboutUsIcon,size: 18,),
                      CustomText(text: AppStrings.aboutUs,color: AppColors.whiteDarkHover,left: 8)
                    ],
                  ),
                ),
              ),
              //settings
              InkWell(
                onTap: () => Get.toNamed(AppRoute.settings),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: AppColors.whiteLight,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.settingsIcon,size: 18,),
                      CustomText(text: AppStrings.settings,color: AppColors.whiteDarkHover,left: 8)
                    ],
                  ),
                ),
              ),
              const Divider(color: AppColors.blackLightHover,thickness: 1),
              // logOut
              InkWell(
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            Text(
                              "You sure want to log out",
                              style: GoogleFonts.poppins(
                                  color: AppColors.blackNormal,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 24.0, horizontal: 0),
                              child: Divider(
                                height: 1,
                                color: AppColors.whiteDarkHover,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child:InkWell(
                                      onTap: () => controller.logout(),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0x7FFBE9EC),
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child:  Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 11.5),
                                            child: Text(
                                              "Yes",
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.redNormal,
                                                  fontSize: 18,fontWeight: FontWeight.w600
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                      ),
                                    )
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xff000B90),
                                              borderRadius:
                                              BorderRadius.circular(8)),
                                          child:  Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 11.5),
                                            child: Text(
                                              "No",
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.whiteLight,
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ); ;
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: AppColors.whiteLight,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: const Row(
                    children: [
                      CustomImage(
                        imageSrc: AppIcons.logOutIcon,size: 18,),
                      CustomText(text: AppStrings.logOut,color: AppColors.whiteDarkHover,left: 8)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}