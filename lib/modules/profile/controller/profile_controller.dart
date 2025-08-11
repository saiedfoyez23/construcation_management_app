import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/profile/model/get_company_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import "package:http/http.dart"as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profileData = Rx<GetCompanyProfileModel?>(null);

  @override
  void onInit() {
    super.onInit();
    myProfileController();
  }

  Future<void> myProfileController() async {
    try {
      isLoading(true);

      final token = await LocalStorage.getData(key: AppConstant.token);
      if (token == null || token.isEmpty) {
        kSnackBar(
          message: "No token found. Please log in again.",
          bgColor: AppColors.red,
        );
        return;
      }

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.companyProfile, headers: headers),
      );

      if (responseBody != null) {
        profileData.value = GetCompanyProfileModel.fromJson(responseBody);
        kSnackBar(
          message: profileData.value?.message ?? "Profile fetched successfully",
          bgColor: AppColors.green,
        );
      } else {
        kSnackBar(message: "Failed to fetch profile!", bgColor: AppColors.red);
      }
    } catch (e) {
      debugPrint("Error fetching profile: $e");
      kSnackBar(message: "Error: ${e.toString()}", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

  Future<void> putProfileController({
    File? image,
    File? logo,
    required String name,
    required String phone,
    required dynamic companyname, // Consider changing to String if possible
    required String location,
    required Function(String) onSuccess,
    required Function(String) onFail,
    required Function(String) onExceptionFail,
  }) async {
    try {
      isLoading(true);

      // Validate inputs
      if (name.isEmpty ||
          phone.isEmpty ||
          (companyname == null || companyname.toString().isEmpty) ||
          location.isEmpty) {
        onFail("All text fields are required.");
        return;
      }

      final token = await LocalStorage.getData(key: AppConstant.token);
      if (token == null || token.isEmpty) {
        onFail("No token found. Please log in again.");
        return;
      }

      var request = http.MultipartRequest('PUT', Uri.parse(Api.profileUpdate));
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      });

      // Ensure companyname is a string
      request.fields['payload'] = jsonEncode({
        'name': name,
        'contact_number': phone,
        'companyname': companyname.toString(), // Convert to string explicitly
        'location': location,
      });

      if (image != null) {
        final mimeType = lookupMimeType(image.path) ?? 'image/jpeg';
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            image.path,
            contentType: MediaType.parse(mimeType),
          ),
        );
      }

      if (logo != null) {
        final mimeType = lookupMimeType(logo.path) ?? 'image/jpeg';
        request.files.add(
          await http.MultipartFile.fromPath(
            'logo',
            logo.path,
            contentType: MediaType.parse(mimeType),
          ),
        );
      }

      var response = await request.send();
      String responseBody = await response.stream.bytesToString();

      log("Profile update response: $responseBody");

      final responseData = jsonDecode(responseBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        profileData.value = GetCompanyProfileModel.fromJson(responseData);
        onSuccess(responseData['message'] ?? "Profile updated successfully");
        await myProfileController();
      } else {
        String errorMessage =
            responseData['message'] ?? "Failed to update profile";
        if (responseData['errorSources'] != null &&
            responseData['errorSources'].isNotEmpty) {
          errorMessage += ": ${responseData['errorSources'][0]['message']}";
        }
        onFail(errorMessage);
      }
    } catch (e) {
      log("Error updating profile: $e");
      onExceptionFail(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
