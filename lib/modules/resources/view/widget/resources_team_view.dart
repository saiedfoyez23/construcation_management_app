import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/message/view/group_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourcesTeamCard extends StatelessWidget {
  const ResourcesTeamCard({
    super.key,
    required this.name,
    required this.subTile,
    required this.imageUrl,
  });

  final String name;
  final String subTile;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      child: ListTile(
        // shape: Border.all(color: AppColors.black),
        leading: CircleAvatar(backgroundImage: AssetImage(imageUrl)),
        title: CustomTextWidget(
          title: name,
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
        subtitle: CustomTextWidget(
          title: subTile,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.lightGray,
        ),
        trailing: GestureDetector(
          onTap:(){
            Get.to(()=>GroupMessage());
          },
          child: Image.asset(
            AppImages.message,
            width: 24,
            height: 24,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
