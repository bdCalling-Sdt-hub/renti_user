import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  List carModel = ["Toyota", "BMW", "Nissan", "Limberghini"];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 52,
      child: Row(
        children: [
          Expanded(
          flex: 3,
            child: TextFormField(
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
          ),
          const SizedBox(width: 8),
           Expanded(
            flex: 1,
            child: SizedBox(
              width: 55,
              child:  PopupMenuButton(
                position: PopupMenuPosition.under,
                elevation: 1,color: AppColors.whiteLight,
                offset:  Offset(0, 1),
                itemBuilder: (context) {
                  return List.generate(
                    carModel.length,
                        (index) {
                      return PopupMenuItem(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedItem = index;
                            });
                             Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedItem==index
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}