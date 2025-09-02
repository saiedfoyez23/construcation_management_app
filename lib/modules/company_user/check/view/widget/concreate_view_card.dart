import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ConcreateViewCard extends StatelessWidget {
  const ConcreateViewCard({super.key, required this.text, required this.text1});

  final String text;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          title: text,
          color: AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        CustomTextWidget(
          title: text1,
          color: AppColors.gray,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
