import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';


class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
        this.height,
        this.marginTop = 0,
        this.paddingVertical = 0,
        this.paddingHorizontal = 0,
        this.radiusTopLeft = 0,
        this.radiusTopRight = 0,
        this.width = double.infinity,
        required this.child,
        this.borderColor = AppColors.blackNormal,
        this.borderRadius = 8
      });

  final double radiusTopLeft;
  final double radiusTopRight;
  final double paddingVertical;
  final double paddingHorizontal;
  final double width;
  final double? height;
  final Widget child;
  final double marginTop;
  final Color  borderColor;
  final double  borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(top: marginTop),
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      decoration: BoxDecoration(
        color: AppColors.whiteLight1,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor,width: 1)
      ),
      child: child,
    );
  }
}
