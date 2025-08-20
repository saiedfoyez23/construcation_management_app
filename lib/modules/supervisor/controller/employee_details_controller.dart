import 'dart:convert';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/supervisor/model/get_single_employee_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color/app_color.dart';
import '../../../common/custom_widget/custom_snackbar.dart';
import '../../../common/local_store/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';

class EmployeeDetailsController extends GetxController {
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetSingleEmployeeResponseModel> getSingleEmployeeResponseModel = GetSingleEmployeeResponseModel().obs;
  RxBool isLoading = false.obs;

  String employeeId;
  EmployeeDetailsController({required this.employeeId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeDetailsController(employeeId: employeeId);
    });
  }


  Future<void> getEmployeeDetailsController({required String employeeId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(
          jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getAllCompanyEmployees}/${employeeId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getSingleEmployeeResponseModel.value = GetSingleEmployeeResponseModel.fromJson(responseBody);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }


}