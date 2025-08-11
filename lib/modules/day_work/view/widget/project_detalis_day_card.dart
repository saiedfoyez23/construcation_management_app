import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ProjectDetalisDayCard extends StatelessWidget {
  const ProjectDetalisDayCard({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 20, width: 20),
            SizedBox(height: 5),
            CustomTextWidget(
              title: name,
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: AppColors.lightGray,
            ),
          ],
        ),
      ),
    );
  }
}
