import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/search/inner_widgets/searches_car_section.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: Text("Search Car",style: GoogleFonts.poppins(
        color:  AppColors.blackNormal,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),)),
      body: Padding(
        padding:  const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
        child: Column(
          children: [
            CustomTextField(
              prefixIconSrc: AppIcons.searchIcon,
              isPrefixIcon: true,
              suffixIcon: SvgPicture.asset(AppIcons.deleteIcon,color: AppColors.primaryColor,),
              fieldBorderRadius: 8,
               hintText: AppStrings.searchCar,
               inputTextStyle: GoogleFonts.poppins(
                color: AppColors.blackNormal,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16,),
         const Expanded(
           child: SingleChildScrollView(
             physics: BouncingScrollPhysics(),
             scrollDirection: Axis.vertical,
             child: SearchesCarSection()
           ),
         )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
