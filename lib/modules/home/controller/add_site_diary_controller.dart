import 'dart:io';

import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AddSiteDiaryController extends GetxController {

  late stt.SpeechToText _speech;
  RxBool isListening = false.obs;
  Rx<TextEditingController> weatherConditionController = TextEditingController().obs;
  Rx<TextEditingController> dateTimeController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<TextEditingController> audioController = TextEditingController().obs;
  Rx<TextEditingController> taskNameController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
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


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _speech = stt.SpeechToText();
  }






}


class Task {
  final String name;
  final List<Workforce> workforce;
  final List<Equipment> equipment;

  Task(this.name, this.workforce, this.equipment);
}

class Workforce {
  final String type;
  final int quantity;
  final int duration;

  Workforce(this.type, this.quantity, this.duration);
}

class Equipment {
  final String type;
  final int quantity;
  final int duration;

  Equipment(this.type, this.quantity, this.duration);
}