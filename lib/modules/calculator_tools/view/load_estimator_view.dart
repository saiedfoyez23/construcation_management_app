import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/calculator_tools/controller/load_estimator_controller.dart';
import 'package:construction_management_app/modules/calculator_tools/view/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadEstimatorView extends StatelessWidget {
  LoadEstimatorView({super.key,required this.projectId});

  final String projectId;
  final LoadEstimatorController loadEstimatorController = Get.put(LoadEstimatorController());

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
                title: "Load Estimator",
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
                              text: 'Total Volume',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: loadEstimatorController.totalVolumeController.value,
                              hintText: "0.00",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            // Duration Field
                            TextHelperClass.headingText(
                              context: context,
                              text: 'Total Capacity',
                              fontSize: 15,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),
                            SpaceHelperClass.v(8.h(context)),
                            _buildDurationField(
                              context: context,
                              controller: loadEstimatorController.truckCapacityController.value,
                              hintText: "6-8 truck capacity",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Calculate Trucks Required",
                              fontSize: 16,
                              textColor: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                              onPressed: () {
                                if(loadEstimatorController.totalVolumeController.value.text == "") {
                                  kSnackBar(message: "Please enter total volume", bgColor: AppColors.red);
                                } else if(loadEstimatorController.truckCapacityController.value.text == "") {
                                  kSnackBar(message: "Please enter truck capacity", bgColor: AppColors.red);
                                } else {
                                  loadEstimatorController.isCalculate.value = true;
                                  loadEstimatorController.totalVolume.value = double.parse(loadEstimatorController.totalVolumeController.value.text);
                                  loadEstimatorController.truckCapacity.value = double.parse(loadEstimatorController.truckCapacityController.value.text);
                                  loadEstimatorController.calculatorValue(
                                    totalVolume: loadEstimatorController.totalVolume.value,
                                    truckCapacity: loadEstimatorController.truckCapacity.value,
                                  );
                                }
                              },
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            loadEstimatorController.isCalculate.value == false ?
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
                                          text: 'Truck Load Estimate:',
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
                                          text: "${loadEstimatorController.calculatorValue(
                                            totalVolume: loadEstimatorController.totalVolume.value,
                                            truckCapacity: loadEstimatorController.truckCapacity.value,
                                          ).value.ceil()} truck loads",
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
