import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsphaltVolumeAndTonneCalculatorController extends GetxController {


  Rx<TextEditingController> lengthController = TextEditingController().obs;
  Rx<TextEditingController> widthController = TextEditingController().obs;
  Rx<TextEditingController> thicknessController = TextEditingController().obs;

  RxDouble length = 0.0.obs;
  RxDouble width = 0.0.obs;
  RxDouble thickness = 0.0.obs;
  RxBool isCalculate = false.obs;

  RxDouble lengthWeight = 0.0.obs;
  RxDouble widthWeight = 0.0.obs;
  RxDouble thicknessWeight = 0.0.obs;

  RxDouble calculatorValue({required double length,required double width,required double thickness}) {
    return (length * width * thickness).obs;
  }

  RxDouble calculatorWeight({required double length,required double width,required double thickness}) {
    return (calculatorValue(length: length, width: width, thickness: thickness) * 2.4).obs;
  }



}