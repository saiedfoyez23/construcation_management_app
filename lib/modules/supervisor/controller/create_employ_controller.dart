import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/supervisor/view/employ_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEmployController extends GetxController {
  var isLoading = false.obs;

  final TextEditingController type = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController employeeId = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future postCreateEmployee({
    required String type,
    required String name,
    required String employeeId,
    required String email,
    required String phone, // Changed to String
    required String password,
  }) async {
    try {
      isLoading(true);
      final token = await LocalStorage.getData(key: AppConstant.token);

      if (token == null || token.isEmpty) {
        Get.snackbar('Error', 'Token not found. Please log in again.');
        debugPrint("No token found in LocalStorage");
        return;
      }
      var map = {
        "type": type,
        "name": name, // Fixed key from "location" to "name"
        "employee_id": employeeId,
        "email": email,
        "phone": phone,
        "password": password,
      };
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.createEmployees,
          body: jsonEncode(map),
          headers: headers,
        ),
      );
      if (responseBody != null) {
        final message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: Colors.green);
        Get.offAll(EmployListScreen());
      } else {
        throw 'Create employee Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error: $e");
      Get.snackbar('Error', 'Failed to create employee: $e');
    } finally {
      isLoading(false);
    }
  }
}
