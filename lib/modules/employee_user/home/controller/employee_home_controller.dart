import 'dart:convert';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/create_project/model/get_all_project_response_model.dart';
import 'package:construction_management_app/modules/employee_user/home/model/employee_profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/common.dart';

class EmployeeHomeController extends GetxController {
  Rx<EmployeeProfileResponseModel> employeeProfileResponseModel = EmployeeProfileResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<EmployeeGetAllProjectResponseModel> employeeGetAllProjectResponseModel = EmployeeGetAllProjectResponseModel().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeProfileController();
      await getEmployeeProject();
    });
  }


  Future<void> getEmployeeProfileController() async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.employeeProfile,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        employeeProfileResponseModel.value = EmployeeProfileResponseModel.fromJson(responseBody);
        LocalStorage.saveData(key: AppConstant.getEmployeeProfileResponse, data: jsonEncode(responseBody));
        await checkTheProfileResponse();
      } else {
        throw "Get profile is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Get profile is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }


  Future<void> checkTheProfileResponse() async {
    if(LocalStorage.getData(key: AppConstant.getEmployeeProfileResponse) != null) {
      employeeProfileResponseModel.value = EmployeeProfileResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.getEmployeeProfileResponse)));
    } else {
      employeeProfileResponseModel.value = EmployeeProfileResponseModel();
    }
  }

  Future<void> getEmployeeProject() async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.myProject}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        employeeGetAllProjectResponseModel.value = EmployeeGetAllProjectResponseModel.fromJson(responseBody);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Get profile is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Get profile is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }



}