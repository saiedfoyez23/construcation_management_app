import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterShowDialog extends StatelessWidget {
  const FilterShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
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
                  title: "Filter",
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                CustomTextWidget(
                  title: "Data",
                  color: AppColors.gray,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    height: 42,
                    width: 250,
                    hintText: "Select",
                    fillColor: AppColors.white,
                    suffixIcon: Icon(Icons.calendar_month, size: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
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
                    onTap: () {
                      Get.back();
                    },
                    width: 140,
                    height: 40,
                    title: "Apply Filter",
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
