import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard.dart';
import 'package:construction_management_app/modules/welcome/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      var token = LocalStorage.getData(key: AppConstant.token);
      Get.to(() => WelcomeScreen());
      //Get.to(() => Dashboard());
      // if (token != '') {
      //   Get.to(() => Dashboard()); // Navigate to the home screen
      // } else {
      //   Get.to(() => WelcomeScreen()); // Navigate to the home screen
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.background)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.siteflow1, width: 190, height: 190),
            ],
          ),
        ),
      ),
    );
  }
}
