import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeLoadEstimatorController extends GetxController {

  Rx<TextEditingController> totalVolumeController = TextEditingController().obs;
  Rx<TextEditingController> truckCapacityController = TextEditingController().obs;

  RxDouble totalVolume = 0.0.obs;
  RxDouble truckCapacity = 0.0.obs;

  RxBool isCalculate = false.obs;

  RxDouble calculatorValue({required double totalVolume,required double truckCapacity}) {
    return (totalVolume / truckCapacity).obs;
  }


}