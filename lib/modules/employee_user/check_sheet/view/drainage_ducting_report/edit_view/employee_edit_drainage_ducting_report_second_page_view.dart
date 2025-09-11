import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_edit_drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/drainage_ducting_report/edit_view/employee_edit_drainage_ducting_report_third_page_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/drainage_ducting_report/edit_view/employee_edit_drainage_ducting_report_first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EmployeeEditDrainageDuctingReportSecondPageView extends StatelessWidget {
  EmployeeEditDrainageDuctingReportSecondPageView({super.key,required this.projectId});
  final String projectId;

  @override
  Widget build(BuildContext context) {
    EmployeeEditDrainageDuctingReportController employeeEditDrainageDuctingReportController = Get.put(EmployeeEditDrainageDuctingReportController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [



              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      TextHelperClass.headingText(
                        context: context,
                        text: "Specification Compliance Check",
                        fontSize: 16,
                        textColor: AppColors.black255,
                        fontWeight: FontWeight.w700,
                      ),


                      SpaceHelperClass.v(24.h(context)),

                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.vpm(context),
                          horizontal: 16.hpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r(context)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Installation Details",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(14.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Bed Type and Thickness",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),


                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeEditDrainageDuctingReportController.selectBedTypeAndThickness.value == "" ? null : employeeEditDrainageDuctingReportController.selectBedTypeAndThickness.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeEditDrainageDuctingReportController.selectBedTypeAndThickness.value = value!;
                              },
                              hintText: "Select Bed Type And Thickness",
                            ),


                            SpaceHelperClass.v(14.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Pipe Type",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),


                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: employeeEditDrainageDuctingReportController.pipeTypeController.value,
                              hintText: "Enter Pipe type",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),


                            SpaceHelperClass.v(14.h(context)),



                          ],
                        ),
                      ),

                      SpaceHelperClass.v(14.h(context)),

                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.vpm(context),
                          horizontal: 16.hpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r(context)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Positioning & Alignment",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(14.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Line",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),


                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeEditDrainageDuctingReportController.selectLine.value == "" ? null : employeeEditDrainageDuctingReportController.selectLine.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeEditDrainageDuctingReportController.selectLine.value = value!;
                              },
                              hintText: "Select line",
                            ),


                            SpaceHelperClass.v(14.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Level",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),


                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeEditDrainageDuctingReportController.selectLevel.value == "" ? null : employeeEditDrainageDuctingReportController.selectLevel.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeEditDrainageDuctingReportController.selectLevel.value = value!;
                              },
                              hintText: "Select level",
                            ),


                            SpaceHelperClass.v(14.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Position",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),


                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeEditDrainageDuctingReportController.selectPosition.value == "" ? null : employeeEditDrainageDuctingReportController.selectPosition.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeEditDrainageDuctingReportController.selectPosition.value = value!;
                              },
                              hintText: "Select position",
                            ),


                            SpaceHelperClass.v(14.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Gradient",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),


                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeEditDrainageDuctingReportController.selectGradient.value == "" ? null : employeeEditDrainageDuctingReportController.selectGradient.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeEditDrainageDuctingReportController.selectGradient.value = value!;
                              },
                              hintText: "Select gradient",
                            ),


                            SpaceHelperClass.v(14.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Pop up dealed off",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),


                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeEditDrainageDuctingReportController.selectPopUpDealedOff.value == "" ? null : employeeEditDrainageDuctingReportController.selectPopUpDealedOff.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeEditDrainageDuctingReportController.selectPopUpDealedOff.value = value!;
                              },
                              hintText: "Select gradient",
                            ),


                            SpaceHelperClass.v(14.h(context)),



                          ],
                        ),
                      ),

                      SpaceHelperClass.v(14.h(context)),

                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.vpm(context),
                          horizontal: 16.hpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r(context)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Testing & Certification",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(14.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Test(Air/Water/CCTV/Mandrill)",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),


                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeEditDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value == "" ? null : employeeEditDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeEditDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value = value!;
                              },
                              hintText: "Test(Air/Water/CCTV/Mandrill)",
                            ),


                            SpaceHelperClass.v(14.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Test Certificate Reference:",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),


                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: employeeEditDrainageDuctingReportController.testCertificateReferenceController.value,
                              hintText: "Enter Test Certificate Reference",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),


                            SpaceHelperClass.v(14.h(context)),



                          ],
                        ),
                      ),


                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Previous",
                              fontSize: 16,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(234, 235, 235, 1),
                              borderWidth: 1,
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              onPressed: () {
                                Get.to(()=>EmployeeEditDrainageDuctingReportFirstPageView(projectId: projectId));
                              },
                            ),
                          ),


                          SpaceHelperClass.h(12.w(context)),


                          Expanded(
                            child: CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Next",
                              fontSize: 16,
                              textColor: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                              onPressed: () async {
                                if(employeeEditDrainageDuctingReportController.selectBedTypeAndThickness.value == "" ||
                                    employeeEditDrainageDuctingReportController.pipeTypeController.value.text == "" ||
                                    employeeEditDrainageDuctingReportController.selectLine.value == "" ||
                                    employeeEditDrainageDuctingReportController.selectLevel.value == "" ||
                                    employeeEditDrainageDuctingReportController.selectPosition.value == "" ||
                                    employeeEditDrainageDuctingReportController.selectGradient.value == "" ||
                                    employeeEditDrainageDuctingReportController.selectPopUpDealedOff.value == "" ||
                                    employeeEditDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value == "" ||
                                    employeeEditDrainageDuctingReportController.testCertificateReferenceController.value.text == "") {
                                  kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                                } else {
                                  Get.to(()=>EmployeeEditDrainageDuctingReportThirdPageView(projectId: projectId));
                                }

                              },
                            ),
                          ),





                        ],
                      ),


                      SpaceHelperClass.v(35.h(context)),



                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
