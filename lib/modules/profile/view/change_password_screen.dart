import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_loader.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_form_field_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/profile/controller/change_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePasswordController controller = Get.put(ChangePasswordController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text("Change Password"),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 150),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Old Password",
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomTextFromFieldWidget(
                  isPassword: true,
                  hintText: "Enter Old password",
                  controller: controller.oldPassword,
                  validator: (value) {
                    if (value == null || value == '') {
                      return "password can't be empty";
                    } else if (value.length < 6) {
                      return "password must be at least 8 characters long";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "New Password",
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomTextFromFieldWidget(
                  isPassword: true,
                  hintText: "Enter New Password",
                  controller: controller.newPassword,
                  validator: (value) {
                    if (value == null || value == '') {
                      return "samePassword can't be empty";
                    } else if (value.length < 6) {
                      return "samePassword must be at least 8 characters long";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                Obx(
                  () =>
                      controller.isLoading.value == true
                          ? CustomLoaderButton()
                          : CustomButtonWidget(
                            onTap: () {
                              controller.changePassword(
                                oldPassword: controller.oldPassword.text,
                                newPassword: controller.newPassword.text,
                              );
                            },
                            height: 45,
                            title: "Save",
                            cardColor: AppColors.linerColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
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
