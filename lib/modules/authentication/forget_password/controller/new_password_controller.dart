import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isObscureText = true.obs;
  RxBool isConfirmObscureText = true.obs;

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;



}