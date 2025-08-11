import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/sign_up_screen.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.background2)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset(
                      AppImages.siteflow,
                      height: 102,
                      width: 102,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 140),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Master Your\nConstruction\nWorkflow",
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CustomTextWidget(
                      title:
                          "Log Tasks, Track Day Works – Plan\nEfficiently with Ease",
                      color: AppColors.lightGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    //Get.to(() => SignInScreen());
                  },
                  child: CustomButtonWidget(
                    title: "Sign In",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    cardColor: AppColors.black,
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignUpScreen());
                  },
                  child: CustomButtonWidget(
                    border: Border.all(color: AppColors.black),
                    title: "Open Create",
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    cardColor: AppColors.white,
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
