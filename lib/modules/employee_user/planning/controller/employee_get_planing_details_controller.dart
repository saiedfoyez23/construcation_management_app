import 'dart:convert';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/planning/model/get_employee_plan_details_response_model.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_workforces_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class EmployeeGetPlaningDetailsController extends GetxController {

  RxBool isLoading = false.obs;
  RxList<EmployeePlaningDetailsWorkforce> workforce = <EmployeePlaningDetailsWorkforce>[].obs;
  RxList<EmployeePlaningDetailsEquipment> equipment = <EmployeePlaningDetailsEquipment>[].obs;
  RxList<EmployeePlaningDetailsTask> taskList = <EmployeePlaningDetailsTask>[].obs;
  Rx<GetEmployeePlanDetailsResponseModel> getEmployeePlanDetailsResponseModel = GetEmployeePlanDetailsResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetEmployeeAllEquipmentsResponseModel> getEmployeeAllEquipmentsResponseModel = GetEmployeeAllEquipmentsResponseModel().obs;
  Rx<GetEmployeeAllWorkforcesResponseModel> getEmployeeAllWorkforcesResponseModel = GetEmployeeAllWorkforcesResponseModel().obs;
  String planingId;
  String projectId;
  EmployeeGetPlaningDetailsController({required this.planingId,required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeAllEquipmentsController(projectId: projectId);
      await getEmployeeAllWorkforceController(projectId: projectId);
      await getEmployeePlaningDetailsController(planingId: planingId);
    });
  }

  Future<void> getEmployeeAllWorkforceController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getProjectWorkforce}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeAllWorkforcesResponseModel.value = GetEmployeeAllWorkforcesResponseModel.fromJson(responseBody);
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }


  Future<void> getEmployeeAllEquipmentsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getProjectEquipments}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeAllEquipmentsResponseModel.value = GetEmployeeAllEquipmentsResponseModel.fromJson(responseBody);
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }

  Future<void> getEmployeePlaningDetailsController({required String planingId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.detailsPlans}/${planingId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeePlanDetailsResponseModel.value = GetEmployeePlanDetailsResponseModel.fromJson(responseBody);
        taskList.value = getEmployeePlanDetailsResponseModel.value.toTaskList();
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


class EmployeePlaningDetailsTask {
  final String name;
  final List<EmployeePlaningDetailsWorkforce> workforce;
  final List<EmployeePlaningDetailsEquipment> equipment;

  EmployeePlaningDetailsTask(this.name, this.workforce, this.equipment);

}

class EmployeePlaningDetailsWorkforce {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeePlaningDetailsWorkforce(this.typeId, this.quantity, this.duration);

}

class EmployeePlaningDetailsEquipment {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeePlaningDetailsEquipment(this.typeId, this.quantity, this.duration);
}


extension DayWorkMapper on GetEmployeePlanDetailsResponseModel {
  List<EmployeePlaningDetailsTask> toTaskList() {
    if (data?.tasks == null) return [];

    return data!.tasks!.map((task) {
      // Map Workforces
      final workforceList = task.workforces?.map((wf) {
        return EmployeePlaningDetailsWorkforce(
          wf.workforce?.sId ?? "",
          (wf.quantity is int)
              ? wf.quantity
              : int.tryParse(wf.quantity.toString()) ?? 0,
          _parseDurationToInt(wf.duration),
        );
      }).toList() ?? [];

      // Map Equipments
      final equipmentList = task.equipments?.map((eq) {
        return EmployeePlaningDetailsEquipment(
          eq.equipment?.sId ?? "",
          (eq.quantity is int)
              ? eq.quantity
              : int.tryParse(eq.quantity.toString()) ?? 0,
          _parseDurationToInt(eq.duration),
        );
      }).toList() ?? [];

      // Return Task
      return EmployeePlaningDetailsTask(
        task.name ?? "",
        workforceList,
        equipmentList,
      );
    }).toList();
  }
}

/// Helper function to convert "25 hours" → 25
int _parseDurationToInt(dynamic duration) {
  if (duration == null) return 0;
  if (duration is int) return duration;

  final str = duration.toString().trim();
  final number = int.tryParse(str.split(" ").first);
  return number ?? 0;
}