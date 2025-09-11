import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/widget/post_pour_Inspection_report_widget.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_excavation_hardcore_store_file_report_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/employee_check_sheet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class EmployeeExcavationHardcoreStoreFileReportView extends StatelessWidget {
  EmployeeExcavationHardcoreStoreFileReportView({super.key,required this.projectId});

  final String projectId;
  final EmployeeExcavationHardcoreStoreFileReportController employeeExcavationHardcoreStoreFileReportController = Get.put(EmployeeExcavationHardcoreStoreFileReportController());


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
                height: 80,
                onBackPressed: () {
                  Get.off(()=>EmployeeCheckSheetView(projectId: projectId),preventDuplicates: false);
                },
                title: "Excavation / Hardcore / Stone Fill Report",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [



                      SpaceHelperClass.v(24.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeExcavationHardcoreStoreFileReportController.contractController.value,
                        label: "Contract : ",
                        hintText: "Enter contract number",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        readOnly: true,
                        controller: employeeExcavationHardcoreStoreFileReportController.dateController.value,
                        label: "Date : ",
                        hintText: "Enter date",
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.vpm(context),
                            horizontal: 16.hpm(context),
                          ),
                          child: ImageHelperClass.customImageContainer(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imagePath: AppImages.addSiteDiary,
                            imageFit: BoxFit.contain,
                            fit: BoxFit.contain,
                          ),
                        ),
                        onTap: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null) {
                            employeeExcavationHardcoreStoreFileReportController.dateController.value.text = picked.toLocal().toString();
                          }
                        },
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeExcavationHardcoreStoreFileReportController.drawingReferenceInclRevisionController.value,
                        label: "Drawing Reference Incl Revision : ",
                        hintText: "Enter drawing reference",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeExcavationHardcoreStoreFileReportController.revisionController.value,
                        label: "Revision : ",
                        hintText: "Enter revision reference",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeExcavationHardcoreStoreFileReportController.locationController.value,
                        label: "Location of work : ",
                        hintText: "Enter work  location",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.hpm(context),
                          vertical: 12.vpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r(context)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(4, 6, 15, 0.05),
                              blurRadius: 60,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [

                            TextHelperClass.headingText(
                              context: context,
                              text: "Completion Status : ",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeExcavationHardcoreStoreFileReportController.selectCompletionStatus.value == "" ? null : employeeExcavationHardcoreStoreFileReportController.selectCompletionStatus.value,
                              items: ['in-progress','completed','not-completed'],
                              onChanged: (value) async {
                                employeeExcavationHardcoreStoreFileReportController.selectCompletionStatus.value = value!;
                              },
                              hintText: "Select Completion Status",
                            ),


                          ],
                        ),
                      ),



                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeExcavationHardcoreStoreFileReportController.subContractorController.value,
                        label: "Sub-Contractor : ",
                        hintText: "Enter sub-contractor",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.hpm(context),
                          vertical: 12.vpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r(context)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(4, 6, 15, 0.05),
                              blurRadius: 60,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [

                            TextHelperClass.headingText(
                              context: context,
                              text: "Compliance Check : ",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeExcavationHardcoreStoreFileReportController.selectComplianceCheck.value == "" ? null : employeeExcavationHardcoreStoreFileReportController.selectComplianceCheck.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeExcavationHardcoreStoreFileReportController.selectComplianceCheck.value = value!;
                              },
                              hintText: "Select Compliance Check",
                            ),


                          ],
                        ),
                      ),



                      SpaceHelperClass.v(12.h(context)),


                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.hpm(context),
                          vertical: 12.vpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r(context)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(4, 6, 15, 0.05),
                              blurRadius: 60,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [

                            TextHelperClass.headingText(
                              context: context,
                              text: "Check for Underground Services : ",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: employeeExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value == "" ? null : employeeExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value = value!;
                              },
                              hintText: "Select Underground Services",
                            ),


                          ],
                        ),
                      ),


                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeExcavationHardcoreStoreFileReportController.commentController.value,
                        label: "Write Comment : ",
                        hintText: "Add additional comments...",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r(context)),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 12.hpm(context)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            TextHelperClass.headingText(
                              context: context,
                              text: "Signed on Completion : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),


                            SpaceHelperClass.v(14.h(context)),

                            // Signature area with color options
                            Container(
                              height: 150.h(context),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(247, 247, 247, 1),
                                borderRadius: BorderRadius.circular(8.r(context)),
                              ),
                              child: Signature(
                                controller: employeeExcavationHardcoreStoreFileReportController.signedOnCompletionController.value,
                                backgroundColor: Color.fromRGBO(247, 247, 247, 1),
                              ),
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                                Expanded(
                                  child: CustomButtonHelper.customRoundedButton(
                                    context: context,
                                    text: "Clear",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w600,
                                    borderRadius: 8,
                                    backgroundColor: Color.fromRGBO(234, 235, 235, 1),
                                    borderWidth: 1,
                                    borderColor: Color.fromRGBO(229, 231, 235, 1),
                                    onPressed: () {
                                      employeeExcavationHardcoreStoreFileReportController.clearSignedOnCompletion();
                                    },
                                  ),
                                ),



                                SpaceHelperClass.h(6.w(context)),


                                Expanded(
                                  child: CustomButtonHelper.customRoundedButton(
                                    context: context,
                                    text: "Submit Signature",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w600,
                                    borderRadius: 8,
                                    backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                    onPressed: () async {
                                      Uint8List? data = await employeeExcavationHardcoreStoreFileReportController.signedOnCompletionController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        employeeExcavationHardcoreStoreFileReportController.signedOnCompletion.value = File('${directory.path}/signature.png');
                                        await employeeExcavationHardcoreStoreFileReportController.signedOnCompletion.value.writeAsBytes(data);
                                        print("Saved at: ${employeeExcavationHardcoreStoreFileReportController.signedOnCompletion.value.path}");
                                        final result = await OpenFile.open(employeeExcavationHardcoreStoreFileReportController.signedOnCompletion.value.path);
                                        if (result.type != ResultType.done) {
                                          print('Failed to open file: ${result.message}');
                                        } else {
                                          print('File opened successfully');
                                        }
                                      }
                                    },
                                  ),
                                ),

                                SpaceHelperClass.h(12.w(context)),





                              ],
                            ),
                          ],
                        ),
                      ),



                      SpaceHelperClass.v(12.h(context)),


                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r(context)),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 12.hpm(context)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            TextHelperClass.headingText(
                              context: context,
                              text: "Client Approved : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),


                            SpaceHelperClass.v(14.h(context)),

                            // Signature area with color options
                            Container(
                              height: 150.h(context),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(247, 247, 247, 1),
                                borderRadius: BorderRadius.circular(8.r(context)),
                              ),
                              child: Signature(
                                controller: employeeExcavationHardcoreStoreFileReportController.clientApprovedController.value,
                                backgroundColor: Color.fromRGBO(247, 247, 247, 1),
                              ),
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                                Expanded(
                                  child: CustomButtonHelper.customRoundedButton(
                                    context: context,
                                    text: "Clear",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w600,
                                    borderRadius: 8,
                                    backgroundColor: Color.fromRGBO(234, 235, 235, 1),
                                    borderWidth: 1,
                                    borderColor: Color.fromRGBO(229, 231, 235, 1),
                                    onPressed: () {
                                      employeeExcavationHardcoreStoreFileReportController.clearClientApproved();
                                    },
                                  ),
                                ),



                                SpaceHelperClass.h(6.w(context)),


                                Expanded(
                                  child: CustomButtonHelper.customRoundedButton(
                                    context: context,
                                    text: "Submit Signature",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w600,
                                    borderRadius: 8,
                                    backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                    onPressed: () async {
                                      Uint8List? data = await employeeExcavationHardcoreStoreFileReportController.clientApprovedController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        employeeExcavationHardcoreStoreFileReportController.clientApproved.value = File('${directory.path}/client_signature.png');
                                        await employeeExcavationHardcoreStoreFileReportController.clientApproved.value.writeAsBytes(data);
                                        print("Saved at: ${employeeExcavationHardcoreStoreFileReportController.clientApproved.value.path}");
                                        final result = await OpenFile.open(employeeExcavationHardcoreStoreFileReportController.clientApproved.value.path);
                                        if (result.type != ResultType.done) {
                                          print('Failed to open file: ${result.message}');
                                        } else {
                                          print('File opened successfully');
                                        }
                                      }
                                    },
                                  ),
                                ),

                                SpaceHelperClass.h(12.w(context)),

                              ],
                            ),
                          ],
                        ),
                      ),


                      SpaceHelperClass.v(35.h(context)),


                      employeeExcavationHardcoreStoreFileReportController.isSubmit.value == true ?
                      CustomLoaderButton().customLoaderButton(
                        backgroundColor: Colors.transparent,
                        loaderColor: Color.fromRGBO(38, 50, 56, 1),
                        height: 50,
                        context: context,
                      ) :
                      CustomButtonHelper.customRoundedButton(
                        context: context,
                        text: "Save",
                        fontSize: 16,
                        textColor: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w600,
                        borderRadius: 8,
                        backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                        onPressed: () async {
                          if(employeeExcavationHardcoreStoreFileReportController.contractController.value.text == "" ||
                              employeeExcavationHardcoreStoreFileReportController.dateController.value.text == "" ||
                              employeeExcavationHardcoreStoreFileReportController.drawingReferenceInclRevisionController.value.text == "" ||
                              employeeExcavationHardcoreStoreFileReportController.revisionController.value.text == "" ||
                              employeeExcavationHardcoreStoreFileReportController.locationController.value.text == "" ||
                              employeeExcavationHardcoreStoreFileReportController.selectCompletionStatus.value == "" ||
                              employeeExcavationHardcoreStoreFileReportController.subContractorController.value.text == "" ||
                              employeeExcavationHardcoreStoreFileReportController.selectComplianceCheck.value == "" ||
                              employeeExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value == ""
                          ) {
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else if(employeeExcavationHardcoreStoreFileReportController.signedOnCompletion.value.path == "") {
                            kSnackBar(message: "Please Upload Signed On Completion", bgColor: AppColors.red);
                          } else if(employeeExcavationHardcoreStoreFileReportController.clientApproved.value.path == "") {
                            kSnackBar(message: "Please Upload Client Approved Sign", bgColor: AppColors.red);
                          } else {
                            Map<String,dynamic> payload = {
                              "project": projectId,
                              "contract": employeeExcavationHardcoreStoreFileReportController.contractController.value.text,
                              "date": employeeExcavationHardcoreStoreFileReportController.dateController.value.text,
                              "drawing_reference_incl_revision": employeeExcavationHardcoreStoreFileReportController.drawingReferenceInclRevisionController.value.text,
                              "revision": employeeExcavationHardcoreStoreFileReportController.revisionController.value.text,
                              "location_of_work": employeeExcavationHardcoreStoreFileReportController.locationController.value.text,
                              "completion_status": employeeExcavationHardcoreStoreFileReportController.selectCompletionStatus.value,
                              "sub_contractor": employeeExcavationHardcoreStoreFileReportController.subContractorController.value.text,
                              "compliance_check": employeeExcavationHardcoreStoreFileReportController.selectComplianceCheck.value == "Yes" ? true : false,
                              "check_for_underground_services": employeeExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value == "Yes" ? true : false,
                              "comment": employeeExcavationHardcoreStoreFileReportController.commentController.value.text,
                            };
                            print(jsonEncode(payload));
                            employeeExcavationHardcoreStoreFileReportController.isSubmit.value = true;
                            await employeeExcavationHardcoreStoreFileReportController.createEmployeeExcavationHardcoreStoreFileReportController(
                              payload: payload,
                              projectId: projectId,
                              clientApprovedSignature: employeeExcavationHardcoreStoreFileReportController.clientApproved.value,
                              signedOnCompletionSignature: employeeExcavationHardcoreStoreFileReportController.signedOnCompletion.value,
                            );  // excavationHardcoreStoreFileReportController.isSubmit.value = true;
                          }

                        },
                      ),


                      SpaceHelperClass.v(35.h(context)),







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
}
