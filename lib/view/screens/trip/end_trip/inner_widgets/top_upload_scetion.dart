import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';

import '../../../../widgets/text/custom_text.dart';

class EndTripAddCarImage extends StatelessWidget {
  const EndTripAddCarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RentHistoryController>(builder: (controller) {
      return SizedBox(
        height: 150,
        child: Row(
          children: [
            //First Image

            controller.firstImg == null
                ? Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // controller.openGallery(index: 0);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title:  CustomText(
                                  text:
                                      "Before finishing your trip, upload pictures of the car to verify the conditions is being returned".tr,
                                  maxLines: 4,
                                ),
                                actions: [

                                  IconButton(onPressed: () {
                                    controller.openCamera(index: 0);
                                  }, icon: const Icon(Icons.camera_alt_outlined)),
                                  IconButton(onPressed: () {
                                    controller.openGallery(index: 0);
                                    Get.back();
                                  }, icon: const Icon(Icons.photo_album)),
                                ],
                              );
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        height: 150,
                        width: double.infinity - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.whiteDark),
                        ),
                        child: const Icon(Icons.image),
                      ),
                    ),
                  )
                : Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // controller.openGallery(index: 0);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title:  CustomText(
                                  text:
                                  "Before finishing your trip, upload pictures of the car to verify the conditions is being returned".tr,
                                  maxLines: 4,
                                ),
                                actions: [

                                  IconButton(onPressed: () {
                                    controller.openCamera(index: 0);
                                  }, icon: const Icon(Icons.camera_alt_outlined)),
                                  IconButton(onPressed: () {
                                    controller.openGallery(index: 0);
                                    Get.back();
                                  }, icon: const Icon(Icons.photo_album)),
                                ],
                              );
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        height: 150,
                        width: double.infinity - 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.whiteDark),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image:
                                    FileImage(File(controller.firstImg!.path)),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  //Second Image
                  controller.secondImg == null
                      ? Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // controller.openGallery(index: 0);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:  CustomText(
                                        text:
                                        "Before finishing your trip, upload pictures of the car to verify the conditions is being returned".tr,
                                        maxLines: 4,
                                      ),
                                      actions: [

                                        IconButton(onPressed: () {
                                          controller.openCamera(index: 1);
                                        }, icon: const Icon(Icons.camera_alt_outlined)),
                                        IconButton(onPressed: () {
                                          controller.openGallery(index: 1);
                                          Get.back();
                                        }, icon: const Icon(Icons.photo_album)),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              height: 150,
                              width: double.infinity - 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.whiteDark),
                              ),
                              child: const Icon(Icons.image),
                            ),
                          ),
                        )
                      : Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // controller.openGallery(index: 0);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:  CustomText(
                                        text:
                                        "Before finishing your trip, upload pictures of the car to verify the conditions is being returned".tr,
                                        maxLines: 4,
                                      ),
                                      actions: [

                                        IconButton(onPressed: () {
                                          controller.openCamera(index: 1);
                                        }, icon: const Icon(Icons.camera_alt_outlined)),
                                        IconButton(onPressed: () {
                                          controller.openGallery(index: 1);
                                          Get.back();
                                        }, icon: const Icon(Icons.photo_album)),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              height: 150,
                              width: double.infinity - 40,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.whiteDark),
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(controller.secondImg!.path)),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                  const SizedBox(height: 8),

                  //Third Image

                  controller.thirdImg == null
                      ? Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // controller.openGallery(index: 0);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:  CustomText(
                                        text:
                                        "Before finishing your trip, upload pictures of the car to verify the conditions is being returned".tr,
                                        maxLines: 4,
                                      ),
                                      actions: [

                                        IconButton(onPressed: () {
                                          controller.openCamera(index: 2);
                                        }, icon: const Icon(Icons.camera_alt_outlined)),
                                        IconButton(onPressed: () {
                                          controller.openGallery(index: 2);
                                          Get.back();
                                        }, icon: const Icon(Icons.photo_album)),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              height: 150,
                              width: double.infinity - 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.whiteDark),
                              ),
                              child: const Icon(Icons.image),
                            ),
                          ),
                        )
                      : Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // controller.openGallery(index: 0);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:  CustomText(
                                        text:
                                        "Before finishing your trip, upload pictures of the car to verify the conditions is being returned".tr,
                                        maxLines: 4,
                                      ),
                                      actions: [

                                        IconButton(onPressed: () {
                                          controller.openCamera(index: 2);
                                        }, icon: const Icon(Icons.camera_alt_outlined)),
                                        IconButton(onPressed: () {
                                          controller.openGallery(index: 2);
                                          Get.back();
                                        }, icon: const Icon(Icons.photo_album)),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              height: 150,
                              width: double.infinity - 40,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.whiteDark),
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(controller.thirdImg!.path)),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
