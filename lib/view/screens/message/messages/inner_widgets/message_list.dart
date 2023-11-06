import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class MessageList extends StatelessWidget {
  MessageList({super.key});

  /*final List<Map<String, String>> dataList = [
    {
      "image": AppImages.profileImg,
      "document": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",

    },
    {
      "image": AppImages.profileImg,
      "document":"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",

    },
    {
      "image": AppImages.profileImg,
      "document": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
    },
    {
      "image": AppImages.profileImg,
      "document":"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
    },
    {
      "image": AppImages.profileImg,
      "document": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
    },
    {
      "image": AppImages.profileImg,
      "document": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
    },
    {
      "image": AppImages.profileImg,
      "document": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
    },
    {
      "image": AppImages.profileImg,
      "document":"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
    },
    {
      "image": AppImages.profileImg,
      "document": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
    },
  ];*/

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocketService>(
      builder: (controller) {
        return Column(
          children: List.generate(
            controller.chatList.length,
                (index) {
              return GestureDetector(
                onTap: () {
                  //Get.toNamed(AppRoute.inboxScreen);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 1,
                            onPressed: (v) {

                            },
                            backgroundColor: AppColors.redNormal,
                            icon: CupertinoIcons.delete),
                      ],
                    ),
                    child: Container(

                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
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
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //CustomImage(imageSrc: "",size: 52,imageType: ImageType.png,),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: controller.chatList[index]["sender"]["fullName"] ?? "---",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500
                                ),
                                CustomText(
                                  text: controller.chatList[index]["message"] ?? "----",
                                  fontSize: 12,
                                  color: AppColors.whiteDarkActive,
                                  textAlign: TextAlign.start,
                                  top: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}