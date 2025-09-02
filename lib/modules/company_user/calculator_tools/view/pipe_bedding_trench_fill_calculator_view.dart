import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/controller/pipe_bedding_trench_fill_calculator_controller.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/view/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PipeBeddingTrenchFillCalculatorView extends StatelessWidget {
  PipeBeddingTrenchFillCalculatorView({super.key,required this.projectId});

  final String projectId;
  final PipeBeddingTrenchFillCalculatorController pipeBeddingTrenchFillCalculatorController = Get.put(PipeBeddingTrenchFillCalculatorController());


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
                height: 70,
                context: context,
                onBackPressed: () {
                  Get.off(()=>CalculatorView(projectId: projectId),preventDuplicates: false);
                },
                title: "Pipe Bedding / Trench Fill Calculator",
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
                              text: 'Trench Length(meters)',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: pipeBeddingTrenchFillCalculatorController.trenchLengthController.value,
                              hintText: "0.00",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            // Duration Field
                            TextHelperClass.headingText(
                              context: context,
                              text: 'Trench Width(meters)',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: pipeBeddingTrenchFillCalculatorController.trenchWidthController.value,
                              hintText: "0.00",
                            ),



                            SpaceHelperClass.v(16.h(context)),

                            // Duration Field
                            TextHelperClass.headingText(
                              context: context,
                              text: 'Trench Depth(meters)',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: pipeBeddingTrenchFillCalculatorController.trenchDepthController.value,
                              hintText: "0.00",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            // Duration Field
                            TextHelperClass.headingText(
                              context: context,
                              text: 'Pipe Diameter (if applicable)',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: pipeBeddingTrenchFillCalculatorController.pipeDiameterController.value,
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
                                      if(pipeBeddingTrenchFillCalculatorController.trenchLengthController.value.text == "") {
                                        kSnackBar(message: "Please enter length", bgColor: AppColors.red);
                                      } else if(pipeBeddingTrenchFillCalculatorController.trenchWidthController.value.text == "") {
                                        kSnackBar(message: "Please enter width", bgColor: AppColors.red);
                                      } else if(pipeBeddingTrenchFillCalculatorController.trenchDepthController.value.text == "") {
                                        kSnackBar(message: "Please enter depth", bgColor: AppColors.red);
                                      } else {
                                        pipeBeddingTrenchFillCalculatorController.isCalculate.value = true;
                                        pipeBeddingTrenchFillCalculatorController.trenchLengthWeight.value = 0.0;
                                        pipeBeddingTrenchFillCalculatorController.trenchWidthWeight.value = 0.0;
                                        pipeBeddingTrenchFillCalculatorController.trenchDepthWeight.value = 0.0;
                                        pipeBeddingTrenchFillCalculatorController.trenchLength.value = double.parse(pipeBeddingTrenchFillCalculatorController.trenchLengthController.value.text);
                                        pipeBeddingTrenchFillCalculatorController.trenchWidth.value = double.parse(pipeBeddingTrenchFillCalculatorController.trenchWidthController.value.text);
                                        pipeBeddingTrenchFillCalculatorController.trenchDepth.value = double.parse(pipeBeddingTrenchFillCalculatorController.trenchDepthController.value.text);
                                        pipeBeddingTrenchFillCalculatorController.calculatorValue(
                                          trenchLength: pipeBeddingTrenchFillCalculatorController.trenchLength.value,
                                          trenchWidth: pipeBeddingTrenchFillCalculatorController.trenchWidth.value,
                                          trenchDepth: pipeBeddingTrenchFillCalculatorController.trenchDepth.value,
                                        );
                                      }
                                    },
                                  ),
                                ),

                                SpaceHelperClass.h(8.w(context)),


                                Expanded(
                                  child: CustomButtonHelper.customRoundedButton(
                                    context: context,
                                    text: "Tonnage",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w600,
                                    borderRadius: 8,
                                    backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                    onPressed: () {
                                      if(pipeBeddingTrenchFillCalculatorController.trenchLengthController.value.text == "") {
                                        kSnackBar(message: "Please enter length", bgColor: AppColors.red);
                                      } else if(pipeBeddingTrenchFillCalculatorController.trenchWidthController.value.text == "") {
                                        kSnackBar(message: "Please enter width", bgColor: AppColors.red);
                                      } else if(pipeBeddingTrenchFillCalculatorController.trenchDepthController.value.text == "") {
                                        kSnackBar(message: "Please enter depth", bgColor: AppColors.red);
                                      } else {
                                        pipeBeddingTrenchFillCalculatorController.isCalculate.value = true;
                                        pipeBeddingTrenchFillCalculatorController.trenchLengthWeight.value = double.parse(pipeBeddingTrenchFillCalculatorController.trenchLengthController.value.text);
                                        pipeBeddingTrenchFillCalculatorController.trenchWidthWeight.value = double.parse(pipeBeddingTrenchFillCalculatorController.trenchWidthController.value.text);
                                        pipeBeddingTrenchFillCalculatorController.trenchDepthWeight.value = double.parse(pipeBeddingTrenchFillCalculatorController.trenchDepthController.value.text);
                                        pipeBeddingTrenchFillCalculatorController.calculatorWeight(
                                          trenchLength: pipeBeddingTrenchFillCalculatorController.trenchLengthWeight.value,
                                          trenchWidth:  pipeBeddingTrenchFillCalculatorController.trenchWidthWeight.value,
                                          trenchDepth: pipeBeddingTrenchFillCalculatorController.trenchDepthWeight.value,
                                          pipeDiameter: pipeBeddingTrenchFillCalculatorController.pipeDiameterController.value.text == "" ? 0.0 : double.parse(pipeBeddingTrenchFillCalculatorController.pipeDiameterController.value.text),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            pipeBeddingTrenchFillCalculatorController.isCalculate.value == false ?
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
                                          text: 'Trench Volume:',
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
                                          text: "${pipeBeddingTrenchFillCalculatorController.calculatorValue(
                                            trenchLength: pipeBeddingTrenchFillCalculatorController.trenchLength.value,
                                            trenchWidth: pipeBeddingTrenchFillCalculatorController.trenchWidth.value,
                                            trenchDepth: pipeBeddingTrenchFillCalculatorController.trenchDepth.value,
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
                                          text: 'Tonnage:',
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
                                          text: "${pipeBeddingTrenchFillCalculatorController.calculatorWeight(
                                            trenchLength: pipeBeddingTrenchFillCalculatorController.trenchLengthWeight.value,
                                            trenchWidth: pipeBeddingTrenchFillCalculatorController.trenchWidthWeight.value,
                                            trenchDepth: pipeBeddingTrenchFillCalculatorController.trenchDepthWeight.value,
                                            pipeDiameter: pipeBeddingTrenchFillCalculatorController.pipeDiameterController.value.text == "" ? 0.0 : double.parse(pipeBeddingTrenchFillCalculatorController.pipeDiameterController.value.text),
                                          ).value.round()} tonnes",
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
