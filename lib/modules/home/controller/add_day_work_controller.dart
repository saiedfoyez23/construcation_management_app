import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../common/common.dart';
import '../widget/add_site_diary_widget/add_site_diary_widget.dart';

class AddDayWorkController extends GetxController {


  late stt.SpeechToText _speech;
  RxBool isListening = false.obs;
  Rx<TextEditingController> weatherConditionController = TextEditingController().obs;
  Rx<TextEditingController> dateTimeController = TextEditingController().obs;
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
  // Equipment
  Rx<String> selectedEquipment = "".obs;
  // Workforce
  Rx<String> selectedWorker = "".obs;
  RxList<Workforce> workforceList = <Workforce>[].obs;
  RxList<Equipment> equipmentList = <Equipment>[].obs;
  RxList<Task> taskList = <Task>[].obs;

  RxString project = "".obs;

  RxList<String> projects = <String>[
    'Green Valley School 0',
    'Green Valley School 1',
    'Green Valley School 2'
  ].obs;

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
      dateTimeController.value.text = DateFormat('MMMM dd, yyyy').format(date.value);
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




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _speech = stt.SpeechToText();
    Future.delayed(Duration(seconds: 1),() async {
      await fetchAddress();
    });
  }



}