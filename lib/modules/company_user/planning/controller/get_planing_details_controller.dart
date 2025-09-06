import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/planning/model/get_plan_details_response_model.dart';
import 'package:construction_management_app/modules/company_user/resources/model/get_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/company_user/resources/model/get_all_workforces_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/common.dart';

class GetPlaningDetailsController extends GetxController {

  RxBool isLoading = false.obs;
  RxList<PlaningDetailsWorkforce> workforce = <PlaningDetailsWorkforce>[].obs;
  RxList<PlaningDetailsEquipment> equipment = <PlaningDetailsEquipment>[].obs;
  RxList<PlaningDetailsTask> taskList = <PlaningDetailsTask>[].obs;
  Rx<GetPlanDetailsResponseModel> getPlanDetailsResponseModel = GetPlanDetailsResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetAllEquipmentsResponseModel> getAllEquipmentsResponseModel = GetAllEquipmentsResponseModel().obs;
  Rx<GetAllWorkforcesResponseModel> getAllWorkforcesResponseModel = GetAllWorkforcesResponseModel().obs;
  String planingId;
  String projectId;
  GetPlaningDetailsController({required this.planingId,required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getAllEquipmentsController(projectId: projectId);
      await getAllWorkforceController(projectId: projectId);
      await getPlaningDetailsController(planingId: planingId);
    });
  }

  Future<void> getAllWorkforceController({required String projectId}) async {
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
        getAllWorkforcesResponseModel.value = GetAllWorkforcesResponseModel.fromJson(responseBody);
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


  Future<void> getAllEquipmentsController({required String projectId}) async {
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
        getAllEquipmentsResponseModel.value = GetAllEquipmentsResponseModel.fromJson(responseBody);
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

  Future<void> getPlaningDetailsController({required String planingId}) async {
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
        getPlanDetailsResponseModel.value = GetPlanDetailsResponseModel.fromJson(responseBody);
        taskList.value = getPlanDetailsResponseModel.value.toTaskList();
      } else {
        throw "Data retrieve is Faile";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

}


class PlaningDetailsTask {
  final String name;
  final List<PlaningDetailsWorkforce> workforce;
  final List<PlaningDetailsEquipment> equipment;

  PlaningDetailsTask(this.name, this.workforce, this.equipment);

}

class PlaningDetailsWorkforce {
  final String typeId;
  final int quantity;
  final int duration;

  PlaningDetailsWorkforce(this.typeId, this.quantity, this.duration);

}

class PlaningDetailsEquipment {
  final String typeId;
  final int quantity;
  final int duration;

  PlaningDetailsEquipment(this.typeId, this.quantity, this.duration);
}


extension DayWorkMapper on GetPlanDetailsResponseModel {
  List<PlaningDetailsTask> toTaskList() {
    if (data?.tasks == null) return [];

    return data!.tasks!.map((task) {
      // Map Workforces
      final workforceList = task.workforces?.map((wf) {
        return PlaningDetailsWorkforce(
          wf.workforce?.sId ?? "",
          (wf.quantity is int)
              ? wf.quantity
              : int.tryParse(wf.quantity.toString()) ?? 0,
          _parseDurationToInt(wf.duration),
        );
      }).toList() ?? [];

      // Map Equipments
      final equipmentList = task.equipments?.map((eq) {
        return PlaningDetailsEquipment(
          eq.equipment?.sId ?? "",
          (eq.quantity is int)
              ? eq.quantity
              : int.tryParse(eq.quantity.toString()) ?? 0,
          _parseDurationToInt(eq.duration),
        );
      }).toList() ?? [];

      // Return Task
      return PlaningDetailsTask(
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