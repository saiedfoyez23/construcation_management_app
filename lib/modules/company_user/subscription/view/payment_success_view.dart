import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/subscription/controller/payment_success_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccessView extends StatelessWidget {
  PaymentSuccessView({super.key});

  final PaymentSuccessController paymentSuccessController = Get.put(PaymentSuccessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.h(context),
        width: 375.w(context),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackGroundColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              ImageHelperClass.customImageContainer(
                context: context,
                height: 240.h(context),
                width: 240.w(context),
                imagePath: AppImages.payment,
                imageFit: BoxFit.contain,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),


              TextHelperClass.headingText(
                alignment: Alignment.center,
                textAlign: TextAlign.center,
                context: context,
                text: " Your Payment\nSuccessfully Done",
                fontSize: 23,
                textColor: Color.fromRGBO(13, 18, 14, 1),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

