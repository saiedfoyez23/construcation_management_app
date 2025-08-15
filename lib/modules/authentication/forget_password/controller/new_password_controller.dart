import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/app_color/app_color.dart';
import '../../../../common/custom_widget/custom_snackbar.dart';
import '../../../../data/api.dart';
import '../../../../data/base_client.dart';
import '../view/password_success_full_view.dart';

class NewPasswordController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isObscureText = true.obs;
  RxBool isConfirmObscureText = true.obs;

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;


  Future<void> setPasswordController({
    required Map<String,dynamic> data,
  }) async {
    try {
      isLoading(true);

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.resetForgetPassword,
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.off(()=>PasswordSuccessFullView(),preventDuplicates: false);
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