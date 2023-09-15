import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/view/screens/home/home_screen.dart';
import 'package:renti_user/view/screens/message/messages/messages_screen.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_screen.dart';
import 'package:renti_user/view/screens/search/search_screen.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;
  static const List<Widget> screens = <Widget>[
    HomeScreen(),
   SearchScreen(),
    MessageScreen(),
   ProfileDetailsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> manuBarItems = [
      MenuBarItems(
          text: "Home",
          index: 0,
          selectedIndex: selectedIndex,
          image: AppIcons.homeIcon),
      MenuBarItems(
          text: "Rent",
          index: 1,
          selectedIndex: selectedIndex,
          image: AppIcons.searchIcon
      ),
      MenuBarItems(
          text: "Message",
          index: 2,
          selectedIndex: selectedIndex,
          image: AppIcons.messageIcon
      ),
      MenuBarItems(
          text: "Profile",
          index: 3,
          selectedIndex: selectedIndex,
          image: AppIcons.personIcon
      ),
    ];
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        extendBody: true,
        bottomNavigationBar: Container(
          height: 60,alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(top: 15),
          decoration:  const BoxDecoration(
            color: AppColors.whiteLight,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 10,
                offset: Offset(0, -4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(manuBarItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: manuBarItems[index],
              );
            }),
          ),
        ),
        body: screens[selectedIndex],
      ),
    );
  }
}

class MenuBarItems extends StatelessWidget {
  const MenuBarItems(
      {super.key,
        required this.image,
        required this.index,
        required this.selectedIndex,
        required this.text});
  final String image;
  final String text;

  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            CustomImage(
                imageColor:selectedIndex == index  ?AppColors.primaryColor :AppColors.whiteDark,size:24,
                imageSrc: image),
            CustomText(
              fontSize: 12,fontWeight: FontWeight.w600,
              text: text,
              color: selectedIndex == index ?AppColors.primaryColor : AppColors.whiteDark,
            ),
          ],
        ),
      ],
    );
  }
}