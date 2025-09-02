import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/supervisor/model/get_all_company_employee_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/common.dart';

class CreateEmployeeController extends GetxController {
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetAllCompanyEmployeeResponseModel> getAllCompanyEmployeeResponseModel = GetAllCompanyEmployeeResponseModel().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> employeeIdController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxInt selectedIndex = 3.obs;
  RxString phoneNumber = "".obs;
  RxBool isObscureText = true.obs;
  RxString selectEmployeeType = "".obs;
  RxString sendEmployeeType = "".obs;
  RxBool isLoading = false.obs;
  RxBool isTypeLoading = false.obs;


  Future<void> onRefresh() async {
    isObscureText.value = true;
    nameController.value.clear();
    employeeIdController.value.clear();
    emailController.value.clear();
    phoneController.value.clear();
    passwordController.value.clear();
    phoneNumber.value = "";
    selectEmployeeType.value = "";
    sendEmployeeType.value = "";
  }


  RxList<String> employeeType = <String>[
    'Supervisor',
    'Manager',
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getAllCompanyEmployeeController();
    });
  }


  Future<void> createEmployeeController({required Map<String,dynamic> data}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.createEmployees,
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.back();
        await getAllCompanyEmployeeController();
        kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Employee create is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Employee create is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }


  Future<void> getAllCompanyEmployeeController() async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.getAllCompanyEmployees,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getAllCompanyEmployeeResponseModel.value = GetAllCompanyEmployeeResponseModel.fromJson(responseBody);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
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

  Future<void> getAllCompanyEmployeeByTypeController({required String type}) async {
    try {
      isTypeLoading(true);
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getAllCompanyEmployees}?type=${type}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getAllCompanyEmployeeResponseModel.value = GetAllCompanyEmployeeResponseModel.fromJson(responseBody);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Get profile is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Get profile is Failed: $e", bgColor: AppColors.red);
    } finally {
      isTypeLoading(false);
    }
  }


  Future<void> getAllCompanyEmployeeSearchController({required String name}) async {
    try {
      isTypeLoading(true);
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getAllCompanyEmployees}?name=${name}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getAllCompanyEmployeeResponseModel.value = GetAllCompanyEmployeeResponseModel.fromJson(responseBody);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Get profile is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Get profile is Failed: $e", bgColor: AppColors.red);
    } finally {
      isTypeLoading(false);
    }
  }


  Future<void> deleteEmployeeDetailsController({required String employeeId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.deleteRequest(
          api: "${Api.getAllCompanyEmployees}/${employeeId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        await getAllCompanyEmployeeController();
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
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