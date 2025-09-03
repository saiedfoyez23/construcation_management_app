import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/controller/concrete_volume_calculator_controller.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/view/calculator_view.dart';
import 'package:construction_management_app/modules/employee_user/calculator_tools/controller/employee_concrete_volume_calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeConcreteVolumeCalculatorView extends StatelessWidget {
  EmployeeConcreteVolumeCalculatorView({super.key,required this.projectId});

  final String projectId;
  final EmployeeConcreteVolumeCalculatorController employeeConcreteVolumeCalculatorController = Get.put(EmployeeConcreteVolumeCalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [


              CustomAppBarHelper.normalAppBar(
                context: context,
                onBackPressed: () {
                  Get.off(()=>CalculatorView(projectId: projectId),preventDuplicates: false);
                },
                title: "Concrete Volume Calculator",
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
                              controller: employeeConcreteVolumeCalculatorController.lengthController.value,
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
                              controller: employeeConcreteVolumeCalculatorController.widthController.value,
                              hintText: "0.00",
                            ),



                            SpaceHelperClass.v(16.h(context)),

                            // Duration Field
                            TextHelperClass.headingText(
                              context: context,
                              text: 'Depth(meters)',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: employeeConcreteVolumeCalculatorController.depthController.value,
                              hintText: "0.00",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Calculate Volume",
                              fontSize: 16,
                              textColor: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                              onPressed: () {
                                if(employeeConcreteVolumeCalculatorController.lengthController.value.text == "") {
                                  kSnackBar(message: "Please enter length", bgColor: AppColors.red);
                                } else if(employeeConcreteVolumeCalculatorController.widthController.value.text == "") {
                                  kSnackBar(message: "Please enter width", bgColor: AppColors.red);
                                } else if(employeeConcreteVolumeCalculatorController.depthController.value.text == "") {
                                  kSnackBar(message: "Please enter depth", bgColor: AppColors.red);
                                } else {
                                  employeeConcreteVolumeCalculatorController.isCalculate.value = true;
                                  employeeConcreteVolumeCalculatorController.length.value = double.parse(employeeConcreteVolumeCalculatorController.lengthController.value.text);
                                  employeeConcreteVolumeCalculatorController.width.value = double.parse(employeeConcreteVolumeCalculatorController.widthController.value.text);
                                  employeeConcreteVolumeCalculatorController.depth.value = double.parse(employeeConcreteVolumeCalculatorController.depthController.value.text);
                                  employeeConcreteVolumeCalculatorController.calculatorValue(
                                    length: employeeConcreteVolumeCalculatorController.length.value,
                                    width: employeeConcreteVolumeCalculatorController.width.value,
                                    depth: employeeConcreteVolumeCalculatorController.depth.value,
                                  );
                                }
                              },
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            employeeConcreteVolumeCalculatorController.isCalculate.value == false ?
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
                                          text: "${employeeConcreteVolumeCalculatorController.calculatorValue(
                                            length: employeeConcreteVolumeCalculatorController.length.value,
                                            width: employeeConcreteVolumeCalculatorController.width.value,
                                            depth: employeeConcreteVolumeCalculatorController.depth.value,
                                          ).toStringAsFixed(3)} m³",
                                          fontSize: 20,
                                          textColor: Color.fromRGBO(17, 24, 39, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),


                                    ],
                                  )



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
        )),
      ),
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
