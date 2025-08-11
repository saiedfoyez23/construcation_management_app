import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadEstimator extends StatefulWidget {
  const LoadEstimator({super.key});

  @override
  State<LoadEstimator> createState() => _LoadEstimatorState();
}

class _LoadEstimatorState extends State<LoadEstimator> {
  final _totalVolumeController = TextEditingController();
  final _truckCapacityController = TextEditingController(
    text: "6.00",
  ); // Default truck capacity
  int truckLoads = 0;
  String? errorMessage;

  void calculateTruckLoads() {
    double totalVolume = double.tryParse(_totalVolumeController.text) ?? 0.0;
    double truckCapacity =
        double.tryParse(_truckCapacityController.text) ?? 0.0;

    if (totalVolume <= 0 || truckCapacity <= 0) {
      setState(() {
        errorMessage = "Please enter valid positive numbers.";
        truckLoads = 0;
      });
      return;
    }

    setState(() {
      errorMessage = null;
      // Calculate truck loads and round up to the nearest whole number
      truckLoads = (totalVolume / truckCapacity).ceil();
    });
  }

  @override
  void dispose() {
    _totalVolumeController.dispose();
    _truckCapacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back, size: 25),
                  ),
                  SizedBox(width: 10),
                  CustomTextWidget(
                    title: "Load Estimator",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 20),
              Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 18,
                  ),
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _totalVolumeController,
                        label: "Total Volume",
                        hint: "0.00",
                      ),
                      _buildTextField(
                        controller: _truckCapacityController,
                        label: "Truck Capacity",
                        hint: "6.00",
                      ),
                      if (errorMessage != null) ...[
                        const SizedBox(height: 10),
                        CustomTextWidget(
                          title: errorMessage!,
                          fontSize: 14,
                          color: AppColors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                      const SizedBox(height: 20),
                      CustomButtonWidget(
                        onTap: calculateTruckLoads,
                        title: "Calculate Trucks Required",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        borderRadius: BorderRadius.circular(10),
                        cardColor: AppColors.blue,
                      ),
                      SizedBox(height: 20),
                      Card(
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomTextWidget(
                                    title: "Results:",
                                    color: AppColors.lightGray,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    title: "Truck Load Estimate:",
                                    color: AppColors.lightGray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomTextWidget(
                                    title: "$truckLoads truck loads",
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          title: label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.linerColor,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            border: const OutlineInputBorder(),
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
            ),
          ),
          onChanged: (_) => setState(() => errorMessage = null),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
