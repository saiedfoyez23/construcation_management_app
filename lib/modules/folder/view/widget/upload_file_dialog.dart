import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadFileDialog extends StatelessWidget {
  const UploadFileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextWidget(
                  title: "Upload File",
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ],
            ),
            SizedBox(height: 15),
            Card(
              color: AppColors.gray,
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: StadiumBorder(),
                      color: AppColors.blue,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.upload, color: AppColors.white),
                      ),
                    ),
                    CustomTextWidget(
                      title: "Upload File",
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                CustomTextWidget(
                  title: "File Name",
                  color: AppColors.linerColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ],
            ),
            SizedBox(height: 8),
            CustomTextField(
              hintText: "Architectural",
              fillColor: AppColors.white,
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CustomButtonWidget(
                    onTap: () {
                      Get.back();
                    },
                    width: 133,
                    height: 40,
                    title: "Cancel",
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    cardColor: AppColors.gray,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomButtonWidget(
                    onTap: () {},
                    width: 140,
                    height: 40,
                    title: "Upload",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    cardColor: AppColors.blue,
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
