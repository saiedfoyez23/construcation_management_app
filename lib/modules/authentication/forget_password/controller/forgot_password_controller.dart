import 'dart:convert';

import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/forget_password/view/email_verify_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';
import '../../../../data/api.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;



  Future<void> forgotPasswordController({
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
          api: Api.forgetPassword,
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.off(()=>EmailVerifyView(email: email),preventDuplicates: false);
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