import 'package:construction_management_app/modules/company_user/create_project/model/get_all_project_response_model.dart';
import 'package:construction_management_app/modules/company_user/day_work/model/get_single_day_work_details_response_model.dart';
import 'package:construction_management_app/modules/company_user/day_work/view/day_work_details_view.dart';
import 'package:construction_management_app/modules/company_user/project_details/model/get_project_details_response_model.dart';
import 'package:construction_management_app/modules/company_user/resources/model/get_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/company_user/resources/model/get_all_workforces_response_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../../common/common.dart';

class DayWorkEditController extends GetxController {

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
  Rx<TextEditingController> materialUsedController = TextEditingController().obs;
  Rx<GetSingleDayWorkDetailsResponseModel> getSingleDayWorkDetailsResponseModel = GetSingleDayWorkDetailsResponseModel().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> workforceQuantityController = TextEditingController().obs;
  Rx<TextEditingController> workForceDurationController = TextEditingController().obs;
  Rx<TextEditingController> equipmentQuantityController = TextEditingController().obs;
  Rx<TextEditingController> equipmentDurationController = TextEditingController().obs;

  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetAllProjectResponseModel> getAllProjectResponseModel = GetAllProjectResponseModel().obs;
  Rx<GetAllProject> selectSingleProject = GetAllProject().obs;
  RxBool isLoading = false.obs;

  Rx<GetProjectDetailsResponseModel> getProjectDetailsResponseModel = GetProjectDetailsResponseModel().obs;


  Rx<GetAllEquipmentsResponseModel> getAllEquipmentsResponseModel = GetAllEquipmentsResponseModel().obs;
  Rx<GetAllEquipmentsResponse> selectedEquipment = GetAllEquipmentsResponse().obs;
  // Workforce
  Rx<GetAllWorkforcesResponse> selectedWorkforces = GetAllWorkforcesResponse().obs;
  Rx<GetAllWorkforcesResponseModel> getAllWorkforcesResponseModel = GetAllWorkforcesResponseModel().obs;


  Rx<DateTime> date = DateTime.now().obs;

  // Equipment

  RxList<DayWorkEditWorkforce> workforceList = <DayWorkEditWorkforce>[].obs;
  RxList<DayWorkEditEquipment> equipmentList = <DayWorkEditEquipment>[].obs;
  RxList<DayWorkEditTask> taskList = <DayWorkEditTask>[].obs;

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


  Future<void> getDayWorkDetailsController({required String dayWorkId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.detailsDayWork}/${dayWorkId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getSingleDayWorkDetailsResponseModel.value = GetSingleDayWorkDetailsResponseModel.fromJson(responseBody);
        taskList.value = getSingleDayWorkDetailsResponseModel.value.toTaskList();
        nameController.value.text = getSingleDayWorkDetailsResponseModel.value.data?.name ?? "";
        descriptionController.value.text = getSingleDayWorkDetailsResponseModel.value.data?.description ?? "";
        commendController.value.text = getSingleDayWorkDetailsResponseModel.value.data?.comment ?? "";
        delayController.value.text = getSingleDayWorkDetailsResponseModel.value.data?.duration ?? "";
        dateTimeController.value.text = getSingleDayWorkDetailsResponseModel.value.data?.date ?? "";
        locationController.value.text = getSingleDayWorkDetailsResponseModel.value.data?.location ?? "";
        weatherConditionController.value.text = getSingleDayWorkDetailsResponseModel.value.data?.weatherCondition ?? "";
        materialUsedController.value.text = getSingleDayWorkDetailsResponseModel.value.data?.materials ?? "";
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

  Future<void> removeTasksDayWorkController({required String dayWorkId,required int index}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.patchRequest(
          api: "${Api.removeTaskDayWork}/${dayWorkId}",
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


  Future<void> addTasksDayWorkController({required String dayWorkId,required Map<String,dynamic> data}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };



      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: "${Api.addTaskDayWork}/${dayWorkId}",
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


  Future<void> getAllWorkforceController({required String projectId}) async {
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
        getAllWorkforcesResponseModel.value = GetAllWorkforcesResponseModel.fromJson(responseBody);
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


  Future<void> getAllEquipmentsController({required String projectId}) async {
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
        getAllEquipmentsResponseModel.value = GetAllEquipmentsResponseModel.fromJson(responseBody);
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
    required String dayWorkId,
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
        Uri.parse("${Api.updateDayWork}/${dayWorkId}"),
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
        Get.off(()=>DayWorkDetailsView(projectId: projectId, dayWorkId: dayWorkId,),preventDuplicates: false);
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
  String dayWorkId;
  DayWorkEditController({required this.projectId,required this.dayWorkId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    _speech = stt.SpeechToText();
    Future.delayed(Duration(seconds: 1),() async {
      await getDayWorkDetailsController(dayWorkId: dayWorkId);
      await getProjectDetailsController(projectId: projectId);
      await getAllWorkforceController(projectId: projectId);
      await getAllEquipmentsController(projectId: projectId);
    });
  }

}


class DayWorkEditTask {
  final String name;
  final List<DayWorkEditWorkforce> workforce;
  final List<DayWorkEditEquipment> equipment;

  DayWorkEditTask(this.name, this.workforce, this.equipment);

}

class DayWorkEditWorkforce {
  final String typeId;
  final int quantity;
  final int duration;

  DayWorkEditWorkforce(this.typeId, this.quantity, this.duration);

}

class DayWorkEditEquipment {
  final String typeId;
  final int quantity;
  final int duration;

  DayWorkEditEquipment(this.typeId, this.quantity, this.duration);
}


extension DayWorkMapper on GetSingleDayWorkDetailsResponseModel {
  List<DayWorkEditTask> toTaskList() {
    if (data?.tasks == null) return [];

    return data!.tasks!.map((task) {
      // Map Workforces
      final workforceList = task.workforces?.map((wf) {
        return DayWorkEditWorkforce(
          wf.workforce?.sId ?? "",
          (wf.quantity is int)
              ? wf.quantity
              : int.tryParse(wf.quantity.toString()) ?? 0,
          _parseDurationToInt(wf.duration),
        );
      }).toList() ?? [];

      // Map Equipments
      final equipmentList = task.equipments?.map((eq) {
        return DayWorkEditEquipment(
          eq.equipment?.sId ?? "",
          (eq.quantity is int)
              ? eq.quantity
              : int.tryParse(eq.quantity.toString()) ?? 0,
          _parseDurationToInt(eq.duration),
        );
      }).toList() ?? [];

      // Return Task
      return DayWorkEditTask(
        task.name ?? "",
        workforceList,
        equipmentList,
      );
    }).toList();
  }
}

/// Helper function to convert "25 hours" → 25
int _parseDurationToInt(dynamic duration) {
  if (duration == null) return 0;
  if (duration is int) return duration;

  final str = duration.toString().trim();
  final number = int.tryParse(str.split(" ").first);
  return number ?? 0;
}