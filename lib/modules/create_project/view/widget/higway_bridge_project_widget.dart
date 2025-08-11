import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class HighwayBridgeProjectWidget extends StatelessWidget {
  const HighwayBridgeProjectWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.text,
    required this.text1,
    required this.text2,
    required this.image,
    required this.image1,
    required this.image2,
    this.onTap,
  });

  final String title;
  final String subTitle;
  final String text;
  final String text1;
  final String text2;
  final String image;
  final String image1;
  final String image2;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: SizedBox(
        height: 240,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              SizedBox(height: 10),
              Row(
                children: [
                  Card(
                    color: AppColors.gray,
                    child: SizedBox(
                      height: 35,
                      width: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month, size: 15),
                          SizedBox(width: 3),
                          CustomTextWidget(title: text, color: AppColors.black),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: AppColors.gray,
                    child: SizedBox(
                      height: 35,
                      width: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 15),
                          SizedBox(width: 3),
                          CustomTextWidget(
                            title: text1,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      AppImages.image2,
                      height: 64,
                      width: 100,
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      AppImages.image1,
                      height: 64,
                      width: 100,
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    flex: 2,
                    child: Image.asset(AppImages.image, height: 64, width: 100),
                  ),
                ],
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    CustomTextWidget(
                      title: text2,
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, color: AppColors.blue, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
