import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/home/home_screen.dart';
import 'package:renti_user/view/screens/message/inbox/inbox_screen.dart';
import 'package:renti_user/view/screens/message/messages/messages_screen.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_screen.dart';
import 'package:renti_user/view/screens/search/search_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavBar({required this.currentIndex, super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  var bottomNavIndex = 0;

  List<String> unselectedIcon = [
    "assets/icons/home.svg",
    "assets/icons/search_icon.svg",
    "assets/icons/message_icon.svg",
    "assets/icons/person_icon.svg",
  ];

  List<String> navList = [
    "Home", "Search", "Message", "Profile"
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 16),
        alignment: Alignment.center,
        decoration: const ShapeDecoration(
         color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            unselectedIcon.length,
                (index) => InkWell(
              onTap: () => onTap(index),
              child: Padding(
                padding: const EdgeInsetsDirectional.all(4),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SvgPicture.asset(unselectedIcon[index], height: 24, width: 24, color:  index == bottomNavIndex ? AppColors.primaryColor : const Color(0xffBFBFBF)),
                      const SizedBox(height: 8),
                      Text(
                        navList[index],
                        style: GoogleFonts.nunitoSans(
                          color: index == bottomNavIndex ? AppColors.primaryColor : const Color(0xffBFBFBF),
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
        Get.to(() => const HomeScreen());
      }
    }
    else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        Get.to(() => const SearchScreen());
      }
    }
    else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.to(() => const MessageScreen());
      }
    }
    else if (index == 3) {
      if (!(widget.currentIndex == 3)) {
        Get.to(() => const ProfileDetailsScreen());
      }
    }
  }
}