import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConcreteVolumeCalculator extends StatefulWidget {
  const ConcreteVolumeCalculator({super.key});

  @override
  @override
  State<ConcreteVolumeCalculator> createState() =>
      _ConcreteVolumeCalculatorState();
}

class _ConcreteVolumeCalculatorState extends State<ConcreteVolumeCalculator> {
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _depthController = TextEditingController();
  double _volume = 0.0;

  @override
  void initState() {
    super.initState();
    _lengthController.addListener(_calculateVolume);
    _widthController.addListener(_calculateVolume);
    _depthController.addListener(_calculateVolume);
  }

  void _calculateVolume() {
    final length = double.tryParse(_lengthController.text) ?? 0.0;
    final width = double.tryParse(_widthController.text) ?? 0.0;
    final depth = double.tryParse(_depthController.text) ?? 0.0;
    setState(() {
      _volume = length * width * depth;
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                    title: "Concrete Volume Calculator",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 50),
              Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomTextWidget(
                            title: "Length (meters)",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.linerColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: _lengthController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          CustomTextWidget(
                            title: "Width (meters)",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.linerColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _depthController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          CustomTextWidget(
                            title: "Depth (meters)",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.linerColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _widthController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomButtonWidget(
                        borderRadius: BorderRadius.circular(8),
                        onTap: _calculateVolume,
                        title: "Calculate Volume",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        cardColor: AppColors.blue,
                      ),
                      SizedBox(height: 20),
                      Card(
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                title: "Results",
                                color: AppColors.lightGray,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    title: "Volume:",
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  CustomTextWidget(
                                    title: "${_volume.toStringAsFixed(2)} m³",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
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
}
