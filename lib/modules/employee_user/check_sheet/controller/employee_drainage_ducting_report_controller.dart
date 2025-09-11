import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/employee_check_sheet_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:signature/signature.dart';
import '../../../../common/common.dart';

class EmployeeDrainageDuctingReportController extends GetxController {
  RxBool isSubmit = false.obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<TextEditingController> contractController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> drawingReferenceInclRevisionController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  RxString selectCompletionStatus = "".obs;
  Rx<TextEditingController> subContractorController = TextEditingController().obs;


  RxString selectBedTypeAndThickness = "".obs;
  Rx<TextEditingController> pipeTypeController = TextEditingController().obs;

  RxString selectLine = "".obs;
  RxString selectLevel = "".obs;
  RxString selectPosition = "".obs;
  RxString selectGradient = "".obs;
  RxString selectPopUpDealedOff = "".obs;
  RxString selectTestAirWaterCCTVMandrill = "".obs;
  Rx<TextEditingController> testCertificateReferenceController = TextEditingController().obs;

  RxString selectPipeHaunchingSurrounding = "".obs;
  RxString selectCompaction = "".obs;
  RxString selectBackfill = "".obs;
  RxString selectThickness = "".obs;
  RxString selectType = "".obs;
  RxString selectMakerTape = "".obs;
  Rx<TextEditingController> installByController = TextEditingController().obs;
  Rx<TextEditingController> commentController = TextEditingController().obs;


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


  Future<void> createEmployeeDrainageDuctingReportController({
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
        Uri.parse("${Api.postDrainageDuctingReport}"),
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
        Get.off(()=>EmployeeCheckSheetView(projectId: projectId),preventDuplicates: false);
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


}