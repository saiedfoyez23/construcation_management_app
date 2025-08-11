import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CreateViewCard extends StatelessWidget {
  const CreateViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: AppColors.white),
          SizedBox(width: 5),
          CustomTextWidget(title: "Create Job"),
        ],
      ),
    );
  }
}
