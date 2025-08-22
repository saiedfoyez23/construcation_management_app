import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_mime_type/costom_mime_type.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/home/model/profile_response_model.dart';
import 'package:construction_management_app/modules/profile/model/get_company_profile_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart"as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class ProfileController extends GetxController {
  var profileData = Rx<GetCompanyProfileModel?>(null);

  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;

  Rx<ProfileResponseModel> profileResponseModel = ProfileResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
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

  Future<void> updateProfileController({
    File? image,
    File? logo
  }) async {
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
        String errorMessage = responseData['message'] ?? "Failed to update profile";
        if (responseData['errorSources'] != null && responseData['errorSources'].isNotEmpty) {
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
