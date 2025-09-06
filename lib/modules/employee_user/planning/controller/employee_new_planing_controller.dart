import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_planing_view.dart';
import 'package:construction_management_app/modules/employee_user/project_details/model/get_employee_project_details_response_model.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_workforces_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/common.dart';

class EmployeeNewPlaningController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  Rx<DateTime> date = DateTime.now().obs;


  Rx<TextEditingController> taskController = TextEditingController().obs;
  Rx<TextEditingController> dueDateController = TextEditingController().obs;
  Rx<TextEditingController> dueTimeController = TextEditingController().obs;

  Rx<TextEditingController> taskNameController = TextEditingController().obs;
  Rx<TextEditingController> workforceQuantityController = TextEditingController().obs;
  Rx<TextEditingController> workForceDurationController = TextEditingController().obs;
  Rx<TextEditingController> equipmentQuantityController = TextEditingController().obs;
  Rx<TextEditingController> equipmentDurationController = TextEditingController().obs;

  RxList<EmployeePlaningWorkforce> workforceList = <EmployeePlaningWorkforce>[].obs;
  RxList<EmployeePlaningEquipment> equipmentList = <EmployeePlaningEquipment>[].obs;
  RxList<EmployeePlaningTask> taskList = <EmployeePlaningTask>[].obs;


  Rx<GetEmployeeProjectDetailsResponseModel> getEmployeeProjectDetailsResponseModel = GetEmployeeProjectDetailsResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;

  Rx<GetEmployeeAllEquipmentsResponseModel> getEmployeeAllEquipmentsResponseModel = GetEmployeeAllEquipmentsResponseModel().obs;
  Rx<GetEmployeeAllEquipmentsResponse> selectedEquipment = GetEmployeeAllEquipmentsResponse().obs;
  // Workforce
  Rx<GetEmployeeAllWorkforcesResponse> selectedWorkforces = GetEmployeeAllWorkforcesResponse().obs;
  Rx<GetEmployeeAllWorkforcesResponseModel> getEmployeeAllWorkforcesResponseModel = GetEmployeeAllWorkforcesResponseModel().obs;

  Future<void> pickDateTime({required BuildContext context}) async {
    // Pick Date
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pick == null) return; // user canceled

    // Pick Time
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (time == null) return; // user canceled

    // Combine Date + Time
    final DateTime dateTime = DateTime(
      pick.year,
      pick.month,
      pick.day,
      time.hour,
      time.minute,
    );

    date.value = dateTime;
    dueDateController.value.text = DateFormat("MMM d, y").format(dateTime);
    dueTimeController.value.text = DateFormat("h:mm a").format(dateTime);
  }


  Future<void> getEmployeeProjectDetailsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

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
        getEmployeeProjectDetailsResponseModel.value = GetEmployeeProjectDetailsResponseModel.fromJson(responseBody);
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
      isLoading(false);
    }
  }


  Future<void> createPlanController({required Map<String,dynamic> data}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: "${Api.createPlans}",
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        String successMessage = responseBody['message'];
        kSnackBar(message: successMessage, bgColor: AppColors.green);
        Get.off(()=>EmployeePlaningView(projectId: projectId),preventDuplicates: false);
      } else {
        throw "Data send is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data send is Failed: $e", bgColor: AppColors.red);
    } finally {
      isSubmit(false);
    }
  }


  String projectId;
  EmployeeNewPlaningController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeAllWorkforceController(projectId: projectId);
      await getEmployeeAllEquipmentsController(projectId: projectId);
      await getEmployeeProjectDetailsController(projectId: projectId);
    });
  }

}


class EmployeePlaningTask {
  final String name;
  final List<EmployeePlaningWorkforce> workforce;
  final List<EmployeePlaningEquipment> equipment;

  EmployeePlaningTask(this.name, this.workforce, this.equipment);
}

class EmployeePlaningWorkforce {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeePlaningWorkforce(this.typeId, this.quantity, this.duration);
}

class EmployeePlaningEquipment {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeePlaningEquipment(this.typeId, this.quantity, this.duration);
}