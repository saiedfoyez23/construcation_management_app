import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordSuccessful extends StatefulWidget {
  const PasswordSuccessful({super.key});

  @override
  State<PasswordSuccessful> createState() => _PasswordSuccessfulState();
}

class _PasswordSuccessfulState extends State<PasswordSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(AppImages.success, height: 82, width: 82),
                    Positioned(
                      left: 56,
                      top: 60,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.greenAccent.shade700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomTextWidget(
                  title: "Success",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      textAlign: TextAlign.center,
                      title: "Your password has been\nsuccessfully reset",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors.lightGray,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    //Get.to(() => SignInScreen());
                  },
                  child: CustomButtonWidget(
                    title: "Back to Log In",
                    cardColor: AppColors.white,
                    color: AppColors.black,
                    border: Border.all(color: AppColors.black),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
