import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ChecklistInspectionCard extends StatelessWidget {
  const ChecklistInspectionCard({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              title: text,
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            Image.asset(image, height: 16, width: 16),
          ],
        ),
      ),
    );
  }
}
