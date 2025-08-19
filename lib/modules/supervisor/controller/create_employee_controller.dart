import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEmployeeController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> employeeIdController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxString phoneNumber = "".obs;
  RxBool isObscureText = true.obs;
  RxString selectEmployeeType = "".obs;
  RxString sendEmployeeType = "".obs;

  RxList<String> employeeType = <String>[
    'Supervisor',
    'Manager',
  ].obs;



}