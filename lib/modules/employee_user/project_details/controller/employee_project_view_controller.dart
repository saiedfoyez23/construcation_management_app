import 'dart:convert';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/home/model/employee_profile_response_model.dart';
import 'package:construction_management_app/modules/employee_user/project_details/model/get_employee_project_details_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/common.dart';

class EmployeeProjectViewController extends GetxController {
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<EmployeeProfileResponseModel> employeeProfileResponseModel = EmployeeProfileResponseModel().obs;
  Rx<GetEmployeeProjectDetailsResponseModel> getEmployeeProjectDetailsResponseModel = GetEmployeeProjectDetailsResponseModel().obs;
  RxBool isLoading = false.obs;
  String projectId;
  EmployeeProjectViewController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeProjectDetailsController(projectId: projectId);
    });
  }

  Future<void> getEmployeeProjectDetailsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));
      employeeProfileResponseModel.value = EmployeeProfileResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.getEmployeeProfileResponse)));
      print(employeeProfileResponseModel.value.data?.sId);
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.projectDetails}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeProjectDetailsResponseModel.value = GetEmployeeProjectDetailsResponseModel.fromJson(responseBody);
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


  String dateformating({required String date}) {
    String dateString = date;

    // Define the date format of the input string
    DateFormat format = DateFormat("MMM d, yyyy");

    // Parse into DateTime
    String formatedDate = format.format(DateTime.parse(date));

    return formatedDate; // Output: 2025-05-01 00:00:00.000
  }

}