import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/site_diary/model/get_single_project_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleProjectController extends GetxController {
  var isLoading = false.obs;
  var myProject = GetSingleProjectModel().obs;



  Future<void> getSingleProject({ required String projectId}) async {
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
        await BaseClient.getRequest(api: Api.singleProjectDetails(projectId: projectId), headers: headers),
      );

      if (responseBody != null) {
        myProject.value = GetSingleProjectModel.fromJson(responseBody);

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
