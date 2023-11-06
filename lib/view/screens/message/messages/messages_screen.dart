import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/message/messages/inner_widgets/message_list.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  @override
  void initState() {
    final socketService = Get.find<SocketService>();
    socketService.getAllChats("65485c8a813dd635e2a82023");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomText(
              text: AppStrings.message,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        body: GetBuilder<SocketService>(
          builder: (controller) => LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: controller.isLoading ? const Center(
                  child: CircularProgressIndicator(color: AppColors.blackNormal),
                ) : controller.chatList.isEmpty ? const SizedBox() : MessageList(),
              );
            },
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
      ),
    );
  }
}
