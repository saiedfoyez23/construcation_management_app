import 'package:construction_management_app/modules/company_user/site_diary/view/site_diary_details_view.dart';
import 'package:construction_management_app/modules/employee_user/create_project/model/get_all_project_response_model.dart';
import 'package:construction_management_app/modules/employee_user/project_details/model/get_employee_project_details_response_model.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_workforces_response_model.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/model/get_employee_single_site_diary_details_response_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../common/common.dart';

class EmployeeSiteDiaryEditController extends GetxController {

  late stt.SpeechToText _speech;
  RxBool isListening = false.obs;
  RxBool isSubmit = false.obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> weatherConditionController = TextEditingController().obs;
  Rx<TextEditingController> commendController = TextEditingController().obs;
  Rx<TextEditingController> delayController = TextEditingController().obs;
  Rx<TextEditingController> dateTimeController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<TextEditingController> audioController = TextEditingController().obs;
  Rx<TextEditingController> taskNameController = TextEditingController().obs;
  Rx<GetEmployeeSingleSiteDiaryDetailsResponseModel> getEmployeeSingleSiteDiaryDetailsResponseModel = GetEmployeeSingleSiteDiaryDetailsResponseModel().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> workforceQuantityController = TextEditingController().obs;
  Rx<TextEditingController> workForceDurationController = TextEditingController().obs;
  Rx<TextEditingController> equipmentQuantityController = TextEditingController().obs;
  Rx<TextEditingController> equipmentDurationController = TextEditingController().obs;

  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<EmployeeGetAllProjectResponseModel> employeeGetAllProjectResponseModel = EmployeeGetAllProjectResponseModel().obs;
  Rx<EmployeeGetAllProject> selectSingleProject = EmployeeGetAllProject().obs;
  RxBool isLoading = false.obs;

  Rx<GetEmployeeProjectDetailsResponseModel> getEmployeeProjectDetailsResponseModel = GetEmployeeProjectDetailsResponseModel().obs;


  Rx<GetEmployeeAllEquipmentsResponseModel> getEmployeeAllEquipmentsResponseModel = GetEmployeeAllEquipmentsResponseModel().obs;
  Rx<GetEmployeeAllEquipmentsResponse> selectedEquipment = GetEmployeeAllEquipmentsResponse().obs;
  // Workforce
  Rx<GetEmployeeAllWorkforcesResponse> selectedWorkforces = GetEmployeeAllWorkforcesResponse().obs;
  Rx<GetEmployeeAllWorkforcesResponseModel> getEmployeeAllWorkforcesResponseModel = GetEmployeeAllWorkforcesResponseModel().obs;


  Rx<DateTime> date = DateTime.now().obs;

  // Equipment

  RxList<EmployeeEditSiteDiaryWorkforce> workforceList = <EmployeeEditSiteDiaryWorkforce>[].obs;
  RxList<EmployeeEditSiteDiaryEquipment> equipmentList = <EmployeeEditSiteDiaryEquipment>[].obs;
  RxList<EmployeeEditSiteDiaryTask> taskList = <EmployeeEditSiteDiaryTask>[].obs;

  Rx<File> selectedImage = File("").obs;


  Future<void> speechListen() async {
    if (!isListening.value == true) {
      print("hello");
      bool available = await _speech.initialize(
        onStatus: (val) {
          print(isListening.value);
          print('onStatus: $val');
          if(val == "notListening" || val == "done") {
            isListening.value = false;
            _speech.stop();
          } else {
            isListening.value = true;
          }
        },
        onError: (val) {
          print('onError: $val');
        },
      );
      print(available);
      if (available) {
        isListening.value = true;
        _speech.listen(
          onResult: (val) {
            audioController.value.text = val.recognizedWords;
          },
          pauseFor: Duration(seconds: 30),  // Pause after 3 seconds of silence to stop recording
          listenFor: Duration(seconds: 30),  // Max listening time
        );
      }
    } else {
      isListening.value = false;
      _speech.stop();
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      kSnackBar(message: 'Error: ${e.toString()}', bgColor: AppColors.red);
    }
  }

  Future<void> pickDateTime({required BuildContext context}) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      date.value = picked;
      dateTimeController.value.text = picked.toString();
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


