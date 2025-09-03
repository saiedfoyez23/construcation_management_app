import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/view/calculator_view.dart';
import 'package:construction_management_app/modules/employee_user/calculator_tools/controller/employee_asphalt_volume_and_tonne_calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeAsphaltVolumeAndTonneCalculatorView extends StatelessWidget {
  EmployeeAsphaltVolumeAndTonneCalculatorView({super.key,required this.projectId});

  final EmployeeAsphaltVolumeAndTonneCalculatorController employeeAsphaltVolumeAndTonneCalculatorController = Get.put(EmployeeAsphaltVolumeAndTonneCalculatorController());
  final String projectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [


              CustomAppBarHelper.normalAppBar(
                height: 70,
                context: context,
                onBackPressed: () {
                  Get.off(()=>CalculatorView(projectId: projectId),preventDuplicates: false);
                },
                title: "Asphalt Volume + Tonne Calculator",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(14.h(context)),

                      Container(
                        width: 375.w(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r(context)),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 12.hpm(context)),
                        child: Column(
                          children: [

                            // Duration Field
                            TextHelperClass.headingText(
                              context: context,
                              text: 'Length(meters)',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: employeeAsphaltVolumeAndTonneCalculatorController.lengthController.value,
                              hintText: "0.00",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            // Duration Field
                            TextHelperClass.headingText(
                              context: context,
                              text: 'Width(meters)',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: employeeAsphaltVolumeAndTonneCalculatorController.widthController.value,
                              hintText: "0.00",
                            ),



                            SpaceHelperClass.v(16.h(context)),

                            // Duration Field
                            TextHelperClass.headingText(
                              context: context,
                              text: 'Thickness(meters)',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: employeeAsphaltVolumeAndTonneCalculatorController.thicknessController.value,
                              hintText: "0.00",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            Row(
                              children: [
                                Expanded(
                                  child: CustomButtonHelper.customRoundedButton(
                                    context: context,
                                    text: "Calculate Volume",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w600,
                                    borderRadius: 8,
                                    backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                    onPressed: () {
                                      if(employeeAsphaltVolumeAndTonneCalculatorController.lengthController.value.text == "") {
                                        kSnackBar(message: "Please enter length", bgColor: AppColors.red);
                                      } else if(employeeAsphaltVolumeAndTonneCalculatorController.widthController.value.text == "") {
                                        kSnackBar(message: "Please enter width", bgColor: AppColors.red);
                                      } else if(employeeAsphaltVolumeAndTonneCalculatorController.thicknessController.value.text == "") {
                                        kSnackBar(message: "Please enter thickness", bgColor: AppColors.red);
                                      } else {
                                        employeeAsphaltVolumeAndTonneCalculatorController.isCalculate.value = true;
                                        employeeAsphaltVolumeAndTonneCalculatorController.lengthWeight.value = 0.0;
                                        employeeAsphaltVolumeAndTonneCalculatorController.widthWeight.value = 0.0;
                                        employeeAsphaltVolumeAndTonneCalculatorController.thicknessWeight.value = 0.0;
                                        employeeAsphaltVolumeAndTonneCalculatorController.length.value = double.parse(employeeAsphaltVolumeAndTonneCalculatorController.lengthController.value.text);
                                        employeeAsphaltVolumeAndTonneCalculatorController.width.value = double.parse(employeeAsphaltVolumeAndTonneCalculatorController.widthController.value.text);
                                        employeeAsphaltVolumeAndTonneCalculatorController.thickness.value = double.parse(employeeAsphaltVolumeAndTonneCalculatorController.thicknessController.value.text);
                                        employeeAsphaltVolumeAndTonneCalculatorController.calculatorValue(
                                          length: employeeAsphaltVolumeAndTonneCalculatorController.length.value,
                                          width: employeeAsphaltVolumeAndTonneCalculatorController.width.value,
                                          thickness: employeeAsphaltVolumeAndTonneCalculatorController.thickness.value,
                                        );
                                      }
                                    },
                                  ),
                                ),

                                SpaceHelperClass.h(8.w(context)),


                                Expanded(
                                  child: CustomButtonHelper.customRoundedButton(
                                    context: context,
                                    text: "Calculate Weight",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w600,
                                    borderRadius: 8,
                                    backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                    onPressed: () {
                                      if(employeeAsphaltVolumeAndTonneCalculatorController.lengthController.value.text == "") {
                                        kSnackBar(message: "Please enter length", bgColor: AppColors.red);
                                      } else if(employeeAsphaltVolumeAndTonneCalculatorController.widthController.value.text == "") {
                                        kSnackBar(message: "Please enter width", bgColor: AppColors.red);
                                      } else if(employeeAsphaltVolumeAndTonneCalculatorController.thicknessController.value.text == "") {
                                        kSnackBar(message: "Please enter thickness", bgColor: AppColors.red);
                                      } else {
                                        employeeAsphaltVolumeAndTonneCalculatorController.isCalculate.value = true;
                                        employeeAsphaltVolumeAndTonneCalculatorController.lengthWeight.value = double.parse(employeeAsphaltVolumeAndTonneCalculatorController.lengthController.value.text);
                                        employeeAsphaltVolumeAndTonneCalculatorController.widthWeight.value = double.parse(employeeAsphaltVolumeAndTonneCalculatorController.widthController.value.text);
                                        employeeAsphaltVolumeAndTonneCalculatorController.thicknessWeight.value = double.parse(employeeAsphaltVolumeAndTonneCalculatorController.thicknessController.value.text);
                                        employeeAsphaltVolumeAndTonneCalculatorController.calculatorWeight(
                                          length: employeeAsphaltVolumeAndTonneCalculatorController.lengthWeight.value,
                                          width: employeeAsphaltVolumeAndTonneCalculatorController.widthWeight.value,
                                          thickness: employeeAsphaltVolumeAndTonneCalculatorController.thicknessWeight.value,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            employeeAsphaltVolumeAndTonneCalculatorController.isCalculate.value == false ?
                            SizedBox.shrink() :
                            Container(
                              width: 375.w(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r(context)),
                                color: Color.fromRGBO(249, 250, 251, 1),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 16.hpm(context)),
                              child: Column(
                                children: [


                                  TextHelperClass.headingText(
                                    context: context,
                                    text: 'Results',
                                    fontSize: 20,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w500,
                                  ),

                                  SpaceHelperClass.v(10.h(context)),


                                  Row(
                                    children: [


                                      Expanded(
                                        child: TextHelperClass.headingText(
                                          context: context,
                                          text: 'Volume:',
                                          fontSize: 20,
                                          textColor: Color.fromRGBO(75, 85, 99, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),



                                      Expanded(
                                        child: TextHelperClass.headingText(
                                          textAlign: TextAlign.end,
                                          alignment: Alignment.bottomRight,
                                          context: context,
                                          text: "${employeeAsphaltVolumeAndTonneCalculatorController.calculatorValue(
                                            length: employeeAsphaltVolumeAndTonneCalculatorController.length.value,
                                            width: employeeAsphaltVolumeAndTonneCalculatorController.width.value,
                                            thickness: employeeAsphaltVolumeAndTonneCalculatorController.thickness.value,
                                          ).round()} m³",
                                          fontSize: 20,
                                          textColor: Color.fromRGBO(17, 24, 39, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),


                                    ],
                                  ),

                                  SpaceHelperClass.v(10.h(context)),


                                  Row(
                                    children: [


                                      Expanded(
                                        child: TextHelperClass.headingText(
                                          context: context,
                                          text: 'Weight:',
                                          fontSize: 20,
                                          textColor: Color.fromRGBO(75, 85, 99, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),



                                      Expanded(
                                        child: TextHelperClass.headingText(
                                          textAlign: TextAlign.end,
                                          alignment: Alignment.bottomRight,
                                          context: context,
                                          text: "${employeeAsphaltVolumeAndTonneCalculatorController.calculatorWeight(
                                            length: employeeAsphaltVolumeAndTonneCalculatorController.lengthWeight.value,
                                            width: employeeAsphaltVolumeAndTonneCalculatorController.widthWeight.value,
                                            thickness: employeeAsphaltVolumeAndTonneCalculatorController.thicknessWeight.value,
                                          ).round()} tonnes",
                                          fontSize: 20,
                                          textColor: Color.fromRGBO(17, 24, 39, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),


                                    ],
                                  ),



                                ],
                              ),
                            )





                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      )),
    );
  }

  Widget _buildDurationField({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
  }) {
    return CustomTextFormFieldClass.build(
      context: context,
      controller: controller,
      hintText: hintText,
      borderColor: Color.fromRGBO(229, 231, 235, 1),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.hpm(context),
        vertical: 8.vpm(context),
      ),
      borderRadius: 8,
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.vpm(context),
          horizontal: 16.hpm(context),
        ),
        child: ImageHelperClass.customImageContainer(
          context: context,
          height: 12.h(context),
          width: 12.w(context),
          imagePath: AppImages.arrowSwapIcon,
          imageFit: BoxFit.contain,
          fit: BoxFit.contain,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

}
