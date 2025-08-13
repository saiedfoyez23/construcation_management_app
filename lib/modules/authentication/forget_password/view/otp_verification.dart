import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_loader.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/authentication/forget_password/controller/forget_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'new_password.dart';

class OtpVerification extends StatefulWidget {
  final String email;
  const OtpVerification({super.key, required this.email});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final TextEditingController otp = TextEditingController();

  int _secondsRemaining = 59;
  bool _canResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _canResend = false;
    _secondsRemaining = 59;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
          timer.cancel();
        });
      }
    });
  }

  void _resendOtp() {
    if (_canResend) {
      final forgetController = Get.find<ForgetController>();
      forgetController
          .forgetPassword(email: widget.email)
          .then((_) {
            Get.snackbar(
              "Success",
              "OTP has been resent to ${widget.email}",
              backgroundColor: AppColors.black,
              colorText: AppColors.white,
            );
            _startTimer(); // Restart the timer after resending OTP
          })
          .catchError((error) {
            Get.snackbar(
              "Error",
              "Failed to resend OTP. Please try again.",
              backgroundColor: AppColors.red,
              colorText: AppColors.white,
            );
          });
    }
  }

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
                      title: "OTP Verification",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Enter 6-digit Code",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomTextWidget(
                  maxLines: 2,
                  title:
                      "We have send to ${widget.email} tp verify your registration",
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppColors.lightGray,
                ),
                SizedBox(height: 25),
                PinCodeTextField(
                  controller: otp,
                  appContext: context,
                  length: 6,
                  onChanged: (value) {},
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 60,
                    fieldWidth: 50,
                    activeColor: Colors.black,
                    selectedColor: Colors.blue,
                    inactiveColor: Colors.grey.shade400,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    GestureDetector(
                      onTap: _resendOtp,
                      child: CustomTextWidget(
                        title: "Resend code  ",
                        fontSize: 14,
                        color:
                            _canResend ? AppColors.blue : AppColors.lightGray,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CustomTextWidget(
                      title:
                          _secondsRemaining > 0 ? "${_secondsRemaining}s" : "",
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Obx(
                  () =>
                      forgetController.isLoading.value == true
                          ? CustomLoaderButton()
                          : CustomButtonWidget(
                            onTap: () {
                              Get.to(NewPassword());
                              // forgetController.forgetOtpController(
                              //   email: widget.email,
                              //   otp: otp.text,
                              // );
                            },
                            title: "Verify",
                            cardColor: AppColors.gray,
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
