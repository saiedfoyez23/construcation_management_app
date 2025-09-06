import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/planning/model/get_employee_all_plan_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/common.dart';

class EmployeeGetPlaningController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  Rx<GetEmployeeAllPlanResponseModel> getEmployeeAllPlanResponseModel = GetEmployeeAllPlanResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  String projectId;
  EmployeeGetPlaningController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeAllPlaningController(projectId: projectId);
    });
  }



  Future<void> getEmployeeAllPlaningController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getAllPlans}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeAllPlanResponseModel.value = GetEmployeeAllPlanResponseModel.fromJson(responseBody);
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

  Future<void> deleteEmployeePlaningController({required String planingId,required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.deleteRequest(
          api: "${Api.deletePlans}/${planingId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.back();
        kSnackBar(message: "Site diary delete successful", bgColor: AppColors.green);
        await getEmployeeAllPlaningController(projectId: projectId);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Site diary  Retrieve is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Site diary  Retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isDelete(false);
    }

  }



}