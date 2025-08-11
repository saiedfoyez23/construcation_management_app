import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class DelayCardView extends StatelessWidget {
  const DelayCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFEBF2FF),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AppImages.delay, height: 20, width: 20),
                SizedBox(width: 5),
                CustomTextWidget(
                  title: "Delay",
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CustomTextWidget(
                  title:
                      "Rain delay caused a 2-hour pause in work.\nAdditional workers assigned for cleanup",
                  color: AppColors.linerColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
