import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_loader.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_form_field_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/authentication/forget_password/controller/forget_controller.dart';
import 'package:construction_management_app/modules/authentication/forget_password/view/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ForgetController forgetController = Get.put(ForgetController());
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      title: "Forget Password",
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
                      maxLines: 3,
                      title:
                          "We will send the OTP code to your phone\nnumber for security in forgetting your\npassword",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.5,
                      color: AppColors.lightGray,
                    ),
                  ],
                ),
                SizedBox(height: 35),
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
                SizedBox(height: 50),
                Obx(
                  () =>
                      forgetController.isLoading.value == true
                          ? CustomLoaderButton()
                          : CustomButtonWidget(
                            onTap: () {
                              Get.to(OtpVerification(email: email.text));
                              // forgetController.forgetPassword(
                              //   email: email.text,
                              // );
                            },
                            title: "Send Verification Code",
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
