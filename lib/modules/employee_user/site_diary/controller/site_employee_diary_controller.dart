import 'dart:convert';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/model/get_employee_all_site_diaries_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class SiteEmployeeDiaryController extends GetxController {

  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetEmployeeAllSiteDiariesResponseModel> getEmployeeAllSiteDiariesResponseModel = GetEmployeeAllSiteDiariesResponseModel().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<GetEmployeeAllSiteDiaries> getEmployeeAllSiteDiariesResponseList = <GetEmployeeAllSiteDiaries>[].obs;
  RxList<GetEmployeeAllSiteDiaries> getEmployeeAllSiteDiariesSearchResponseList = <GetEmployeeAllSiteDiaries>[].obs;
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  String projectId;
  SiteEmployeeDiaryController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeAllSiteDiaryController(projectId: projectId);
    });
  }

  Future<void> cleanList() async {
    getEmployeeAllSiteDiariesResponseList.clear();
    getEmployeeAllSiteDiariesSearchResponseList.clear();
  }


  Future<void> refreshList() async {
    getEmployeeAllSiteDiariesResponseList.refresh();
    getEmployeeAllSiteDiariesSearchResponseList.refresh();
  }

  Future<void> getEmployeeAllSiteDiaryController({required String projectId}) async {
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
          api: "${Api.getAllSiteDiary}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeAllSiteDiariesResponseModel.value = GetEmployeeAllSiteDiariesResponseModel.fromJson(responseBody);
        getEmployeeAllSiteDiariesResponseModel.value.data?.data?.forEach((value) {
          getEmployeeAllSiteDiariesResponseList.add(value);
          getEmployeeAllSiteDiariesSearchResponseList.add(value);
        });
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

  String getTimeDifference(String dateString) {
    DateTime givenDate = DateTime.parse(dateString).toUtc();
    DateTime now = DateTime.now().toUtc();
    Duration diff = now.difference(givenDate);

    if (diff.inSeconds < 60) {
      return "${diff.inSeconds} seconds ago";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minutes ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hours ago";
    } else if (diff.inDays < 30) {
      return "${diff.inDays} days ago";
    } else if (diff.inDays < 365) {
      return "${(diff.inDays / 30).floor()} months ago";
    } else {
      return "${(diff.inDays / 365).floor()} years ago";
    }
  }

  Future<void> deleteEmployeeSiteDiaryController({required String siteDiaryId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.deleteRequest(
          api: "${Api.deleteSiteDiary}/${siteDiaryId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.back();
        kSnackBar(message: "Site diary delete successful", bgColor: AppColors.green);
        await getEmployeeAllSiteDiaryController(projectId: projectId);
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