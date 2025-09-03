import 'dart:convert';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/folder/model/get_employee_all_folders_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class EmployeeFolderController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxBool isDelete = false.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> folderNameController = TextEditingController().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetEmployeeAllFoldersResponseModel> getEmployeeAllFoldersResponseModel = GetEmployeeAllFoldersResponseModel().obs;
  RxList<GetEmployeeAllFoldersResponse> getEmployeeAllFoldersResponseList = <GetEmployeeAllFoldersResponse>[].obs;
  RxList<GetEmployeeAllFoldersResponse> getEmployeeAllFoldersSearchResponseList = <GetEmployeeAllFoldersResponse>[].obs;
  String projectId;
  EmployeeFolderController({required this.projectId});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeAllCompanyEmployeeController(projectId: projectId);
    });
  }


  Future<void> refreshVariable() async {
    searchController.value.clear();
    folderNameController.value.clear();
  }

  Future<void> cleanList() async {
    getEmployeeAllFoldersSearchResponseList.clear();
    getEmployeeAllFoldersResponseList.clear();
  }


  Future<void> refreshList() async {
    getEmployeeAllFoldersSearchResponseList.refresh();
    getEmployeeAllFoldersResponseList.refresh();
  }


  Future<void> getEmployeeAllCompanyEmployeeController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      await cleanList();
      await refreshList();

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getAllFolder}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeAllFoldersResponseModel.value = GetEmployeeAllFoldersResponseModel.fromJson(responseBody);
        getEmployeeAllFoldersResponseModel.value.data?.forEach((value) {
          getEmployeeAllFoldersResponseList.add(value);
          getEmployeeAllFoldersSearchResponseList.add(value);
        });
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Folder Retrieve is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Folder Retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }

  }



  Future<void> createFolderController({required Map<String,dynamic> data}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.postFolder,
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.back();
        await getEmployeeAllCompanyEmployeeController(projectId: projectId);
        kSnackBar(message: "Folder create successful", bgColor: AppColors.green);
      } else {
        throw "Folder create is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Folder create is Failed: $e", bgColor: AppColors.red);
    } finally {
      isSubmit(false);
    }
  }

  Future<void> deleteFolderController({required String folderId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.deleteRequest(
          api: "${Api.getFolderDetails}/${folderId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.back();
        kSnackBar(message: "Folder delete successful", bgColor: AppColors.green);
        await getEmployeeAllCompanyEmployeeController(projectId: projectId);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Folder Retrieve is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Folder Retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isDelete(false);
    }

  }

}