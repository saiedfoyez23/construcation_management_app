import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/drainage_ducting_report/create_view/drainage_ducting_report_first_page_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/drainage_ducting_report/create_view/drainage_ducting_report_third_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DrainageDuctingReportSecondPageView extends StatelessWidget {
  DrainageDuctingReportSecondPageView({super.key,required this.projectId});
  final String projectId;
  final DrainageDuctingReportController drainageDuctingReportController = Get.put(DrainageDuctingReportController());



  @override
  Widget build(BuildContext context) {
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
                              value: drainageDuctingReportController.selectBedTypeAndThickness.value == "" ? null : drainageDuctingReportController.selectBedTypeAndThickness.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                drainageDuctingReportController.selectBedTypeAndThickness.value = value!;
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
                              controller: drainageDuctingReportController.pipeTypeController.value,
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
                              value: drainageDuctingReportController.selectLine.value == "" ? null : drainageDuctingReportController.selectLine.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                drainageDuctingReportController.selectLine.value = value!;
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
                              value: drainageDuctingReportController.selectLevel.value == "" ? null : drainageDuctingReportController.selectLevel.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                drainageDuctingReportController.selectLevel.value = value!;
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
                              value: drainageDuctingReportController.selectPosition.value == "" ? null : drainageDuctingReportController.selectPosition.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                drainageDuctingReportController.selectPosition.value = value!;
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
                              value: drainageDuctingReportController.selectGradient.value == "" ? null : drainageDuctingReportController.selectGradient.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                drainageDuctingReportController.selectGradient.value = value!;
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
                              value: drainageDuctingReportController.selectPopUpDealedOff.value == "" ? null : drainageDuctingReportController.selectPopUpDealedOff.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                drainageDuctingReportController.selectPopUpDealedOff.value = value!;
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
                              value: drainageDuctingReportController.selectTestAirWaterCCTVMandrill.value == "" ? null : drainageDuctingReportController.selectTestAirWaterCCTVMandrill.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                drainageDuctingReportController.selectTestAirWaterCCTVMandrill.value = value!;
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
                              controller: drainageDuctingReportController.testCertificateReferenceController.value,
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
                              text: "Next",
                              fontSize: 16,
                              textColor: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                              onPressed: () async {
                                if(drainageDuctingReportController.selectBedTypeAndThickness.value == "" ||
                                    drainageDuctingReportController.pipeTypeController.value.text == "" ||
                                    drainageDuctingReportController.selectLine.value == "" ||
                                    drainageDuctingReportController.selectLevel.value == "" ||
                                    drainageDuctingReportController.selectPosition.value == "" ||
                                    drainageDuctingReportController.selectGradient.value == "" ||
                                    drainageDuctingReportController.selectPopUpDealedOff.value == "" ||
                                    drainageDuctingReportController.selectTestAirWaterCCTVMandrill.value == "" ||
                                    drainageDuctingReportController.testCertificateReferenceController.value.text == "") {
                                  kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                                } else {
                                  Get.to(()=>DrainageDuctingReportThirdPageView(projectId: projectId));
                                }

                              },
                            ),
                          ),

                          SpaceHelperClass.h(12.w(context)),

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
                                Get.to(()=>DrainageDuctingReportFirstPageView(projectId: projectId));
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
