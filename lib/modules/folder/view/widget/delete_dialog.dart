import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        child: Column(
          children: [
            Image.asset(AppImages.deleted, height: 45, width: 45),
            SizedBox(height: 15),
            CustomTextWidget(
              title: "Delete SafeZone?",
              color: AppColors.linerColor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
            SizedBox(height: 10),
            CustomTextWidget(
              maxLines: 2,
              title:
                  "Are you sure you want to delete this item? This action cannot be undone.",
              color: AppColors.lightGray,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomButtonWidget(
              onTap: () {
                Get.back();
              },
              height: 45,
              borderRadius: BorderRadius.circular(8),
              title: "Delete",
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              cardColor: AppColors.red,
            ),
            SizedBox(height: 15),
            CustomButtonWidget(
              onTap: () {
                Get.back();
              },
              height: 45,
              borderRadius: BorderRadius.circular(8),
              title: "Cancel",
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              cardColor: AppColors.gray,
            ),
          ],
        ),
      ),
    );
  }
}
