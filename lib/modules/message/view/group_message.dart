import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/message/view/send_message.dart';
import 'package:construction_management_app/modules/message/view/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupMessage extends StatefulWidget {
  const GroupMessage({super.key});

  @override
  State<GroupMessage> createState() => _GroupMessageState();
}

class _GroupMessageState extends State<GroupMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: CustomTextWidget(
          title: "Message",
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => SendMessage());
            },
            child: MessageCard(
              title: 'Highway Bridge Project',
              subtitle: 'Lorem ipsum dolor sit amet consectetur',
              count: 5,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => SendMessage());
            },
            child: MessageCard(
              title: 'Highway Bridge Project',
              subtitle: 'Lorem ipsum dolor sit amet consectetur',
              count: 5,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => SendMessage());
            },
            child: MessageCard(
              title: 'Highway Bridge Project',
              subtitle: 'Lorem ipsum dolor sit amet consectetur',
              count: 5,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => SendMessage());
            },
            child: MessageCard(
              title: 'Highway Bridge Project',
              subtitle: 'Lorem ipsum dolor sit amet consectetur',
              count: 5,
            ),
          ),
        ],
      ),
    );
  }
}
