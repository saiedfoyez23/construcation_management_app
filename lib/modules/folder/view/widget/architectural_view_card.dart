import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/folder/view/widget/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchitecturalViewCard extends StatelessWidget {
  const ArchitecturalViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [Image.asset(AppImages.filepdf, height: 40, width: 40)],
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: "Architectural-01.pdf",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    CustomContainerTextView(
                      height: 30,
                      width: 105,
                      image: AppImages.download,
                      text: "Download",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(width: 15),
                    CustomContainerTextView(
                      height: 30,
                      width: 90,
                      cardColor: AppColors.gray,
                      image: AppImages.eye,
                      text: "Open",
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.black,
                      imageColor: AppColors.black,
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.dialog(AlertDialog(
                    backgroundColor: AppColors.white,
                    content: DeleteDialog()));
              },
              child: Icon(Icons.delete_outline, size: 25, color: AppColors.red),
            ),
          ],
        ),
      ),
    );
  }
}
