// import 'dart:convert';
// import 'package:construction_management_app/common/app_color/app_color.dart';
// import 'package:construction_management_app/common/app_constant/app_constant.dart';
// import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
// import 'package:construction_management_app/common/local_store/local_store.dart';
// import 'package:construction_management_app/common/local_store/token_decoder.dart';
// import 'package:construction_management_app/data/api.dart';
// import 'package:construction_management_app/data/base_client.dart';
// import 'package:construction_management_app/modules/create_project/model/get-all-company-employe-model.dart';
// import 'package:construction_management_app/modules/resources/model/get_project_workforce_model.dart'
//     hide Datum;
// import 'package:construction_management_app/modules/resources/model/workforce_model.dart';
// import 'package:construction_management_app/modules/resources/view/project_detalis_resources.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
//
// class WorkforceController extends GetxController {
//   var isLoading = false.obs;
//   var isLoadingNow = false.obs;
//   var workforceList = <WorkforceModel>[].obs;
//   var projectWorkforceList = <GetProjectWorkforceModel>[].obs;
//   TextEditingController name = TextEditingController();
//   TextEditingController quantity = TextEditingController();
//
//   Future<void> postWorkforce({
//     required String name,
//     required int quantity,
//   }) async {
//     try {
//       isLoading(true);
//       final token = await LocalStorage.getData(key: AppConstant.token);
//
//       if (token == null || token.isEmpty) {
//         Get.snackbar('Error', 'Token not found. Please log in again.');
//         debugPrint("No token found in LocalStorage");
//         return;
//       }
//
//       String? project = getConstructionToken(token);
//       if (project == null) {
//         Get.snackbar('Error', 'Project ID not found');
//         debugPrint("Failed to retrieve projectId from token");
//         return;
//       }
//
//       debugPrint("Project ID: $project, Quantity: $quantity");
//       // var map = {"quantity": quantity, "name": name, "project": project};
//       var data = [
//         {"quantity": quantity, "name": name, "project": project},
//       ];
//       var headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       };
//
//       dynamic responseBody = await BaseClient.handleResponse(
//         await BaseClient.postRequest(
//           api: Api.postWorkforce,
//           body: jsonEncode(data),
//           headers: headers,
//         ),
//       );
//
//       if (responseBody != null) {
//         final workforce = WorkforceModel.fromJson(responseBody);
//         workforceList.add(workforce);
//         Get.to(ProjectDetalisResources());
//       } else {
//         Get.snackbar('Error', 'Failed to add workforce: Empty response');
//         debugPrint("Empty response from API");
//       }
//     } catch (e) {
//       debugPrint("Error in postWorkforce: $e");
//       Get.snackbar('Error', 'Failed to add workforce: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   Future<void> getProjectWorkforce() async {
//     try {
//       isLoadingNow(true);
//
//       final token = await LocalStorage.getData(key: AppConstant.token);
//       if (token == null) {
//         debugPrint('No token found. Please log in.');
//         return;
//       }
//
//       var headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       };
//
//       final responseBody = await BaseClient.handleResponse(
//         await BaseClient.getRequest(
//           api: Api.getAllCompanyEmployees,
//           headers: headers,
//         ),
//       );
//
//       if (responseBody != null) {
//         final projectWorkforce = GetProjectWorkforceModel.fromJson(responseBody);
//         projectWorkforceList.add(projectWorkforce);
//         Get.to(ProjectDetalisResources());
//       } else {
//         debugPrint('No data received from the server');
//       }
//     } catch (e) {
//       debugPrint('Error fetching employees: $e');
//       debugPrint('Catch Error: $e');
//     } finally {
//       isLoadingNow(false);
//     }
//   }
// }

///

import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/common/local_store/token_decoder.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/resources/model/workforce_model.dart';
import 'package:construction_management_app/modules/resources/model/get_project_workforce_model.dart';
import 'package:construction_management_app/modules/resources/view/project_detalis_resources.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WorkforceController extends GetxController {
  var isLoading = false.obs;
  var isLoadingNow = false.obs;
  var workforceList = <WorkforceModel>[].obs;
  var projectWorkforceList = <GetProjectWorkforceModel>[].obs;
  TextEditingController name = TextEditingController();
  TextEditingController quantity = TextEditingController();

  Future<void> postWorkforce({
    required String name,
    required int quantity,
  }) async {
    try {
      isLoading(true);
      final token = await LocalStorage.getData(key: AppConstant.token);

      if (token == null || token.isEmpty) {
        Get.snackbar('Error', 'Token not found. Please log in again.');
        debugPrint("No token found in LocalStorage");
        return;
      }

      String? project = getConstructionToken(token);
      if (project == null) {
        Get.snackbar('Error', 'Id not found');
        return;
      }
      var data = [
        {"quantity": quantity, "name": name, "project": project},
      ];
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.postWorkforce,
          body: jsonEncode(data),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        final workforce = WorkforceModel.fromJson(responseBody);
        workforceList.add(workforce);
        Get.off(
          () => ProjectDetalisResources(),
        ); // Use Get.off to replace screen
      } else {
        Get.snackbar('Error', 'Failed to add workforce: Empty response');
        debugPrint("Empty response from API");
      }
    } catch (e) {
      debugPrint("Error in postWorkforce: $e");
      Get.snackbar('Error', 'Failed to add workforce: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getProjectWorkforce() async {
    try {
      isLoadingNow(true);

      final token = await LocalStorage.getData(key: AppConstant.token);
      if (token == null) {
        debugPrint('No token found. Please log in.');
        return;
      }
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.getProjectWorkforce,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        final projectWorkforce = GetProjectWorkforceModel.fromJson(
          responseBody,
        );
        projectWorkforceList.clear(); // Clear previous data
        projectWorkforceList.add(projectWorkforce);
      } else {
        debugPrint('No data received from the server');
      }
    } catch (e) {
      debugPrint('Error fetching employees: $e');
    } finally {
      isLoadingNow(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProjectWorkforce(); // Fetch workforce data when controller is initialized
  }
}
