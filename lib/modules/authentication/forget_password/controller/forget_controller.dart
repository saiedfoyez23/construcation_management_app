import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/forget_password/view/new_password.dart';
import 'package:construction_management_app/modules/authentication/forget_password/view/otp_verification.dart';
import 'package:construction_management_app/modules/authentication/password_successful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ForgetController extends GetxController {
  var isLoading = false.obs;
  var isLoadingNow = false.obs;

  Future forgetPassword({required String email}) async {
    try {
      isLoading(true);
      var map = {"email": email.toLowerCase()};

      var headers = {
        //  'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.forgetPassword,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();

        kSnackBar(message: message, bgColor: AppColors.green);
        Get.to(OtpVerification(email: email));

        isLoading(false);
      } else {
        throw 'Forget in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }

  Future forgetOtpController({
    required String email,
    required String otp,
  }) async {
    try {
      isLoading(true);
      var map = {"email": email.toLowerCase(), "otp": otp};
      var headers = {
        //  'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.forgetOtp,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.to(NewPassword());
        isLoading(false);
      } else {
        throw 'Otp in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }

  Future newPassword({required String email, required String password}) async {
    try {
      isLoading(true);
      var map = {"email": email, "password": password};

      var headers = {
        //  'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.resetForgetPassword,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();

        kSnackBar(message: message, bgColor: AppColors.green);
        Get.to(PasswordSuccessful());

        isLoading(false);
      } else {
        throw 'Forget in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }
}
