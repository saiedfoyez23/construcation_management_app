import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/setting/model/setting_text_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  var isLoading = false.obs;
  var allText = Rx<SettingTextModel?>(null);
  var privacyPolicy = ''.obs;
  var termsConditions = ''.obs;
  var aboutUs = ''.obs;

  @override
  void onInit() {
    getAllText();
    super.onInit();
  }

  void getAllText() async {
    try {
      isLoading(true); // Set loading to true
      final token = await LocalStorage.getData(key: AppConstant.token);
      if (token == null) {
        throw 'No token found. Please log in again.';
      }
      debugPrint("Token: $token");

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // Make API request
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.setting, headers: headers),
      );

      if (responseBody != null) {
        // Parse response into SettingTextModel
        String message = responseBody["message"].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        allText.value = SettingTextModel.fromJson(responseBody);

        // Check if data list is not empty and assign termsAndConditions and privacyPolicy
        if (allText.value?.data != null) {
          termsConditions.value = allText.value!.data!.termsConditions ?? '';
          privacyPolicy.value = allText.value!.data!.privacyPolicy ?? '';
          aboutUs.value = allText.value!.data!.privacyPolicy ?? '';
        } else {
          debugPrint("No data found in response");
          termsConditions.value = '';
          privacyPolicy.value = '';
          aboutUs.value = '';
        }
      } else {
        debugPrint("Response body is null");
      }
      debugPrint("Response: $responseBody");
    } catch (e) {
      debugPrint("Error fetching settings: $e");
    } finally {
      isLoading(false); // Reset loading state
    }
  }
}
