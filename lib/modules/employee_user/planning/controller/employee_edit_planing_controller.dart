import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/planning/model/get_employee_plan_details_response_model.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_planning_details_view.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_workforces_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/common.dart';

class EmployeeEditPlaningController extends GetxController {
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

  RxBool isLoading = false.obs;

  RxList<EmployeePlaningEditWorkforce> workforceList = <EmployeePlaningEditWorkforce>[].obs;
  RxList<EmployeePlaningEditEquipment> equipmentList = <EmployeePlaningEditEquipment>[].obs;
  RxList<EmployeePlaningEditTask> taskList = <EmployeePlaningEditTask>[].obs;

  Rx<GetEmployeePlanDetailsResponseModel> getEmployeePlanDetailsResponseModel = GetEmployeePlanDetailsResponseModel().obs;
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

  String planingId;
  String projectId;
  EmployeeEditPlaningController({required this.planingId,required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeAllWorkforceController(projectId: projectId);
      await getEmployeeAllEquipmentsController(projectId: projectId);
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
        date.value = DateTime.parse(getEmployeePlanDetailsResponseModel.value.data!.dueDate.toString()).toLocal();
        dueDateController.value.text = DateFormat("MMM d, y").format(date.value);
        dueTimeController.value.text = DateFormat("h:mm a").format(date.value);
        taskController.value.text = getEmployeePlanDetailsResponseModel.value.data?.name ?? "";
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


  Future<void> removeTasksPlaningController({required String planingId,required int index}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };



      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.patchRequest(
            api: "${Api.removeTaskPlaning}/${planingId}",
            headers: headers,
            body: jsonEncode({
              "index": index,
            })
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");

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


  Future<void> addTasksPlaningController({required String planingId,required Map<String,dynamic> data}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };



      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: "${Api.addTaskPlaning}/${planingId}/task",
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");

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


  Future<void> uploadPlaningController({required String planingId,required String projectId,required Map<String,dynamic> data}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };



      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.putRequest(
          api: "${Api.updatePlaning}/${planingId}",
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.off(()=>EmployeePlaningDetailsView(planingId: planingId, projectId: projectId,),preventDuplicates: false);

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

}


class EmployeePlaningEditTask {
  final String name;
  final List<EmployeePlaningEditWorkforce> workforce;
  final List<EmployeePlaningEditEquipment> equipment;

  EmployeePlaningEditTask(this.name, this.workforce, this.equipment);

}

class EmployeePlaningEditWorkforce {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeePlaningEditWorkforce(this.typeId, this.quantity, this.duration);
}

class EmployeePlaningEditEquipment {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeePlaningEditEquipment(this.typeId, this.quantity, this.duration);
}


extension DayWorkMapper on GetEmployeePlanDetailsResponseModel {
  List<EmployeePlaningEditTask> toTaskList() {
    if (data?.tasks == null) return [];

    return data!.tasks!.map((task) {
      // Map Workforces
      final workforceList = task.workforces?.map((wf) {
        return EmployeePlaningEditWorkforce(
          wf.workforce?.sId ?? "",
          (wf.quantity is int)
              ? wf.quantity
              : int.tryParse(wf.quantity.toString()) ?? 0,
          _parseDurationToInt(wf.duration),
        );
      }).toList() ?? [];

      // Map Equipments
      final equipmentList = task.equipments?.map((eq) {
        return EmployeePlaningEditEquipment(
          eq.equipment?.sId ?? "",
          (eq.quantity is int)
              ? eq.quantity
              : int.tryParse(eq.quantity.toString()) ?? 0,
          _parseDurationToInt(eq.duration),
        );
      }).toList() ?? [];

      // Return Task
      return EmployeePlaningEditTask(
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