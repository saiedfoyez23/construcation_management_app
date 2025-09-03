import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/day_work/model/get_all_day_work_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class DayWorkController extends GetxController {


  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetAllDayWorkResponseModel> getAllDayWorkResponseModel = GetAllDayWorkResponseModel().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<GetAllDayWork> getAllDayWorkResponseList = <GetAllDayWork>[].obs;
  RxList<GetAllDayWork> getAllDayWorkSearchResponseList = <GetAllDayWork>[].obs;
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  String projectId;
  DayWorkController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getAllDayWorkController(projectId: projectId);
    });
  }

  Future<void> cleanList() async {
    getAllDayWorkResponseList.clear();
    getAllDayWorkSearchResponseList.clear();
  }


  Future<void> refreshList() async {
    getAllDayWorkResponseList.refresh();
    getAllDayWorkSearchResponseList.refresh();
  }

  Future<void> getAllDayWorkController({required String projectId}) async {
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
          api: "${Api.getAllDayWorks}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getAllDayWorkResponseModel.value = GetAllDayWorkResponseModel.fromJson(responseBody);
        getAllDayWorkResponseModel.value.data?.data?.forEach((value) {
          getAllDayWorkResponseList.add(value);
          getAllDayWorkSearchResponseList.add(value);
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


  Future<void> deleteDayWorkController({required String dayWorkId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.deleteRequest(
          api: "${Api.deleteDayWorks}/${dayWorkId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.back();
        kSnackBar(message: "Site diary delete successful", bgColor: AppColors.green);
        await getAllDayWorkController(projectId: projectId);
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