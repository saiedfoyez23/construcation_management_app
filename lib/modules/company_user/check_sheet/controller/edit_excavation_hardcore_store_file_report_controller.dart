import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/model/get_excavation_hardcore_store_file_report_model.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/excavation_hardcore_stone_file_report/get_view/excavation_hardcore_store_file_report_get_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import '../../../../common/common.dart';

class EditExcavationHardcoreStoreFileReportController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<TextEditingController> contractController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> drawingReferenceInclRevisionController = TextEditingController().obs;
  Rx<TextEditingController> revisionController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  RxString selectCompletionStatus = "".obs;
  Rx<TextEditingController> subContractorController = TextEditingController().obs;
  Rx<GetExcavationHardcoreStoreFileReportModel> getExcavationHardcoreStoreFileReportModel = GetExcavationHardcoreStoreFileReportModel().obs;
  RxString selectComplianceCheck = "".obs;
  RxString selectCheckForUndergroundService = "".obs;
  Rx<TextEditingController> commentController = TextEditingController().obs;
  RxBool isSubmit = false.obs;

  Rx<File> signedOnCompletion = File("").obs;
  Rx<File> clientApproved = File("").obs;

  Rx<SignatureController> signedOnCompletionController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  ).obs;


  Rx<SignatureController> clientApprovedController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  ).obs;


  void clearSignedOnCompletion() {
    signedOnCompletion.value = File("");
    signedOnCompletionController.value.clear();
  }


  void clearClientApproved() {
    clientApproved.value = File("");
    clientApprovedController.value.clear();
  }

  String projectId;
  EditExcavationHardcoreStoreFileReportController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getExcavationReportsController(projectId: projectId);
    });
  }


  Future<void> getExcavationReportsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getExcavationReports}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getExcavationHardcoreStoreFileReportModel.value = GetExcavationHardcoreStoreFileReportModel.fromJson(responseBody);
        contractController.value.text = getExcavationHardcoreStoreFileReportModel.value.data?.contract ?? "";
        dateController.value.text = getExcavationHardcoreStoreFileReportModel.value.data?.date ?? "";
        drawingReferenceInclRevisionController.value.text = getExcavationHardcoreStoreFileReportModel.value.data?.drawingReferenceInclRevision ?? "";
        revisionController.value.text = getExcavationHardcoreStoreFileReportModel.value.data?.revision ?? "";
        locationController.value.text = getExcavationHardcoreStoreFileReportModel.value.data?.locationOfWork ?? "";
        selectCompletionStatus.value = getExcavationHardcoreStoreFileReportModel.value.data?.completionStatus;
        subContractorController.value.text = getExcavationHardcoreStoreFileReportModel.value.data?.subContractor ?? "";
        selectComplianceCheck.value = getExcavationHardcoreStoreFileReportModel.value.data?.complianceCheck == true ? "Yes" : "No";
        selectCheckForUndergroundService.value = getExcavationHardcoreStoreFileReportModel.value.data?.checkForUndergroundServices == true ? "Yes" : "No";
        commentController.value.text = getExcavationHardcoreStoreFileReportModel.value.data?.comment ?? "";
        signedOnCompletion.value = File("${await downloadFile(getExcavationHardcoreStoreFileReportModel.value.data?.signedOnCompletionSignature, "signedOnCompletionSignature")}");
        clientApproved.value = File("${await downloadFile(getExcavationHardcoreStoreFileReportModel.value.data?.clientApprovedSignature, "clientApprovedSignature")}");
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }


  Future<void> createExcavationHardcoreStoreFileReportController({
    required Map<String,dynamic> payload,
    required File clientApprovedSignature,
    required File signedOnCompletionSignature,
    required String projectId
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
        Uri.parse("${Api.postExcavationHardcoreStoneFillReport}"),
      );

      request.headers.addAll(headers);


      // Get file extension and MIME type

      request.fields['payload'] = jsonEncode(payload);



      if(signedOnCompletionSignature.path != "") {
        String mimeType = CustomMimeType.getMimeType(signedOnCompletionSignature.path);
        MediaType contentType = MediaType.parse(mimeType);

        // Add file to request with proper MIME type
        request.files.add(
          await http.MultipartFile.fromPath(
            'signed_on_completion_signature', // Field name expected by server
            signedOnCompletionSignature.path,
            filename: "${signedOnCompletionSignature.path.split("/").last}",
            contentType: contentType,
          ),
        );
      }

      if(clientApprovedSignature.path != "") {
        String mimeType = CustomMimeType.getMimeType(clientApprovedSignature.path);
        MediaType contentType = MediaType.parse(mimeType);

        // Add file to request with proper MIME type
        request.files.add(
          await http.MultipartFile.fromPath(
            'client_approved_signature', // Field name expected by server
            clientApprovedSignature.path,
            filename: "${clientApprovedSignature.path.split("/").last}",
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
        String successMessage = responseData['message'];
        kSnackBar(message: successMessage, bgColor: AppColors.green);
        Get.off(()=>ExcavationHardcoreStoreFileReportGetView(projectId: projectId),preventDuplicates: false);
      } else {
        // Handle server error
        String errorMessage = responseData['message'];
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

  Future<String> downloadFile(String url, String fileName) async {
    try {
      // 1. Get the app's document directory
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/$fileName';

      // 2. Download the file
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // 3. Write file to local storage
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        print('File saved at $filePath');
        return filePath;
      } else {
        throw Exception('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return '';
    }
  }




}