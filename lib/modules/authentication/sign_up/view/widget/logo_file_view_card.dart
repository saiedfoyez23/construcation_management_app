import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class LogoFileViewCard extends StatelessWidget {
  const LogoFileViewCard({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.camera_alt, size: 35, color: AppColors.black),
                SizedBox(width: 15),
                CustomTextWidget(
                  title: "Logo-file.png",
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: AppColors.black,
                ),
              ],
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.delete, color: AppColors.red),
            ),
          ],
        ),
      ),
    );
  }
}
