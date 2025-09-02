import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/folder/model/get_folders_details_response_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../common/common.dart';


class FolderDetailsController extends GetxController {
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> folderNameController = TextEditingController().obs;
  Rx<GetFoldersDetailsResponseModel> getFoldersDetailsResponseModel = GetFoldersDetailsResponseModel().obs;
  RxList<GetFoldersDetails> getFileList = <GetFoldersDetails>[].obs;
  RxList<GetFoldersDetails> getFileSearchList = <GetFoldersDetails>[].obs;
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  String folderId;
  FolderDetailsController({required this.folderId});


  Rx<File> selectedFile = File("").obs;
  RxBool isSubmit = false.obs;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      selectedFile.value = File(result.files.single.path!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getFolderDetailsController(folderId: folderId);
    });
  }

  Future<void> onRefresh() async {
    folderNameController.value.clear();
    selectedFile.value = File("");
  }


  Future<void> cleanList() async {
    getFileList.clear();
    getFileSearchList.clear();
  }


  Future<void> refreshList() async {
    getFileList.refresh();
    getFileSearchList.refresh();
  }


  Future<void> getFolderDetailsController({required String folderId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      await cleanList();
      await refreshList();


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getFolderDetails}/${folderId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getFoldersDetailsResponseModel.value = GetFoldersDetailsResponseModel.fromJson(responseBody);
        getFoldersDetailsResponseModel.value.data?.files?.forEach((value) {
          getFileList.add(value);
          getFileSearchList.add(value);
        });
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Folder Retrieve is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Folder Retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }

  }

  Future<void> updateFileNameController({required Map<String,dynamic> data,required String folderId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.patchRequest(
          api: "${Api.postFile}/${folderId}/name",
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.back();
        await getFolderDetailsController(folderId: folderId);
        kSnackBar(message: "File Name Change Successful", bgColor: AppColors.green);
      } else {
        throw "File name change is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "File name change is Failed: $e", bgColor: AppColors.red);
    } finally {
      isSubmit(false);
    }
  }


  // Function to download a file from an API using HTTP and open it afterward
  Future<void> downloadAndOpenFile(String apiUrl, String fileName) async {
    try {
      // Send GET request to the API
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Get the app's documents directory (or use another path as needed, e.g., downloads directory)
        Directory? directory;
        if (Platform.isAndroid) {
          directory = await getExternalStorageDirectory(); // Or use getDownloadsDirectory() from path_provider if available
        } else {
          directory = await getApplicationDocumentsDirectory();
        }

        // Construct the full save path
        String savePath = '${directory?.path}/${apiUrl.toString().split('/').last}';

        // Write the file
        await File(savePath).writeAsBytes(response.bodyBytes);

        print('File downloaded successfully to: $savePath');

        // Open the file using the system's default app
        final result = await OpenFile.open(savePath);
        if (result.type != ResultType.done) {
          print('Failed to open file: ${result.message}');
        } else {
          print('File opened successfully');
        }
      } else {
        print('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading or opening file: $e');
    }
  }






  Future<void> updateImageController({
    required String folderId,
    required File image,
    required String name,
  }) async {
    try {

      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };


      // Create multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${Api.postFile}/${folderId}/files"),
      );

      request.headers.addAll(headers);


      // Get file extension and MIME type

      request.fields['payload'] = jsonEncode({
        'name': name,
      });


      String mimeType = CustomMimeType.getMimeType(image.path);
      MediaType contentType = MediaType.parse(mimeType);

      // Add file to request with proper MIME type
      request.files.add(
        await http.MultipartFile.fromPath(
          'file', // Field name expected by server
          image.path,
          filename: "${name}.${image.path.split("/").last.split('.').last.toLowerCase()}",
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
        Get.back();
        String successMessage = responseData['message'] ?? 'File upload failed';
        kSnackBar(message: successMessage, bgColor: AppColors.green);
        await getFolderDetailsController(folderId: folderId);
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


  Future<void> deleteFileController({required String folderId,required String url}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      Map<String,dynamic> data = {
        "url": url,
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.patchRequest(
          api: "${Api.postFile}/${folderId}/files",
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        Get.back();
        kSnackBar(message: "File delete successful", bgColor: AppColors.green);
        await getFolderDetailsController(folderId: folderId);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Folder Retrieve is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Folder Retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isDelete(false);
    }

  }






}