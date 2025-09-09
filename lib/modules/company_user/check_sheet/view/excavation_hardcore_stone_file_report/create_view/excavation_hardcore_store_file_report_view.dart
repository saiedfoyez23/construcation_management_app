import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/excavation_hardcore_store_file_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/check_sheet_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/widget/post_pour_Inspection_report_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class ExcavationHardcoreStoreFileReportView extends StatelessWidget {
  ExcavationHardcoreStoreFileReportView({super.key,required this.projectId});

  final String projectId;
  final ExcavationHardcoreStoreFileReportController excavationHardcoreStoreFileReportController = Get.put(ExcavationHardcoreStoreFileReportController());


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
                  Get.off(()=>CheckSheetView(projectId: projectId),preventDuplicates: false);
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
                        controller: excavationHardcoreStoreFileReportController.contractController.value,
                        label: "Contract : ",
                        hintText: "Enter contract number",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        readOnly: true,
                        controller: excavationHardcoreStoreFileReportController.dateController.value,
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
                            excavationHardcoreStoreFileReportController.dateController.value.text = picked.toLocal().toString();
                          }
                        },
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: excavationHardcoreStoreFileReportController.drawingReferenceInclRevisionController.value,
                        label: "Drawing Reference Incl Revision : ",
                        hintText: "Enter drawing reference",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: excavationHardcoreStoreFileReportController.revisionController.value,
                        label: "Revision : ",
                        hintText: "Enter revision reference",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: excavationHardcoreStoreFileReportController.locationController.value,
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
                              value: excavationHardcoreStoreFileReportController.selectCompletionStatus.value == "" ? null : excavationHardcoreStoreFileReportController.selectCompletionStatus.value,
                              items: ['in-process','completed','notCompleted'],
                              onChanged: (value) async {
                                excavationHardcoreStoreFileReportController.selectCompletionStatus.value = value!;
                              },
                              hintText: "Select Completion Status",
                            ),


                          ],
                        ),
                      ),



                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: excavationHardcoreStoreFileReportController.subContractorController.value,
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
                              value: excavationHardcoreStoreFileReportController.selectComplianceCheck.value == "" ? null : excavationHardcoreStoreFileReportController.selectComplianceCheck.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                excavationHardcoreStoreFileReportController.selectComplianceCheck.value = value!;
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
                              value: excavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value == "" ? null : excavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                excavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value = value!;
                              },
                              hintText: "Select Underground Services",
                            ),


                          ],
                        ),
                      ),


                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: excavationHardcoreStoreFileReportController.commentController.value,
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
                                controller: excavationHardcoreStoreFileReportController.signedOnCompletionController.value,
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
                                      excavationHardcoreStoreFileReportController.clearSignedOnCompletion();
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
                                      Uint8List? data = await excavationHardcoreStoreFileReportController.signedOnCompletionController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        excavationHardcoreStoreFileReportController.signedOnCompletion.value = File('${directory.path}/signature.png');
                                        await excavationHardcoreStoreFileReportController.signedOnCompletion.value.writeAsBytes(data);
                                        print("Saved at: ${excavationHardcoreStoreFileReportController.signedOnCompletion.value.path}");
                                        final result = await OpenFile.open(excavationHardcoreStoreFileReportController.signedOnCompletion.value.path);
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
                                controller: excavationHardcoreStoreFileReportController.clientApprovedController.value,
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
                                      excavationHardcoreStoreFileReportController.clearClientApproved();
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
                                      Uint8List? data = await excavationHardcoreStoreFileReportController.clientApprovedController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        excavationHardcoreStoreFileReportController.clientApproved.value = File('${directory.path}/client_signature.png');
                                        await excavationHardcoreStoreFileReportController.clientApproved.value.writeAsBytes(data);
                                        print("Saved at: ${excavationHardcoreStoreFileReportController.clientApproved.value.path}");
                                        final result = await OpenFile.open(excavationHardcoreStoreFileReportController.clientApproved.value.path);
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


                      excavationHardcoreStoreFileReportController.isSubmit.value == true ?
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
                          if(excavationHardcoreStoreFileReportController.contractController.value.text == "" ||
                              excavationHardcoreStoreFileReportController.dateController.value.text == "" ||
                              excavationHardcoreStoreFileReportController.drawingReferenceInclRevisionController.value.text == "" ||
                              excavationHardcoreStoreFileReportController.revisionController.value.text == "" ||
                              excavationHardcoreStoreFileReportController.locationController.value.text == "" ||
                              excavationHardcoreStoreFileReportController.selectCompletionStatus.value == "" ||
                              excavationHardcoreStoreFileReportController.subContractorController.value.text == "" ||
                              excavationHardcoreStoreFileReportController.selectComplianceCheck.value == "" ||
                              excavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value == ""
                          ) {
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else if(excavationHardcoreStoreFileReportController.signedOnCompletion.value.path == "") {
                            kSnackBar(message: "Please Upload Signed On Completion", bgColor: AppColors.red);
                          } else if(excavationHardcoreStoreFileReportController.clientApproved.value.path == "") {
                            kSnackBar(message: "Please Upload Client Approved Sign", bgColor: AppColors.red);
                          } else {
                            Map<String,dynamic> payload = {
                              "project": projectId,
                              "contract": excavationHardcoreStoreFileReportController.contractController.value.text,
                              "date": excavationHardcoreStoreFileReportController.dateController.value.text,
                              "drawing_reference_incl_revision":  excavationHardcoreStoreFileReportController.drawingReferenceInclRevisionController.value.text,
                              "revision": excavationHardcoreStoreFileReportController.revisionController.value.text,
                              "location_of_work": excavationHardcoreStoreFileReportController.locationController.value.text,
                              "completion_status": excavationHardcoreStoreFileReportController.selectCompletionStatus.value,
                              "sub_contractor": excavationHardcoreStoreFileReportController.subContractorController.value.text,
                              "compliance_check": excavationHardcoreStoreFileReportController.selectComplianceCheck.value == "Yes" ? true : false,
                              "check_for_underground_services": excavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value == "Yes" ? true : false,
                              "comment": excavationHardcoreStoreFileReportController.commentController.value.text,
                            };
                            print(jsonEncode(payload));
                            excavationHardcoreStoreFileReportController.isSubmit.value = true;
                            await excavationHardcoreStoreFileReportController.createExcavationHardcoreStoreFileReportController(
                              payload: payload,
                              projectId: projectId,
                              clientApprovedSignature: excavationHardcoreStoreFileReportController.clientApproved.value,
                              signedOnCompletionSignature: excavationHardcoreStoreFileReportController.signedOnCompletion.value,
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
