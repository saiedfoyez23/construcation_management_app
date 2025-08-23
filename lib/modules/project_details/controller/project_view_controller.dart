import 'dart:convert';

import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/home/model/profile_response_model.dart';
import 'package:construction_management_app/modules/project_details/model/get_project_details_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/app_constant/app_constant.dart';
import '../../../common/common.dart';
import '../../../common/local_store/local_store.dart';

class ProjectViewController extends GetxController {
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<ProfileResponseModel> profileResponseModel = ProfileResponseModel().obs;
  Rx<GetProjectDetailsResponseModel> getProjectDetailsResponseModel = GetProjectDetailsResponseModel().obs;
  RxBool isLoading = false.obs;
  String projectId;
  ProjectViewController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getProjectDetailsController(projectId: projectId);
    });
  }

  Future<void> getProjectDetailsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));
      profileResponseModel.value = ProfileResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.getProfileResponse)));

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
        getProjectDetailsResponseModel.value = GetProjectDetailsResponseModel.fromJson(responseBody);
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