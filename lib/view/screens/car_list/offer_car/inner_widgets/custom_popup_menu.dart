import 'package:flutter/material.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class CustomPopupMenu extends StatefulWidget {
  const CustomPopupMenu({
    super.key,
  });

  @override
  State<CustomPopupMenu> createState() => _PopupMenuButtonState();
}

class _PopupMenuButtonState extends State<CustomPopupMenu> {
  List carModel = ["Toyota", "BMW", "Nissan", "Limberghini"];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      elevation: 1,color: AppColors.whiteLight,
      offset: const Offset(0, 1),
      itemBuilder: (context) {
        return List.generate(
          carModel.length,
              (index) {
            return PopupMenuItem(
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == selectedItem
                          ? AppColors.primaryColor
                          : AppColors.whiteLight,
                      border: Border.all(
                          color: AppColors.lightBlueColor, width: 1),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomText(text:
                  carModel[index],
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsetsDirectional.all(16),
        decoration: BoxDecoration(
          color: AppColors.whiteLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.whiteNormalActive, width: 1),
        ),
        child: const Icon(
          Icons.filter_list_outlined,
          color: AppColors.whiteNormalActive,
          size: 20,
        ),
      ),
    );
  }
}