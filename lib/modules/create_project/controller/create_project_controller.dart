import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/common/local_store/token_decoder.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/create_project/controller/my_project_controller.dart';
import 'package:construction_management_app/modules/create_project/model/get-all-company-employe-model.dart';
import 'package:construction_management_app/modules/create_project/view/all_job_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProjectController extends GetxController {
  var isLoading = false.obs;
  var isLoadingNow = false.obs;
  var supervisorList = <Datum>[].obs;
  var errorMessage = ''.obs;
  var selectedSupervisor =
      Rxn<Datum>(); // Observable to store selected supervisor
  var selectedManager = Rxn<Datum>(); // Observable to store selected manager
  final MyProjectController myProjectController = Get.put(
    MyProjectController(),
  );

  final TextEditingController clientName = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController timeline = TextEditingController();
  final TextEditingController note = TextEditingController();

  // Method to set selected supervisor
  void selectSupervisor(Datum supervisor) {
    selectedSupervisor.value = supervisor;
  }

  // Method to set selected manager
  void selectedManagers(Datum manager) {
    selectedManager.value = manager;
  }

  Future postCreateProject({
    required String clientname,
    required String name,
    required String location,
    required String timeline,
    required String note,
    required String supervisor,
    required String manager,
  }) async {
    try {
      isLoading(true);
      final token = await LocalStorage.getData(key: AppConstant.token);

      if (token == null || token.isEmpty) {
        Get.snackbar('Error', 'Token not found. Please log in again.');
        debugPrint("No token found in LocalStorage");
        return;
      }
      var map = {
        "client_name": clientname,
        "name": name,
        "location": location,
        "timeline": timeline,
        "note": note,
        "supervisor": selectedSupervisor.value?.id.toString() ?? supervisor,
        // Use selected supervisor ID
        "manager": selectedManager.value?.id.toString() ?? manager,
        // Use selected manager ID
      };
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      String? project = getConstructionToken(token);
      if (project == null) {
        Get.snackbar('Error', 'Id not found');
        return;
      }
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.createProject,
          body: jsonEncode(map),
          headers: headers,
        ),
      );
      if (responseBody != null) {
        await myProjectController.getMyProject();
        Get.to(AllJobScreen());
      }
    } catch (e) {
      debugPrint("Catch Error ..... $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCompanyEmploye() async {
    try {
      isLoadingNow(true);
      errorMessage('');

      final token = await LocalStorage.getData(key: AppConstant.token);
      if (token == null) {
        errorMessage('No token found. Please log in.');
        return;
      }

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.getAllCompanyEmployees,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        final employ = GetAllCompanyEmployeModel.fromJson(responseBody);
        if (employ.success == true) {
          supervisorList.assignAll(employ.data);
        } else {
          errorMessage(employ.message ?? 'Failed to fetch employees');
        }
      } else {
        errorMessage('No data received from the server');
      }
    } catch (e) {
      errorMessage('Error fetching employees: $e');
      debugPrint('Catch Error: $e');
    } finally {
      isLoadingNow(false);
    }
  }
}
