import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/sign_up_otp_verify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var isLoadingNow = false.obs;

  /// SignUp
  Future signupController({
    required String name,
    required String companyname,
    required String email,
    required String password,
  }) async {
    try {
      isLoading(true);
      var map = {
        "name": name,
        "company_name": companyname,
        "email": email.toLowerCase(),
        "password": password,
      };

      var headers = {'Content-Type': 'application/json'};

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.signup,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.to(
          SignUpOtpVerification(
            name: name,
            companyName: companyname,
            email: email,
            password: password,
          ),
        );
      } else {
        throw 'Sign Up Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
      kSnackBar(message: "Sign Up Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

  /// Sign Verify (OTP Verification)
  Future signUpVerifyController({
    required String email,
    required String otp,
  }) async {
    try {
      isLoadingNow(true);
      var map = {"email": email, "otp": otp, "verify_account": true};

      var headers = {'Content-Type': 'application/json'};

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.signVerify,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        //Get.to(SignInScreen());
      } else {
        throw 'OTP Verification Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
      kSnackBar(message: "OTP Verification Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoadingNow(false);
    }
  }
}
