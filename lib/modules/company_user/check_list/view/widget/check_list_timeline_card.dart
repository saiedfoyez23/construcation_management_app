import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CheckListTimelineCard extends StatelessWidget {
  const CheckListTimelineCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.text,
  });

  final String title;
  final String subTitle;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: title,
              color: AppColors.subText,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            SizedBox(height: 5),
            CustomTextWidget(
              title: subTitle,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            CustomTextWidget(
              title: text ?? '',
              color: AppColors.linerColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
