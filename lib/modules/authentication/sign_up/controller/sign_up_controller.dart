import 'dart:io';
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_up/model/image_upload_response_model.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/sign_up_email_verify_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../common/common.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var isLoadingNow = false.obs;
  RxBool isObscureText = true.obs;
  RxBool isConfirmObscureText = true.obs;

  Rx<File> selectedFile = File("").obs;

  Rx<ImageUploadResponseModel> imageUploadResponseModel = ImageUploadResponseModel().obs;


  // RxList<String> roles = [
  //   'Company Admin',
  //   'Supervisor',
  //   'Project Manager'
  // ].obs;
  // RxString selectedRole = "".obs;


  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> companyNameController = TextEditingController().obs;
  Rx<TextEditingController> companyEmailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxString phoneNumber = "".obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      selectedFile.value = File(result.files.single.path!);
      await uploadFileController(file: selectedFile.value);
    }
  }

  Future<void> removeFile() async {
    selectedFile.value = File("");
    await deleteUserController();
  }



  Future<void> uploadFileController({required File file}) async {
    try {
      // Create multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.uploadFiles),
      );

      // Get file extension and MIME type
      String fileExtension = file.path.split('.').last.toLowerCase();
      String mimeType = CustomMimeType.getMimeType(file.path);
      MediaType contentType = MediaType.parse(mimeType);

      // Add file to request with proper MIME type
      request.files.add(
        await http.MultipartFile.fromPath(
          'file', // Field name expected by server
          file.path,
          filename: file.path.split('/').last,
          contentType: contentType,
        ),
      );


      // Send request
      var response = await request.send();

      // Process response
      String responseBody = await response.stream.bytesToString();
      var responseData = jsonDecode(responseBody);

      debugPrint('Upload Response: ${jsonEncode(responseData)}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle successful upload
        String successMessage = responseData['message'] ?? 'File upload failed';
        kSnackBar(message: successMessage, bgColor: AppColors.green);
        imageUploadResponseModel.value = ImageUploadResponseModel.fromJson(responseData);
      } else {
        // Handle server error
        String errorMessage = responseData['message'] ?? 'File upload failed';
        kSnackBar(message: errorMessage, bgColor: AppColors.red);
      }
    } catch (e) {
      // Handle exceptions
      debugPrint('Upload error: $e');
      kSnackBar(message: "${e}", bgColor: AppColors.red);
    } finally {}
  }


  Future<void> deleteUserController() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      Map<String,dynamic> data = {
        "file_url": "${imageUploadResponseModel.value.data?.url ?? ""}"
      };

      print(data);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.deleteRequest(
          api: "${Api.uploadFiles}",
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
      } else {
        kSnackBar(message: "File delete fail", bgColor: AppColors.red);
        throw "Profile delete is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "File delete fail ${e}", bgColor: AppColors.red);
    } finally {}
  }



  Future<void> signUpController({
    required Map<String,dynamic> data,
    required String email,
  }) async {
    try {
      isLoading(true);

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.signup,
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.off(()=>SignUpEmailVerifyView(email: email),preventDuplicates: false);
      } else {
        isLoading(false);
        throw 'Send data is failed!';
      }
    } catch (e) {
      isLoading(false);
      kSnackBar(message: "Send data is failed: $e", bgColor: AppColors.red);
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
