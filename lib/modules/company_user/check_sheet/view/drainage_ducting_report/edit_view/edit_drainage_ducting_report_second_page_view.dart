import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/edit_drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/drainage_ducting_report/edit_view/edit_drainage_ducting_report_first_page_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/drainage_ducting_report/edit_view/edit_drainage_ducting_report_third_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditDrainageDuctingReportSecondPageView extends StatelessWidget {
  EditDrainageDuctingReportSecondPageView({super.key,required this.projectId});
  final String projectId;

  @override
  Widget build(BuildContext context) {
    EditDrainageDuctingReportController editDrainageDuctingReportController = Get.put(EditDrainageDuctingReportController(projectId: projectId));
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
                              value: editDrainageDuctingReportController.selectBedTypeAndThickness.value == "" ? null : editDrainageDuctingReportController.selectBedTypeAndThickness.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectBedTypeAndThickness.value = value!;
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
                              controller: editDrainageDuctingReportController.pipeTypeController.value,
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
                              value: editDrainageDuctingReportController.selectLine.value == "" ? null : editDrainageDuctingReportController.selectLine.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectLine.value = value!;
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
                              value: editDrainageDuctingReportController.selectLevel.value == "" ? null : editDrainageDuctingReportController.selectLevel.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectLevel.value = value!;
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
                              value: editDrainageDuctingReportController.selectPosition.value == "" ? null : editDrainageDuctingReportController.selectPosition.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectPosition.value = value!;
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
                              value: editDrainageDuctingReportController.selectGradient.value == "" ? null : editDrainageDuctingReportController.selectGradient.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectGradient.value = value!;
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
                              value: editDrainageDuctingReportController.selectPopUpDealedOff.value == "" ? null : editDrainageDuctingReportController.selectPopUpDealedOff.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectPopUpDealedOff.value = value!;
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
                              value: editDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value == "" ? null : editDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value = value!;
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
                              controller: editDrainageDuctingReportController.testCertificateReferenceController.value,
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
                                Get.to(()=>EditDrainageDuctingReportFirstPageView(projectId: projectId));
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
                                if(editDrainageDuctingReportController.selectBedTypeAndThickness.value == "" ||
                                    editDrainageDuctingReportController.pipeTypeController.value.text == "" ||
                                    editDrainageDuctingReportController.selectLine.value == "" ||
                                    editDrainageDuctingReportController.selectLevel.value == "" ||
                                    editDrainageDuctingReportController.selectPosition.value == "" ||
                                    editDrainageDuctingReportController.selectGradient.value == "" ||
                                    editDrainageDuctingReportController.selectPopUpDealedOff.value == "" ||
                                    editDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value == "" ||
                                    editDrainageDuctingReportController.testCertificateReferenceController.value.text == "") {
                                  kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                                } else {
                                  Get.to(()=>EditDrainageDuctingReportThirdPageView(projectId: projectId));
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
