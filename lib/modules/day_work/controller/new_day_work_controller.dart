import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/create_project/model/get_all_project_response_model.dart';
import 'package:construction_management_app/modules/day_work/view/day_work_view.dart';
import 'package:construction_management_app/modules/day_work/widget/add_day_work_widget/new_add_day_work_widget.dart';
import 'package:construction_management_app/modules/home/widget/add_site_diary_widget/add_site_diary_widget.dart';
import 'package:construction_management_app/modules/project_details/model/get_project_details_response_model.dart';
import 'package:construction_management_app/modules/resources/model/get_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/resources/model/get_all_workforces_response_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../common/common.dart';

class NewDayWorkController extends GetxController {

  late stt.SpeechToText _speech;
  RxBool isListening = false.obs;
  RxBool isSubmit = false.obs;


  Rx<TextEditingController> weatherConditionController = TextEditingController().obs;
  Rx<TextEditingController> dateTimeController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<TextEditingController> audioController = TextEditingController().obs;
  Rx<TextEditingController> taskNameController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> metrialUsedController = TextEditingController().obs;
  Rx<TextEditingController> workforceQuantityController = TextEditingController().obs;
  Rx<TextEditingController> workForceDurationController = TextEditingController().obs;
  Rx<TextEditingController> equipmentQuantityController = TextEditingController().obs;
  Rx<TextEditingController> equipmentDurationController = TextEditingController().obs;
  Rx<DateTime> date = DateTime.now().obs;
  RxString supervisor = 'Jane Cooper'.obs;
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


  // Equipment

  RxList<DayWorkWorkforce> workforceList = <DayWorkWorkforce>[].obs;
  RxList<DayWorkEquipment> equipmentList = <DayWorkEquipment>[].obs;
  RxList<DayWorkTask> taskList = <DayWorkTask>[].obs;

  Rx<File> selectedImage = File("").obs;


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

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      kSnackBar(message: 'Location services are disabled.', bgColor: AppColors.red);
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        kSnackBar(message: 'Location permissions are denied.', bgColor: AppColors.red);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      kSnackBar(message: 'Location permissions are permanently denied, we cannot request.', bgColor: AppColors.red);
    }

    // Get current position
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }


  Future<String> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    } else {
      kSnackBar(message: "No address available", bgColor: AppColors.red);
      return "No address available";
    }
  }


  Future<void> fetchAddress() async {
    try {
      Position position = await getCurrentLocation();
      locationController.value.text = await getAddressFromLatLng(position);
      print("📍 Address: ${locationController.value.text}");
    } catch (e) {
      kSnackBar(message: "Error: $e", bgColor: AppColors.red);
    }
  }


  Future<void> createDayWorksController({
    required Map<String,dynamic> payload,
    required File image,
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
        'POST',
        Uri.parse(Api.createDayWorks),
      );

      request.headers.addAll(headers);


      // Get file extension and MIME type

      request.fields['payload'] = jsonEncode(payload);


      String mimeType = CustomMimeType.getMimeType(image.path);
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
        Get.off(()=>DayWorkView(projectId: projectId),preventDuplicates: false);
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

  NewDayWorkController({required this.projectId});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    _speech = stt.SpeechToText();
    Future.delayed(Duration(seconds: 1),() async {
      await fetchAddress();
      await getProjectDetailsController(projectId: projectId);
      await getAllWorkforceController(projectId: projectId);
      await getAllEquipmentsController(projectId: projectId);
    });
  }







}