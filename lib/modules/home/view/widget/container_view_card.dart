import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ContainerViewCard extends StatelessWidget {
  const ContainerViewCard({super.key, this.icon, required this.text});

  final Icon? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: SizedBox(
        height: 80,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Icon(Icons.calendar_month, size: 25),
            SizedBox(height: 5),
            CustomTextWidget(title: text, color: AppColors.deepBlack),
          ],
        ),
      ),
    );
  }
}
