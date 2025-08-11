import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class FileChooseViewCard extends StatelessWidget {
  const FileChooseViewCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.gray, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.upload, size: 30, color: AppColors.lightGray),
          SizedBox(height: 5),
          InkWell(
            onTap: onTap,
            child: CustomButtonWidget(
              title: "Chose File",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              cardColor: AppColors.blue,
              width: 100,
              height: 42,
            ),
          ),
          SizedBox(height: 5),
          CustomTextWidget(title: "PNG ,JPG up to 2MB", color: AppColors.black),
        ],
      ),
    );
  }
}
