import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/folder/model/get_all_folders_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class FolderController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxBool isDelete = false.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> folderNameController = TextEditingController().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetAllFoldersResponseModel> getAllFoldersResponseModel = GetAllFoldersResponseModel().obs;
  RxList<GetAllFoldersResponse> getAllFoldersResponseList = <GetAllFoldersResponse>[].obs;
  RxList<GetAllFoldersResponse> getAllFoldersSearchResponseList = <GetAllFoldersResponse>[].obs;
  String projectId;
  FolderController({required this.projectId});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getAllCompanyEmployeeController(projectId: projectId);
    });
  }


  Future<void> refreshVariable() async {
    searchController.value.clear();
    folderNameController.value.clear();
  }

  Future<void> cleanList() async {
    getAllFoldersSearchResponseList.clear();
    getAllFoldersResponseList.clear();
  }


  Future<void> refreshList() async {
    getAllFoldersSearchResponseList.refresh();
    getAllFoldersResponseList.refresh();
  }


  Future<void> getAllCompanyEmployeeController({required String projectId}) async {
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
        getAllFoldersResponseModel.value = GetAllFoldersResponseModel.fromJson(responseBody);
        getAllFoldersResponseModel.value.data?.forEach((value) {
          getAllFoldersResponseList.add(value);
          getAllFoldersSearchResponseList.add(value);
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
        await getAllCompanyEmployeeController(projectId: projectId);
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
        await getAllCompanyEmployeeController(projectId: projectId);
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