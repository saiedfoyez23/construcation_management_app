import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:convert';

class SignInController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isObscureText = true.obs;
  RxList<String> roles = [
    'Company Admin',
    'Supervisor',
    'Project Manager'
  ].obs;
  RxString selectedRole = "".obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  ///Login
  Future loginController({
    required String email,
    required String password,
  }) async {
    try {
      isLoading(true);
      var map = {"email": email.toLowerCase(), "password": password};

      var headers = {'Content-Type': 'application/json'};

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.login,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        String token = responseBody['data']['accessToken'].toString();
        log(token);
        LocalStorage.saveData(key: AppConstant.token, data: token);

        kSnackBar(message: message, bgColor: AppColors.green);

        Get.to(Dashboard());

        isLoading(false);
      } else {
        throw 'SignIn in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }
}
