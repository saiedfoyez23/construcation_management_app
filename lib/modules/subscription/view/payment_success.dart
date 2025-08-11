import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: CustomTextWidget(
          title: "Successfully",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(AppImages.payment, height: 240, width: 240),
            SizedBox(height: 20),
            CustomTextWidget(
              title: " Your Payment\nSuccessfully Done",
              textAlign: TextAlign.center,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ],
        ),
      ),
    );
  }
}
