import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:construction_management_app/modules/employee_user/home/model/employee_profile_response_model.dart';
import 'package:construction_management_app/modules/employee_user/profile/model/get_employee_all_setting_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../common/common.dart';

class EmployeeProfileController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;

  RxBool isObscureText = true.obs;
  RxBool isConfirmObscureText = true.obs;

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;

  Rx<EmployeeProfileResponseModel> employeeProfileResponseModel = EmployeeProfileResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetEmployeeAllSettingDataResponseModel> getEmployeeAllSettingDataResponseModel = GetEmployeeAllSettingDataResponseModel().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> companyController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxString phoneNumber = "".obs;
  Rx<File> imageFile = File("").obs;
  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeContentController();
      await getEmployeeProfileController();
    });
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      }
    } catch (e) {
      kSnackBar(message: 'Error: ${e.toString()}', bgColor: AppColors.red);
    }
  }

  void showImageSourceDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }


  Future<void> getEmployeeProfileController() async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.employeeProfile,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        employeeProfileResponseModel.value = EmployeeProfileResponseModel.fromJson(responseBody);
        LocalStorage.saveData(key: AppConstant.getEmployeeProfileResponse, data: jsonEncode(responseBody));
        await checkTheProfileResponse();
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


  Future<void> checkTheProfileResponse() async {
    if(LocalStorage.getData(key: AppConstant.getEmployeeProfileResponse) != null) {
      employeeProfileResponseModel.value = EmployeeProfileResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.getEmployeeProfileResponse)));
      nameController.value.text = employeeProfileResponseModel.value.data?.name ?? '';
      companyController.value.text = employeeProfileResponseModel.value.data?.companyAdmin?.email ?? '';
      phoneNumberController.value.text = employeeProfileResponseModel.value.data?.phone ?? '';
      emailController.value.text =employeeProfileResponseModel.value.data?.email ?? '';
    } else {
      employeeProfileResponseModel.value = EmployeeProfileResponseModel();
    }
  }


  void showImageSourceUploadDialog({
    required BuildContext context,
    required String name,
    required String phone,
    required String email,
    required String location,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                Navigator.pop(context);
                await pickImageUpload(
                  source: ImageSource.camera,
                  name: name,
                  phone: phone,
                  email: email,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                Navigator.pop(context);
                await pickImageUpload(
                  source: ImageSource.gallery,
                  name: name,
                  phone: phone,
                  email: email,
                );
              },
            ),
          ],
        ),
      ),
    );
  }


  Future<void> pickImageUpload({
    required ImageSource source,
    required String name,
    required String phone,
    required String email,
  }) async {
    try {
      isLoading(true);
      print("call");
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
        await updateImageController(
          image: imageFile.value,
          name: name,
          phone: phone,
          email: email,
        );
      }
    } catch (e) {
      kSnackBar(message: 'Error: ${e.toString()}', bgColor: AppColors.red);
    }
  }


  Future<void> updateImageController({
    required File image,
    required String name,
    required String phone,
    required String email,
  }) async {
    try {

      print(image.path);

      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };


      // Create multipart request
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(Api.getEmployeeProfileUpdate),
      );

      request.headers.addAll(headers);


      // Get file extension and MIME type

      request.fields['payload'] = jsonEncode({
        'name': name,
        'phone': phone,
        "email": email,
      });


      String mimeType = CustomMimeType.getMimeType(image.path);
      MediaType contentType = MediaType.parse(mimeType);

      // Add file to request with proper MIME type
      request.files.add(
        await http.MultipartFile.fromPath(
          'image', // Field name expected by server
          image.path,
          filename: image.path.split('/').last,
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
        await getEmployeeProfileController();
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


  Future<void> updateProfileController({
    File? image,
    required String name,
    required String phone,
    required String email,
  }) async {
    try {

      print(image?.path);

      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };


      // Create multipart request
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(Api.getEmployeeProfileUpdate),
      );

      request.headers.addAll(headers);


      // Get file extension and MIME type

      request.fields['payload'] = jsonEncode({
        'name': name,
        'phone': phone,
        "email": email,
      });

      if(image?.path != "") {
        String mimeType = CustomMimeType.getMimeType(image!.path);
        MediaType contentType = MediaType.parse(mimeType);

        // Add file to request with proper MIME type
        request.files.add(
          await http.MultipartFile.fromPath(
            'image', // Field name expected by server
            image.path,
            filename: image.path.split('/').last,
            contentType: contentType,
          ),
        );
      }



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
        Get.off(EmployeeDashboardView(index: 3,),preventDuplicates: false);
      } else {
        // Handle server error
        String errorMessage = responseData['message'] ?? 'File upload failed';
        kSnackBar(message: errorMessage, bgColor: AppColors.red);
      }
    } catch (e) {
      // Handle exceptions
      debugPrint('Upload error: $e');
      kSnackBar(message: "${e}", bgColor: AppColors.red);
    } finally {
      isSubmit(false);
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {

      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };


      Map<String,dynamic> data = {
        "old_password": oldPassword,
        "new_password": newPassword
      };


      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.changePassword,
          body: jsonEncode(data),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        LocalStorage.removeData(key: AppConstant.token);
        LocalStorage.removeData(key: AppConstant.getEmployeeProfileResponse);
        LocalStorage.removeData(key: AppConstant.getProfileResponse);
        Get.offAll(()=>SignInView());
      } else {
        throw 'Reset password failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::::: $e");
      kSnackBar(message: "Error changing password: $e", bgColor: AppColors.red);
    } finally {
      isSubmit(false);
    }
  }

  Future<void> getEmployeeContentController() async {
    try {
      isLoading(true);
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };


      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.setting,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        //String message = responseBody['message'].toString();
        //kSnackBar(message: message, bgColor: AppColors.green);
        getEmployeeAllSettingDataResponseModel.value = GetEmployeeAllSettingDataResponseModel.fromJson(responseBody);
      } else {
        throw "Data retrieve is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }
}
