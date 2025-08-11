import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/day_work/view/day_work_log_screen.dart';
import 'package:construction_management_app/modules/site_diary/view/edit_log_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayWorkViewCard extends StatelessWidget {
  const DayWorkViewCard({
    super.key,
    required this.title,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  final String title;
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String image;
  final String image1;
  final String image2;
  final String image3;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  title: title,
                  color: AppColors.deepBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                Row(
                  children: [
                    Image.asset(image, height: 18, width: 18),
                    SizedBox(width: 5),
                    CustomTextWidget(
                      title: text,
                      color: AppColors.linerColor,
                      fontSize: 14,
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.delete_outline, size: 20, color: AppColors.red),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Image.asset(image1, height: 12, width: 12),
                SizedBox(width: 5),
                CustomTextWidget(
                  title: text1,
                  color: AppColors.linerColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Image.asset(image2, height: 16, width: 16),
                SizedBox(width: 5),
                CustomTextWidget(
                  title: text2,
                  color: AppColors.linerColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => DayWorksLogScreen());
                  },
                  child: Row(
                    children: [
                      CustomTextWidget(
                        title: text3,
                        color: AppColors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => EditLogScreen());
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.gray,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(image3, height: 16, width: 16),
                        SizedBox(width: 5),
                        CustomTextWidget(
                          title: text4,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
