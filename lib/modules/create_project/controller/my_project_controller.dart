import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/create_project/model/get_my_project.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProjectController extends GetxController {
  var isLoading = false.obs;
  var myProjectList = <GetMyProjectModel>[].obs;

  @override
  void onInit() {
    getMyProject();
    super.onInit();
  }

  Future<void> getMyProject() async {
    try {
      isLoading(true);

      final token = await LocalStorage.getData(key: AppConstant.token);
      if (token == null) {
        debugPrint('No token found. Please log in.');
        return;
      }

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.myProject, headers: headers),
      );

      if (responseBody != null) {
        final project = GetMyProjectModel.fromJson(responseBody);
        myProjectList.add(project);
      } else {
        throw ('No data received from the server');
      }
    } catch (e) {
      kSnackBar(
        message: 'Error fetching employees: $e',
        bgColor: AppColors.red,
      );
      debugPrint('Catch Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
