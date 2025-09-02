import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/company_user/supervisor/model/get_all_company_employee_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class CreateProjectController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxBool isTypeLoading = false.obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetAllCompanyEmployeeResponseModel> getAllCompanyEmployeeResponseModel = GetAllCompanyEmployeeResponseModel().obs;
  Rx<GetAllCompanyEmployee> supervisorCompanyEmployee = GetAllCompanyEmployee().obs;
  Rx<GetAllCompanyEmployee> managerCompanyEmployee = GetAllCompanyEmployee().obs;
  RxList<GetAllCompanyEmployee> getAllCompanyEmployeeList = <GetAllCompanyEmployee>[].obs;
  RxList<GetAllCompanyEmployee> searchAllCompanyEmployeeList = <GetAllCompanyEmployee>[].obs;
  Rx<TextEditingController> clientNameController = TextEditingController().obs;
  Rx<TextEditingController> projectNameController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> timelineController = TextEditingController().obs;
  Rx<TextEditingController> noteController = TextEditingController().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<DateTime> date = DateTime.now().obs;


  Future<void> onRefreshVariable() async {
    getAllCompanyEmployeeResponseModel = GetAllCompanyEmployeeResponseModel().obs;
    searchAllCompanyEmployeeList.clear();
    getAllCompanyEmployeeList.clear();
  }


  Future<void> pickDateTime({required BuildContext context}) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      timelineController.value.text = "${picked.start}_${picked.end}";
    }
  }

  // Method to set selected supervisor


  Future<void> getAllCompanyEmployeeByTypeController({required String type}) async {
    try {
      isTypeLoading(true);
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getAllCompanyEmployees}?type=${type}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getAllCompanyEmployeeResponseModel.value = GetAllCompanyEmployeeResponseModel.fromJson(responseBody);
        getAllCompanyEmployeeResponseModel.value.data?.data?.forEach((value) {
          getAllCompanyEmployeeList.add(value);
          searchAllCompanyEmployeeList.add(value);
        });
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Get profile is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Get profile is Failed: $e", bgColor: AppColors.red);
    } finally {
      isTypeLoading(false);
    }
  }

  Future<void> createProjectController({required Map<String,dynamic> data}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.createProject,
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.off(()=>DashboardView(index: 1),preventDuplicates: false);
        kSnackBar(message: "Project create successful", bgColor: AppColors.green);
      } else {
        throw "Project create is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Project create is Failed: $e", bgColor: AppColors.red);
    } finally {
      isSubmit(false);
    }
  }


}
