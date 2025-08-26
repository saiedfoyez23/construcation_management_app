import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConcreteVolumeCalculatorController extends GetxController {


  Rx<TextEditingController> lengthController = TextEditingController().obs;
  Rx<TextEditingController> widthController = TextEditingController().obs;
  Rx<TextEditingController> depthController = TextEditingController().obs;
  RxBool isCalculate = false.obs;

  RxDouble calculatorValue({required double length,required double width,required double depth}) {
    return (length * width * depth).obs;
  }


}