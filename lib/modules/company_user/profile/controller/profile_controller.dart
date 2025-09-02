import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_mime_type/costom_mime_type.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/company_user/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/company_user/home/model/profile_response_model.dart';
import 'package:construction_management_app/modules/company_user/profile/model/get_all_setting_data_response_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart"as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;

  RxBool isObscureText = true.obs;
  RxBool isConfirmObscureText = true.obs;

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;

  Rx<ProfileResponseModel> profileResponseModel = ProfileResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetAllSettingDataResponseModel> getAllSettingDataResponseModel = GetAllSettingDataResponseModel().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> companyController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxString phoneNumber = "".obs;
  Rx<File> imageFile = File("").obs;
  Rx<File> logoFile = File("").obs;
  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getContentController();
      await getUserProfileController();
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

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      logoFile.value = File(result.files.single.path!);
    }
  }

  Future<void> getUserProfileController() async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.companyProfile,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        profileResponseModel.value = ProfileResponseModel.fromJson(responseBody);
        LocalStorage.saveData(key: AppConstant.getProfileResponse, data: jsonEncode(responseBody));
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
    if(LocalStorage.getData(key: AppConstant.getProfileResponse) != null) {
      profileResponseModel.value = ProfileResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.getProfileResponse)));
      nameController.value.text = profileResponseModel.value.data?.user?.name ?? '';
      companyController.value.text = profileResponseModel.value.data?.user?.companyName ?? '';
      locationController.value.text = profileResponseModel.value.data?.user?.location ?? '';
      phoneNumberController.value.text = profileResponseModel.value.data?.user?.phone ?? '';
      emailController.value.text = profileResponseModel.value.data?.user?.email ?? '';
    } else {
      profileResponseModel.value = ProfileResponseModel();
    }
  }


  void showImageSourceUploadDialog({
    required BuildContext context,
    required String name,
    required String phone,
    required String companyName,
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
                  companyName: companyName,
                  email: email,
                  location: location,
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
                  companyName: companyName,
                  email: email,
                  location: location,
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
    required String companyName,
    required String email,
    required String location,
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
          companyName: companyName,
          email: email,
          location: location,
        );
      }
    } catch (e) {
      kSnackBar(message: 'Error: ${e.toString()}', bgColor: AppColors.red);
    }
  }


  Future<void> updateImageController({
    required File image,
    File? logo,
    required String name,
    required String phone,
    required String companyName,
    required String email,
    required String location,
  }) async {
    try {

      print(image.path);
      print(logo?.path);

      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };


      // Create multipart request
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(Api.profileUpdate),
      );

      request.headers.addAll(headers);


      // Get file extension and MIME type

      request.fields['payload'] = jsonEncode({
        'name': name,
        'phone': phone,
        'company_name': companyName, // Convert to string explicitly
        'location': location,
        "email": email,
      });


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
        await getUserProfileController();
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
    File? logo,
    required String name,
    required String phone,
    required String companyName,
    required String email,
    required String location,
  }) async {
    try {

      print(image?.path);
      print(logo?.path);

      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };


      // Create multipart request
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(Api.profileUpdate),
      );

      request.headers.addAll(headers);


      // Get file extension and MIME type

      request.fields['payload'] = jsonEncode({
        'name': name,
        'phone': phone,
        'company_name': companyName, // Convert to string explicitly
        'location': location,
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


      if(logo?.path != "") {
        String mimeType = CustomMimeType.getMimeType(logo!.path);
        MediaType contentType = MediaType.parse(mimeType);

        // Add file to request with proper MIME type
        request.files.add(
          await http.MultipartFile.fromPath(
            'logo', // Field name expected by server
            logo.path,
            filename: logo.path.split('/').last,
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
        Get.off(DashboardView(index: 4,),preventDuplicates: false);
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

  Future<void> getContentController() async {
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
        getAllSettingDataResponseModel.value = GetAllSettingDataResponseModel.fromJson(responseBody);
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
