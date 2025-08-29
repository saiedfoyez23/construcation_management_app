import 'dart:convert';

import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/create_project/model/get_all_project_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProjectController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSearchLoading = false.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetAllProjectResponseModel> getAllProjectResponseModel = GetAllProjectResponseModel().obs;

  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getMyProject();
    });
  }

  Future<void> getMyProject() async {
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
        getAllProjectResponseModel.value = GetAllProjectResponseModel.fromJson(responseBody);
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



  Future<void> getMySearchProject({required String searchTerm}) async {
    try {
      isSearchLoading(true);
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.myProjectSearch}${searchTerm}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getAllProjectResponseModel.value = GetAllProjectResponseModel.fromJson(responseBody);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Get profile is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Get profile is Failed: $e", bgColor: AppColors.red);
    } finally {
      isSearchLoading(false);
    }
  }

}
