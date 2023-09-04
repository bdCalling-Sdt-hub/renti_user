import 'package:flutter/material.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import '../../../../utils/app_colors.dart';
import 'inner_widgets/bottom_scetion.dart';
import 'inner_widgets/host_information.dart';
import 'inner_widgets/rental_info.dart';
import 'inner_widgets/top_upload_scetion.dart';
class RentRequestScreen extends StatelessWidget {
  const RentRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return  SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBarContent: GestureDetector(
            onTap: (){

            },
            child: const Row(
              children: [
                Icon(Icons.arrow_back_ios_new,color: AppColors.blackNormal,size: 18,),
                SizedBox(width: 8,),
                Text("Rent Request",
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackNormal
                ),
                )
              ],
            ),
          )
        ),
          body: LayoutBuilder(builder: (context, constraint) {
            return  SingleChildScrollView(
            controller: scrollController,
              padding: const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // top Section with upload button
                  const TopUploadSection(),
                  const SizedBox(height: 16),
                  const RentalInfo(),
                  const SizedBox(height: 24,),
                  const HostInfo(),
                  const SizedBox(height: 32,),
                  BottomScetion(scrollController: scrollController,)
                ],
              ),
            );}
          ),));
  }
}
