import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
  });
  final String title;
  final String subtitle;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(AppImages.darleneprofile),
        ),
        title: CustomTextWidget(
          title: title,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.black,
        ),
        subtitle: CustomTextWidget(
          title: subtitle,
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: AppColors.black,
        ),
        trailing: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: CustomTextWidget(
              title: "$count",
              fontSize: 13,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
