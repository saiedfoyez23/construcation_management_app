import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/splash/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});

  final SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.h(context),
        width: 375.w(context),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.background)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ImageHelperClass.customImageContainer(
                context: context,
                height: 190.h(context),
                width: 190.w(context),
                imagePath: AppImages.siteflow1,
                fit: BoxFit.cover,
                imageFit: BoxFit.contain,
              ),


            ],
          ),
        ),
      ),
    );
  }
}

