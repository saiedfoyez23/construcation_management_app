import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_loader.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SignUpOtpVerification extends StatefulWidget {
  final String name;
  final String companyName;
  final String email;
  final String password;

  const SignUpOtpVerification({
    super.key,
    required this.name,
    required this.companyName,
    required this.email,
    required this.password,
  });

  @override
  State<SignUpOtpVerification> createState() => _SignUpOtpVerificationState();
}

class _SignUpOtpVerificationState extends State<SignUpOtpVerification> {
  final TextEditingController otpController = TextEditingController();
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
      final signupController = Get.find<SignUpController>();
      signupController
          .signupController(
            name: widget.name,
            companyname: widget.companyName,
            email: widget.email,
            password: widget.password,
          )
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
    SignUpController signupController = Get.find<SignUpController>();
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                      title: "Account Verification",
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
                  maxLines: 3,
                  title:
                      "We have sent a code to ${widget.email} to verify your registration",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.lightGray,
                ),
                SizedBox(height: 25),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: otpController,
                  onChanged: (value) {},
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 50,
                    fieldWidth: 45,
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
                      signupController.isLoadingNow.value
                          ? CustomLoaderButton()
                          : CustomButtonWidget(
                            title: "Verify",
                            cardColor: AppColors.gray,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            onTap: () {
                              if (otpController.text.length == 6) {
                                signupController.signUpVerifyController(
                                  email: widget.email,
                                  otp: otpController.text.trim(),
                                );
                              } else {
                                Get.snackbar(
                                  "Error",
                                  "Please enter a valid 6-digit OTP",
                                  backgroundColor: AppColors.red,
                                  colorText: AppColors.white,
                                );
                              }
                            },
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   otpController.dispose();
  //   super.dispose();
  // }
}
