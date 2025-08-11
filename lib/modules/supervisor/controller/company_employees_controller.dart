import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/supervisor/model/get_all_company_employees_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CompanyEmployeesController extends GetxController {
  var isLoading = false.obs;
  var companyEmployeesList = <GetAllCompanyEmployeesModel>[].obs;

  @override
  void onInit() {
    getCompanyEmployees();
    super.onInit();
  }

  Future getCompanyEmployees() async {
    try {
      isLoading(true);
      String token = LocalStorage.getData(key: AppConstant.token);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.getAllCompanyEmployees,
          headers: headers,
        ),
      );
      if (responseBody != null) {
        final companyEmploye = GetAllCompanyEmployeesModel.fromJson(
          responseBody,
        );
        companyEmployeesList.add(companyEmploye);
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
      }else{
        throw('No data received from the server');
      }
    } catch (e) {
      kSnackBar(
        message: 'Error fetching employees: $e',
        bgColor: AppColors.red,
      );
      debugPrint("Catch Error :::::::::  $e");
    } finally {
      isLoading(false);
    }
  }
}
