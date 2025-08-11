import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoneCalculator extends StatefulWidget {
  const StoneCalculator({super.key});

  @override
  State<StoneCalculator> createState() => _StoneCalculatorState();
}

class _StoneCalculatorState extends State<StoneCalculator> {
  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  final _depthController = TextEditingController();
  double volume = 0.0;
  double tonnage = 0.0;

  // Material types and their densities (tonnes per cubic meter)
  final Map<String, double> materialDensities = {
    'Gravel': 1.5,
    'Limestone': 2.4,
    'Sandstone': 2.2,
  };
  String? selectedMaterial = 'Gravel'; // Default material

  void calculateVolume() {
    double length = double.tryParse(_lengthController.text) ?? 0.0;
    double width = double.tryParse(_widthController.text) ?? 0.0;
    double depth = double.tryParse(_depthController.text) ?? 0.0;
    setState(() {
      volume = length * width * depth;
    });
  }

  void calculateTonnage() {
    calculateVolume();
    double density =
        materialDensities[selectedMaterial] ??
        1.5; // Default to gravel density if null
    setState(() {
      tonnage = volume * density;
    });
  }

  @override
  void dispose() {
    _lengthController.dispose();
    _widthController.dispose();
    _depthController.dispose();
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
                    child: Icon(Icons.arrow_back, size: 25),
                  ),
                  SizedBox(width: 10),
                  CustomTextWidget(
                    title: "Stone Calculator",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 25),
              Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _lengthController,
                        label: "Length (meters)",
                        hint: "0.00",
                      ),
                      _buildTextField(
                        controller: _widthController,
                        label: "Width (meters)",
                        hint: "0.00",
                      ),
                      _buildTextField(
                        controller: _depthController,
                        label: "Depth (meters)",
                        hint: "0.00",
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CustomTextWidget(
                            title: "Material Type",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.linerColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        dropdownColor: AppColors.white,
                        value: selectedMaterial,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                        ),
                        hint: Text("Select Material Type"),
                        items:
                            materialDensities.keys.map((String material) {
                              return DropdownMenuItem<String>(
                                value: material,
                                child: Text(material),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMaterial = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomButtonWidget(
                              onTap: calculateVolume,
                              title: "Calculate Volume",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              borderRadius: BorderRadius.circular(10),
                              cardColor: AppColors.blue,
                            ),
                          ),
                          const SizedBox(width: 10),
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
                                    title: "Volume:",
                                    color: AppColors.lightGray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomTextWidget(
                                    title: "${volume.toStringAsFixed(2)} m³",
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
        SizedBox(height: 10),
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
