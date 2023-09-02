import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
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
              suffixIcon: SvgPicture.asset(AppIcons.deleteIcon,color: AppColors.blueNormal,),
              fieldBorderRadius: 8,
               hintText: AppStrings.searchCar,
               inputTextStyle: GoogleFonts.poppins(
                color: AppColors.blackNormal,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),

            ),
            SizedBox(height: 16,),

         Column(
           children:   List.generate(10, (index) =>  SingleChildScrollView(
             physics: ScrollPhysics(),
             scrollDirection: Axis.vertical,
             child: CustomContainer(
               marginTop: 8,
                 borderColor: AppColors.blackLightHover,
                 borderRadius: 8,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       children: [
                         const CustomText(
                           left:12,
                           top:12,
                           bottom: 12,
                           text: AppStrings.toyotaHarrier,
                           color: AppColors.blueNormal,
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
                                                   color: AppColors.blueNormal,
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
                     Container(
                       width: 120,
                       height: 80,
                       decoration: const ShapeDecoration(
                         image: DecorationImage(
                           image: AssetImage(AppImages.carBg),
                           fit: BoxFit.fill,
                         ),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.only(

                               topRight: Radius.circular(8),
                               bottomRight: Radius.circular(8)
                           ),
                         ),
                       ),
                     ),

                   ],
                 )
             ),
           ))
         )
          ],
        ),
      ),
    );
  }
}
