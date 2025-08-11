import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ResourcesUsedViewCard extends StatelessWidget {
  const ResourcesUsedViewCard({
    super.key,
    required this.image,
    required this.titel,
    required this.text,
  });

  final String image;
  final String titel;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(image, height: 12, width: 12),
            SizedBox(width: 5),
            CustomTextWidget(
              title: titel,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.linerColor,
            ),
          ],
        ),
        CustomTextWidget(
          title: text,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.linerColor,
        ),
      ],
    );
  }
}
