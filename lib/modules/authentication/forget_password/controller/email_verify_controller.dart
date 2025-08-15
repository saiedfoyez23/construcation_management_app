import 'dart:convert';

import 'package:construction_management_app/modules/authentication/forget_password/view/new_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/app_color/app_color.dart';
import '../../../../common/custom_widget/custom_snackbar.dart';
import '../../../../data/api.dart';
import '../../../../data/base_client.dart';

class EmailVerifyController extends GetxController {

  RxInt timeCounter = 60.obs;
  RxString otp = "".obs;
  RxBool isLoading = false.obs;
  RxBool isResendOtpSend = false.obs;
  Rx<TextEditingController> pinController = TextEditingController().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await otpTimer();
    });
  }

  Future<void> otpTimer() async {
    Future.delayed(Duration(seconds: 1), () async {
      if(timeCounter > 0) {
        timeCounter.value = timeCounter.value - 1;
        otpTimer();
      } else {
        timeCounter.value = 0;
      }
    });
  }


  Future<void> forgotPasswordResendOtpController({required Map<String,dynamic> data,}) async {
    try {
      isResendOtpSend(true);

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.forgetPassword,
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        timeCounter.value = 60;
        pinController.value.clear();
        await otpTimer();
      } else {
        isResendOtpSend(false);
        throw 'Send data is failed!';
      }
    } catch (e) {
      isResendOtpSend(false);
      kSnackBar(message: "Send data is failed: $e", bgColor: AppColors.red);
    } finally {
      isResendOtpSend(false);
    }
  }


  Future<void> forgotPasswordOtpVerifyController({
    required Map<String,dynamic> data,
    required String email
  }) async {
    try {
      isLoading(true);

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.forgetOtp,
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.off(()=>NewPasswordView(email: email,),preventDuplicates: false);
      } else {
        isLoading(false);
        throw 'Send data is failed!';
      }
    } catch (e) {
      isLoading(false);
      kSnackBar(message: "Send data is failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }




}