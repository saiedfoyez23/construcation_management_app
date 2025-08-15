import 'dart:convert';

import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/home/model/profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color/app_color.dart';
import '../../../common/app_constant/app_constant.dart';
import '../../../common/custom_widget/custom_snackbar.dart';
import '../../../common/local_store/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';

class HomeController extends GetxController {

  Rx<ProfileResponseModel> profileResponseModel = ProfileResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getUserProfileController();
    });
  }


  Future<void> getUserProfileController() async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.companyProfile,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        profileResponseModel.value = ProfileResponseModel.fromJson(responseBody);
        LocalStorage.saveData(key: AppConstant.getProfileResponse, data: jsonEncode(responseBody));
        await checkTheProfileResponse();
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


  Future<void> checkTheProfileResponse() async {
    if(LocalStorage.getData(key: AppConstant.getProfileResponse) != null) {
      profileResponseModel.value = ProfileResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.getProfileResponse)));
    } else {
      profileResponseModel.value = ProfileResponseModel();
    }
  }



}