import 'dart:math' as math;
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrenchFillCalculator extends StatefulWidget {
  const TrenchFillCalculator({super.key});

  @override
  State<TrenchFillCalculator> createState() => _TrenchFillCalculatorState();
}

class _TrenchFillCalculatorState extends State<TrenchFillCalculator> {
  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  final _depthController = TextEditingController();
  final _pipeDiameterController = TextEditingController();
  double trenchVolume = 0.0;
  double pipeVolume = 0.0;
  double tonnage = 0.0;

  final double density =
      1.6; // Fixed density for fill material (e.g., sand in tonnes per cubic meter)

  void calculateVolumes() {
    double length = double.tryParse(_lengthController.text) ?? 0.0;
    double width = double.tryParse(_widthController.text) ?? 0.0;
    double depth = double.tryParse(_depthController.text) ?? 0.0;
    double pipeDiameter = double.tryParse(_pipeDiameterController.text) ?? 0.0;

    setState(() {
      // Trench volume: length * width * depth
      trenchVolume = length * width * depth;

      // Pipe volume: π * (diameter/2)^2 * length (cylindrical volume)
      pipeVolume =
          pipeDiameter > 0
              ? math.pi * math.pow(pipeDiameter / 2, 2) * length
              : 0.0;
    });
  }

  void calculateTonnage() {
    calculateVolumes();
    double fillVolume =
        trenchVolume - pipeVolume; // Volume of fill material needed
    setState(() {
      tonnage = fillVolume * density;
    });
  }

  @override
  void dispose() {
    _lengthController.dispose();
    _widthController.dispose();
    _depthController.dispose();
    _pipeDiameterController.dispose();
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
                    title: "Pipe Bedding / Trench Fill Calculator",
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
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _lengthController,
                        label: "Trench Length (meters)",
                        hint: "0.00",
                      ),
                      _buildTextField(
                        controller: _widthController,
                        label: "Trench Width (meters)",
                        hint: "0.00",
                      ),
                      _buildTextField(
                        controller: _depthController,
                        label: "Trench Depth (meters)",
                        hint: "0.00",
                      ),
                      _buildTextField(
                        controller: _pipeDiameterController,
                        label: "Pipe Diameter (if applicable)",
                        hint: "0.00",
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomButtonWidget(
                              onTap: calculateVolumes,
                              title: "Calculate Volume",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              borderRadius: BorderRadius.circular(10),
                              cardColor: AppColors.blue,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CustomButtonWidget(
                              onTap: calculateTonnage,
                              title: "Tonnage",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              borderRadius: BorderRadius.circular(10),
                              cardColor: AppColors.blue,
                            ),
                          ),
                        ],
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
                                    title: "Trench Volume:",
                                    color: AppColors.lightGray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomTextWidget(
                                    title:
                                        "${trenchVolume.toStringAsFixed(2)} m³",
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    title: "Pipe Volume:",
                                    color: AppColors.lightGray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomTextWidget(
                                    title:
                                        "${pipeVolume.toStringAsFixed(2)} m³",
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    title: "Tonnage:",
                                    color: AppColors.lightGray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomTextWidget(
                                    title:
                                        "${tonnage.toStringAsFixed(2)} tonnes",
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
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
