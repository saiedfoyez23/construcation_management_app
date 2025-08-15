import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:convert';

class SignInController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isObscureText = true.obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel(success: null, message: null, data: null).obs;

  // RxList<String> roles = [
  //   'Company Admin',
  //   'Supervisor',
  //   'Project Manager'
  // ].obs;
  // RxString selectedRole = "".obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  // Sign In
  Future<void> signInController({
    required String email,
    required String password,
  }) async {
    try {
      isLoading(true);

      var map = {
        "email": email,
        "password": password,
      };
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.login,
          headers: headers,
          body: jsonEncode(map),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        String token = responseBody['data']['accessToken'].toString();
        log(token);
        LocalStorage.saveData(key: AppConstant.token, data: jsonEncode(responseBody));
        kSnackBar(message: message, bgColor: AppColors.green);
        print("${LocalStorage.getData(key: AppConstant.token)}");
        await checkTheUserLogin();
      } else {
        throw "Sign in Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Sign in Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }



  Future<void> checkTheUserLogin() async {
    print(LocalStorage.getData(key: AppConstant.token));
    if(LocalStorage.getData(key: AppConstant.token) != null) {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));
      Map<String, dynamic> decodedToken = parseJwt(loginResponseModel.value.data!.accessToken!);
      if(decodedToken['role'] == "company_admin") {
        Get.off(()=>DashboardView(index: 0,),);
      } else {
        print("No Redirection");
      }
    } else {
      print("empty jwt");
    }
  }






  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
      case 3:
        output += '=' * (4 - output.length % 4);
        break;
    }

    return utf8.decode(base64Url.decode(output));
  }

}