  Future<void> getEmployeeSiteDiaryDetailsController({required String siteDiaryId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.detailsSiteDiary}/${siteDiaryId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeSingleSiteDiaryDetailsResponseModel.value = GetEmployeeSingleSiteDiaryDetailsResponseModel.fromJson(responseBody);
        final siteDiaryData = getEmployeeSingleSiteDiaryDetailsResponseModel.value.data;
        taskList.value = siteDiaryData?.toTaskList() ?? [];
        nameController.value.text = getEmployeeSingleSiteDiaryDetailsResponseModel.value.data?.name ?? "";
        descriptionController.value.text = getEmployeeSingleSiteDiaryDetailsResponseModel.value.data?.description ?? "";
        commendController.value.text = getEmployeeSingleSiteDiaryDetailsResponseModel.value.data?.comment ?? "";
        delayController.value.text = getEmployeeSingleSiteDiaryDetailsResponseModel.value.data?.duration ?? "";
        dateTimeController.value.text = getEmployeeSingleSiteDiaryDetailsResponseModel.value.data?.date ?? "";
        locationController.value.text = getEmployeeSingleSiteDiaryDetailsResponseModel.value.data?.location ?? "";
        weatherConditionController.value.text = getEmployeeSingleSiteDiaryDetailsResponseModel.value.data?.weatherCondition ?? "";
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }

  Future<void> removeTasksSiteDiaryController({required String siteDiaryId,required int index}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.patchRequest(
          api: "${Api.removeTaskSiteDiary}/${siteDiaryId}",
          headers: headers,
          body: jsonEncode({
            "task_index": index,
          })
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");

      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }


  Future<void> addTasksSiteDiaryController({required String siteDiaryId,required Map<String,dynamic> data}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };



      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: "${Api.addTaskSiteDiary}/${siteDiaryId}",
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");

      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }


  Future<void> getEmployeeProjectDetailsController({required String projectId}) async {
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
        getEmployeeProjectDetailsResponseModel.value = GetEmployeeProjectDetailsResponseModel.fromJson(responseBody);
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


  Future<void> getEmployeeAllWorkforceController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getProjectWorkforce}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeAllWorkforcesResponseModel.value = GetEmployeeAllWorkforcesResponseModel.fromJson(responseBody);
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }


  Future<void> getEmployeeAllEquipmentsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getProjectEquipments}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeAllEquipmentsResponseModel.value = GetEmployeeAllEquipmentsResponseModel.fromJson(responseBody);
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


  Future<void> updateSiteDiaryController({
    required Map<String,dynamic> payload,
    File? image,
    required String siteDiaryId,
    required String projectId,
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
        'PUT',
        Uri.parse("${Api.updateSiteDiary}/${siteDiaryId}"),
      );

      request.headers.addAll(headers);


      // Get file extension and MIME type

      request.fields['payload'] = jsonEncode(payload);

      if(image?.path != "") {
        String mimeType = CustomMimeType.getMimeType(image!.path);
        MediaType contentType = MediaType.parse(mimeType);

        // Add file to request with proper MIME type
        request.files.add(
          await http.MultipartFile.fromPath(
            'image', // Field name expected by server
            image.path,
            filename: "${image.path.split("/").last}",
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
        Get.off(()=>SiteDiaryDetailsView(projectId: projectId, siteDiaryId: siteDiaryId,),preventDuplicates: false);
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


  String projectId;
  String siteDiaryId;
  EmployeeSiteDiaryEditController({required this.projectId,required this.siteDiaryId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    _speech = stt.SpeechToText();
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeSiteDiaryDetailsController(siteDiaryId: siteDiaryId);
      await getEmployeeProjectDetailsController(projectId: projectId);
      await getEmployeeAllWorkforceController(projectId: projectId);
      await getEmployeeAllEquipmentsController(projectId: projectId);
    });
  }

}


class EmployeeEditSiteDiaryTask {
  final String name;
  final List<EmployeeEditSiteDiaryWorkforce> workforce;
  final List<EmployeeEditSiteDiaryEquipment> equipment;

  EmployeeEditSiteDiaryTask(this.name, this.workforce, this.equipment);

}

class EmployeeEditSiteDiaryWorkforce {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeeEditSiteDiaryWorkforce(this.typeId, this.quantity, this.duration);
}

class EmployeeEditSiteDiaryEquipment {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeeEditSiteDiaryEquipment(this.typeId, this.quantity, this.duration);
}


extension SiteDiaryMapper on GetEmployeeSingleSiteDiaryDetailsResponse {
  List<EmployeeEditSiteDiaryTask> toTaskList() {
    if (tasks == null) return [];

    return tasks!.map((task) {
      final workforceList = task.workforces?.map((wf) {
        return EmployeeEditSiteDiaryWorkforce(
          wf.workforce?.sId ?? "",
          (wf.quantity is int)
              ? wf.quantity
              : int.tryParse(wf.quantity.toString()) ?? 0,
          _parseDurationToInt(wf.duration),
        );
      }).toList() ?? [];

      final equipmentList = task.equipments?.map((eq) {
        return EmployeeEditSiteDiaryEquipment(
          eq.equipment?.sId ?? "",
          (eq.quantity is int)
              ? eq.quantity
              : int.tryParse(eq.quantity.toString()) ?? 0,
          _parseDurationToInt(eq.duration),
        );
      }).toList() ?? [];

      return EmployeeEditSiteDiaryTask(
        task.name ?? "",
        workforceList,
        equipmentList,
      );
    }).toList();
  }
}

int _parseDurationToInt(dynamic duration) {
  if (duration == null) return 0;
  if (duration is int) return duration;
  final str = duration.toString();
  final number = int.tryParse(str.split(" ").first);
  return number ?? 0;
}