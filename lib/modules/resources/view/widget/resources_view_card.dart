import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ResourcesViewCard extends StatelessWidget {
  const ResourcesViewCard({super.key, required this.image, required this.text, required this.title});
  final String image;
  final String text;
  final String title;

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
            Row(
              children: [
                Image.asset(image, height: 14, width: 14),
                SizedBox(width: 5),
                CustomTextWidget(
                  title: text,
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: 3),
                CustomTextWidget(
                  title: title,
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Icon(Icons.delete_outlined, color: AppColors.red, size: 20),
          ],
        ),
      ),
    );
  }
}
