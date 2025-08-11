import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String message;

  const NotificationWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.notifi, width: 36, height: 32),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: TextStyle(fontSize: 14, color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
