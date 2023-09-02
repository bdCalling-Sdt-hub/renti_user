import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class CustomBack extends StatelessWidget {
  const CustomBack(
      {super.key,
        this.horizontal = 0,
        this.vertical = 0,
        this.text = "",
        this.fontSize = 18,
        this.height,
        this.onTap,
        this.left = 8,
        this.fontWeight = FontWeight.w500,
        this.color = AppColors.whiteLight});

  final double horizontal;
  final double vertical;
  final String text;
  final double fontSize;
  final double ? height;
  final VoidCallback? onTap;
  final double left;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios_new, size: fontSize, color: AppColors.whiteLight),
            CustomText(
              left: left,
              text: text,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}