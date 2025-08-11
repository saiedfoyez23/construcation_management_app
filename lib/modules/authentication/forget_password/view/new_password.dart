import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_loader.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_form_field_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/authentication/forget_password/controller/forget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ForgetController forgetController = Get.put(ForgetController());
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 130),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Set New Password",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    CustomTextWidget(
                      maxLines: 2,
                      title:
                          "Enter your new password and make sure\nyou remember it",
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.lightGray,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextFromFieldWidget(
                  hintText: "tan@gmail.com",
                  controller: email,
                  validator: (value) {
                    if (value == null || value == '') {
                      return "email can't be empty";
                    } else if (!(value.toString().contains(".") ||
                        value.contains("@"))) {
                      return "your valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                CustomTextFromFieldWidget(
                  isPassword: true,
                  hintText: "Enter samePassword",
                  controller: password,
                  validator: (value) {
                    if (value == null || value == '') {
                      return "samePassword can't be empty";
                    } else if (value.length < 6) {
                      return "samePassword must be at least 6 characters long";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Obx(
                  () =>
                      forgetController.isLoading.value == true
                          ? CustomLoaderButton()
                          : CustomButtonWidget(
                            onTap: () {
                              forgetController.newPassword(
                                email: email.text,
                                password: password.text,
                              );
                            },
                            title: "Reset Password",
                            cardColor: AppColors.linerColor,
                            color: AppColors.white,
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
