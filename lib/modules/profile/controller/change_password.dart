import 'dart:convert';

import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  Future changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      isLoading(true);
      final token = LocalStorage.getData(key: AppConstant.token);
      var map = {"old_password": oldPassword, "new_password": newPassword};
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.changePassword,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        //Get.offAll(SignInScreen());
      } else {
        throw 'Reset password failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::::: $e");
      kSnackBar(message: "Error changing password: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}
