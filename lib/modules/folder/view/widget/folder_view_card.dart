import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class FolderViewCard extends StatelessWidget {
  const FolderViewCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image, height: 40, width: 40),
                SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      title: title,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                    CustomTextWidget(
                      title: subtitle,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.linerColor,
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.delete_outline, size: 20,color: AppColors.red,),
          ],
        ),
      ),
    );
  }
}
