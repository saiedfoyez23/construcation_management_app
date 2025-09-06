import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/planning/model/get_all_plan_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/common.dart';

class GetPlaningController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  Rx<GetAllPlanResponseModel> getAllPlanResponseModel = GetAllPlanResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  String projectId;
  GetPlaningController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getAllPlaningController(projectId: projectId);
    });
  }



  Future<void> getAllPlaningController({required String projectId}) async {
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
        getAllPlanResponseModel.value = GetAllPlanResponseModel.fromJson(responseBody);
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