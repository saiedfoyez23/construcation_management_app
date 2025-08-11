import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsphaltTonneCalculator extends StatefulWidget {
  const AsphaltTonneCalculator({super.key});

  @override
  State<AsphaltTonneCalculator> createState() => _AsphaltTonneCalculatorState();
}

class _AsphaltTonneCalculatorState extends State<AsphaltTonneCalculator> {
  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  final _thicknessController = TextEditingController();
  double volume = 0.0;
  double weight = 0.0;
  final double density = 2.4; // tonnes per cubic meter (approximate)

  void calculateVolume() {
    double length = double.tryParse(_lengthController.text) ?? 0.0;
    double width = double.tryParse(_widthController.text) ?? 0.0;
    double thickness = double.tryParse(_thicknessController.text) ?? 0.0;
    setState(() {
      volume = length * width * thickness;
    });
  }

  void calculateWeight() {
    calculateVolume();
    setState(() {
      weight = volume * density;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
                    title: "Asphalt volume + Tonne calculator",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 35),
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
                      SizedBox(height: 10),
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
                      SizedBox(height: 10),
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
                        controller: _widthController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CustomTextWidget(
                            title: "Thickness (meters)",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.linerColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _thicknessController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomButtonWidget(
                              width: 151,
                              onTap: calculateVolume,
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
                              width: 151,
                              onTap: calculateWeight,
                              borderRadius: BorderRadius.circular(10),
                              title: "Calculate Weight",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              cardColor: AppColors.blue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Card(
                        color: AppColors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomTextWidget(
                                    title: "Results: ",
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
                                    title: "Volume: ",
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
                                    title: "Weight: ",
                                    color: AppColors.lightGray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomTextWidget(
                                    title:
                                        "${weight.toStringAsFixed(2)} tonnes ",
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
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
