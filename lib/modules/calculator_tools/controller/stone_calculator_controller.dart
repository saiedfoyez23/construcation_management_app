import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoneCalculatorController extends GetxController {


  Rx<TextEditingController> lengthController = TextEditingController().obs;
  Rx<TextEditingController> widthController = TextEditingController().obs;
  Rx<TextEditingController> depthController = TextEditingController().obs;

  RxString selectMaterialType = "".obs;

  RxDouble length = 0.0.obs;
  RxDouble width = 0.0.obs;
  RxDouble depth = 0.0.obs;
  RxBool isCalculate = false.obs;

  RxDouble lengthWeight = 0.0.obs;
  RxDouble widthWeight = 0.0.obs;
  RxDouble depthWeight = 0.0.obs;

  RxDouble calculatorValue({required double length,required double width,required double depth}) {
    return (length * width * depth).obs;
  }

  RxDouble calculatorWeight({required double length,required double width,required double depth,required String materialType}) {
    if(materialType == 'crushed') {
      return (calculatorValue(length: length, width: width, depth: depth) * 2.0).obs;
    } else {
      return (calculatorValue(length: length, width: width, depth: depth) * 1.6).obs;
    }
  }


}