import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ProfileViewCard extends StatelessWidget {
  const ProfileViewCard({super.key, this.icon, this.icon2, required this.text});

  final Icon? icon;
  final Icon? icon2;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon ?? Icon(Icons.person, color: AppColors.blue),
                  SizedBox(width: 15),
                  CustomTextWidget(
                    title: text,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              icon2 ?? Icon(Icons.arrow_forward_ios_outlined, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
