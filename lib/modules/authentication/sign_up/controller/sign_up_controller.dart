import 'dart:io';
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var isLoadingNow = false.obs;
  RxBool isObscureText = true.obs;
  RxBool isConfirmObscureText = true.obs;

  Rx<File> selectedFile = File("").obs;


  RxList<String> roles = [
    'Company Admin',
    'Supervisor',
    'Project Manager'
  ].obs;
  RxString selectedRole = "".obs;


  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> companyNameController = TextEditingController().obs;
  Rx<TextEditingController> companyEmailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;


  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      selectedFile.value = File(result.files.single.path!);
    }
  }

  Future<void> removeFile() async {
    selectedFile.value = File("");
  }

  /// SignUp
  Future signupController({
    required String name,
    required String companyname,
    required String email,
    required String password,
  }) async {
    try {
      isLoading(true);
      var map = {
        "name": name,
        "company_name": companyname,
        "email": email.toLowerCase(),
        "password": password,
      };

      var headers = {'Content-Type': 'application/json'};

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.signup,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        // Get.to(
        //   SignUpOtpVerification(
        //     name: name,
        //     companyName: companyname,
        //     email: email,
        //     password: password,
        //   ),
        // );
      } else {
        throw 'Sign Up Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
      kSnackBar(message: "Sign Up Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }

  /// Sign Verify (OTP Verification)
  Future signUpVerifyController({
    required String email,
    required String otp,
  }) async {
    try {
      isLoadingNow(true);
      var map = {"email": email, "otp": otp, "verify_account": true};

      var headers = {'Content-Type': 'application/json'};

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.signVerify,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        //Get.to(SignInScreen());
      } else {
        throw 'OTP Verification Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
      kSnackBar(message: "OTP Verification Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoadingNow(false);
    }
  }
}
