import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ValleySchoolViewCard extends StatelessWidget {
  const ValleySchoolViewCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.text,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final String text;
  final String text1;
  final String text2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: title,
              color: AppColors.deepBlack,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.lightGray, size: 20),
                SizedBox(width: 5),
                CustomTextWidget(
                  title: subTitle,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.lightGray,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    color: AppColors.gray,
                    child: SizedBox(
                      height: 35,
                      width: 135,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 2),
                          Icon(Icons.calendar_month, size: 15),
                          CustomTextWidget(title: text, color: AppColors.black),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3),
                Expanded(
                  child: Card(
                    color: AppColors.gray,
                    child: SizedBox(
                      height: 35,
                      width: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 15),
                          CustomTextWidget(
                            title: text1,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3),
                Expanded(
                  child: SizedBox(
                    height: 35,
                    width: 90,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Row(
                        children: [
                          CustomTextWidget(
                            title: text2,
                            color: AppColors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
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
