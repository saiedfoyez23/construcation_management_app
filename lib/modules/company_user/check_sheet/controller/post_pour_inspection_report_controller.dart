import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/check_sheet_view.dart';
import 'package:construction_management_app/modules/company_user/project_details/model/get_project_details_response_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:signature/signature.dart';
import '../../../../common/common.dart';


class PostPourInspectionReportController extends GetxController {

  Rx<TextEditingController> projectNameController = TextEditingController().obs;
  Rx<TextEditingController> pourNoController = TextEditingController().obs;
  Rx<TextEditingController> pourDateController = TextEditingController().obs;
  Rx<TextEditingController> inspectionDataTimeController = TextEditingController().obs;
  Rx<TextEditingController> drawingSketchNoRevisionController = TextEditingController().obs;
  Rx<TextEditingController> gaDrawingController = TextEditingController().obs;
  Rx<TextEditingController> rebarDrgsController = TextEditingController().obs;
  Rx<TextEditingController> temporaryWorksController = TextEditingController().obs;
  Rx<TextEditingController> pourReferenceController = TextEditingController().obs;
  Rx<TextEditingController> lineLevelPositionController = TextEditingController().obs;
  RxBool isSubmit = false.obs;

  Rx<GetProjectDetailsResponseModel> getProjectDetailsResponseModel = GetProjectDetailsResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  RxString selectInspection = "".obs;
  RxBool isInspection = false.obs;
  Rx<TextEditingController> concreteFinishTypeCommentController = TextEditingController().obs;
  RxString selectConcreteFinishTypeInspection = "".obs;
  RxBool isConcreteFinishTypeInspection = false.obs;
  Rx<TextEditingController> chamfersEdgingCommentController = TextEditingController().obs;
  RxString selectChamfersEdgingInspection = "".obs;
  RxBool isChamfersEdgingInspection = false.obs;
  Rx<TextEditingController> commentInspectionController = TextEditingController().obs;
  RxString selectDrainageElementsInspection = "".obs;
  RxBool isDrainageElementsInspection = false.obs;
  Rx<TextEditingController> commentDrainageElementsController = TextEditingController().obs;
  RxString selectHoldingDownBoltsInspection = "".obs;
  RxBool isHoldingDownBoltsInspection = false.obs;
  Rx<TextEditingController> commentHoldingDownBoltsController = TextEditingController().obs;
  RxString selectCrackInducersInspection = "".obs;
  RxBool isCrackInducersInspection = false.obs;
  Rx<TextEditingController> commentCrackInducersController = TextEditingController().obs;
  RxString selectWaterprooflingMembraneInspection = "".obs;
  RxBool isWaterprooflingMembraneInspection = false.obs;
  Rx<TextEditingController> commentWaterprooflingMembraneController = TextEditingController().obs;
  RxString selectOthersInspection = "".obs;
  RxBool isOthersInspection = false.obs;
  Rx<TextEditingController> commentOthersController = TextEditingController().obs;

  Rx<Color> selectedSignedOnCompletionColor = Colors.black.obs;
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



  RxBool isLoading = false.obs;
  String projectId;
  PostPourInspectionReportController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getProjectDetailsController(projectId: projectId);
    });
  }


  Future<void> getProjectDetailsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.projectDetails}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getProjectDetailsResponseModel.value = GetProjectDetailsResponseModel.fromJson(responseBody);
        projectNameController.value.text = getProjectDetailsResponseModel.value.data?.name ?? "";
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


  Future<void> createPostPostPourInspectionReportsController({
    required Map<String,dynamic> payload,
    required File clientApprovedSignature,
    required File signedOnCompletionSignature,
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
        Uri.parse("${Api.postPostPourInspectionReports}"),
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
        Get.off(()=>CheckSheetView(projectId: projectId),preventDuplicates: false);
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