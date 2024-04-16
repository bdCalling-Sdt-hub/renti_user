

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/view/screens/car_details/car_details_controller/car_details_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../core/global/api_url_container.dart';

class CarDetailsTopSection extends StatefulWidget {
  const CarDetailsTopSection({super.key});

  @override
  State<CarDetailsTopSection> createState() => _CarDetailsTopSectionState();
}

class _CarDetailsTopSectionState extends State<CarDetailsTopSection> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarDetailsController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: AppColors.whiteLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 10,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
           controller.carDetailsModel.cars!.image!.isNotEmpty &&  controller.carDetailsModel.cars?.image!=null? CarouselSlider.builder(
              //"${ApiUrlContainer.imageUrl}${controller.rentUser[widget.index].carId?.image}"
              itemCount: 3,
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageIndex) {
                print("=========================${ApiUrlContainer.imageUrl}${controller.carDetailsModel.cars?.image}".length);
                return Container(
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    padding: const EdgeInsets.symmetric(
                        vertical: 44, horizontal: 44),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.whiteDArkHover,
                        image: "${ApiUrlContainer.imageUrl}${controller.carDetailsModel.cars?.image}".isNotEmpty? DecorationImage(
                            image: CachedNetworkImageProvider("${ApiUrlContainer.imageUrl}${controller.carDetailsModel.cars?.image?[0]}"??""),
                            fit: BoxFit.fill)
                            : const DecorationImage(
                            image: AssetImage(AppImages.carImage),
                            fit: BoxFit.fill)));
              },

              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                enableInfiniteScroll: true,
                viewportFraction: 1,
                height: 200.0,
                autoPlay: false,
              ),
            ) : const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text:
                            controller.carDetailsModel.cars?.carModelName ?? "",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlueColor,
                        right: 8,
                      ),
                      const Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.starIcon,
                            size: 12,
                          ),
                          CustomText(
                            text: "0",
                            fontSize: 10,
                            color: AppColors.blackNormal,
                            left: 8,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CustomImage(
                              imageSrc: AppIcons.lucidFuel, size: 14),
                          CustomText(
                            text:
                                '${controller.carDetailsModel.cars?.totalRun ?? ""}/L',
                            fontSize: 14,
                            color: AppColors.whiteDarkActive,
                            right: 12,
                            left: 6,
                          ),
                        ],
                      ),
                      CustomText(
                        text:
                            '\$${controller.carDetailsModel.cars?.hourlyRate ?? ""} ${"/day"}',
                        fontSize: 14,
                        color: AppColors.whiteDarkActive,
                        left: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            controller.carDetailsModel.cars!.image!.isNotEmpty && controller.carDetailsModel.cars?.image!=null? DotsIndicator(
              decorator: DotsDecorator(
                color: Colors.grey.withOpacity(0.2),
                activeColor: AppColors.blackNormal,
              ),
             dotsCount: 3,
             // dotsCount: controller.carDetailsModel.cars?.image?.length ?? 1,
              position: currentIndex,
            ):const SizedBox()
          ],
        ),
      ),
    );
  }
}
