import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/data/dummy_data.dart';
import 'package:construction_management_app/modules/notification/view/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Sample data for notifications
  final List<Map<String, String>> notifications = [
    {
      'message':
          'Your subscription will renew on June 1, 2025. Please update your payment method if necessary.',
    },
    {
      'message':
          'Concrete pour for foundation completed and approved by Supervisor John.',
    },
    {
      'message':
          'Your subscription will renew on June 1, 2025. Please update your payment method if necessary.',
    },
    {
      'message':
          'Concrete pour for foundation completed and approved by Supervisor John.',
    },
    {'message': 'Supervisor Sarah Khan has been added to your company.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Notifications'),
        backgroundColor: AppColors.background,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: ListView.builder(
          itemCount: DummyData.notifications.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: NotificationWidget(
                message: notifications[index]['message']!,
              ),
            );
          },
        ),
      ),
    );
  }
}
