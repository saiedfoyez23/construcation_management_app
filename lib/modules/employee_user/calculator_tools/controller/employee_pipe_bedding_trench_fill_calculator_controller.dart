import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeePipeBeddingTrenchFillCalculatorController extends GetxController {

  Rx<TextEditingController> trenchLengthController = TextEditingController().obs;
  Rx<TextEditingController> trenchWidthController = TextEditingController().obs;
  Rx<TextEditingController> trenchDepthController = TextEditingController().obs;
  Rx<TextEditingController> pipeDiameterController = TextEditingController().obs;


  RxDouble trenchLength = 0.0.obs;
  RxDouble trenchWidth = 0.0.obs;
  RxDouble trenchDepth = 0.0.obs;
  RxBool isCalculate = false.obs;

  RxDouble trenchLengthWeight = 0.0.obs;
  RxDouble trenchWidthWeight = 0.0.obs;
  RxDouble trenchDepthWeight = 0.0.obs;
  RxDouble pipeDiameter = 0.0.obs;

  RxDouble calculatorValue({required double trenchLength,required double trenchWidth,required double trenchDepth}) {
    return (trenchLength * trenchWidth * trenchDepth).obs;
  }

  Rx<Rx<double>> calculatorWeight({required double trenchLength,required double trenchWidth,required double trenchDepth,required double pipeDiameter}) {
    return (calculatorValue(trenchLength: trenchLength, trenchWidth: trenchWidth, trenchDepth: trenchDepth) - pipeDiameter).obs;
  }


}