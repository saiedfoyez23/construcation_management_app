import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/create_project/controller/create_project_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupervisorViewCard extends StatelessWidget {
  const SupervisorViewCard({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    CreateProjectController controller = Get.put(CreateProjectController());
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.gray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 15, backgroundImage: AssetImage(image)),
          SizedBox(width: 8),
          CustomTextWidget(
            title: text,
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(width: 8),
          Icon(Icons.close, size: 15, color: Colors.red),
        ],
      ),
    );
  }
}
