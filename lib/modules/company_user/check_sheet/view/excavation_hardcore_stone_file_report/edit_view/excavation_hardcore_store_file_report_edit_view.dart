import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/modules/company_user/check_sheet/controller/edit_excavation_hardcore_store_file_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/excavation_hardcore_stone_file_report/get_view/excavation_hardcore_store_file_report_get_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/widget/post_pour_Inspection_report_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import '../../../../../../common/common.dart';

class ExcavationHardcoreStoreFileReportEditView extends StatelessWidget {
  const ExcavationHardcoreStoreFileReportEditView({super.key,required this.projectId});

  final String projectId;
  @override
  Widget build(BuildContext context) {
    EditExcavationHardcoreStoreFileReportController editExcavationHardcoreStoreFileReportController = Get.put(EditExcavationHardcoreStoreFileReportController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: editExcavationHardcoreStoreFileReportController.isLoading.value == true  ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :
          CustomScrollView(
            slivers: [

              CustomAppBarHelper.normalAppBar(
                context: context,
                height: 80,
                onBackPressed: () {
                  Get.off(()=>ExcavationHardcoreStoreFileReportGetView(projectId: projectId),preventDuplicates: false);
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
                        controller: editExcavationHardcoreStoreFileReportController.contractController.value,
                        label: "Contract : ",
                        hintText: "Enter contract number",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        readOnly: true,
                        controller: editExcavationHardcoreStoreFileReportController.dateController.value,
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
                            editExcavationHardcoreStoreFileReportController.dateController.value.text = picked.toLocal().toString();
                          }
                        },
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: editExcavationHardcoreStoreFileReportController.drawingReferenceInclRevisionController.value,
                        label: "Drawing Reference Incl Revision : ",
                        hintText: "Enter drawing reference",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: editExcavationHardcoreStoreFileReportController.revisionController.value,
                        label: "Revision : ",
                        hintText: "Enter revision reference",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: editExcavationHardcoreStoreFileReportController.locationController.value,
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
                              value: editExcavationHardcoreStoreFileReportController.selectCompletionStatus.value == "" ? null : editExcavationHardcoreStoreFileReportController.selectCompletionStatus.value,
                              items: ['in-progress','completed','not-completed'],
                              onChanged: (value) async {
                                editExcavationHardcoreStoreFileReportController.selectCompletionStatus.value = value!;
                              },
                              hintText: "Select Completion Status",
                            ),


                          ],
                        ),
                      ),



                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: editExcavationHardcoreStoreFileReportController.subContractorController.value,
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
                              value: editExcavationHardcoreStoreFileReportController.selectComplianceCheck.value == "" ? null : editExcavationHardcoreStoreFileReportController.selectComplianceCheck.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editExcavationHardcoreStoreFileReportController.selectComplianceCheck.value = value!;
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
                              value: editExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value == "" ? null : editExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value = value!;
                              },
                              hintText: "Select Underground Services",
                            ),


                          ],
                        ),
                      ),


                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: editExcavationHardcoreStoreFileReportController.commentController.value,
                        label: "Write Comment : ",
                        hintText: "Add additional comments...",
                      ),

                      SpaceHelperClass.v(14.h(context)),


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


                            editExcavationHardcoreStoreFileReportController.signedOnCompletion.value.path == "" ?
                            SizedBox.shrink() :
                            ImageHelperClass.customFileImageContainer(
                              context: context,
                              imageFit: BoxFit.contain,
                              fit: BoxFit.contain,
                              height: 150.h(context),
                              width: 375.w(context),
                              imagePath: editExcavationHardcoreStoreFileReportController.signedOnCompletion.value,
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
                                controller: editExcavationHardcoreStoreFileReportController.signedOnCompletionController.value,
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
                                      editExcavationHardcoreStoreFileReportController.clearSignedOnCompletion();
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
                                      Uint8List? data = await editExcavationHardcoreStoreFileReportController.signedOnCompletionController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        editExcavationHardcoreStoreFileReportController.signedOnCompletion.value = File('${directory.path}/signature.png');
                                        await editExcavationHardcoreStoreFileReportController.signedOnCompletion.value.writeAsBytes(data);
                                        print("Saved at: ${editExcavationHardcoreStoreFileReportController.signedOnCompletion.value.path}");
                                        final result = await OpenFile.open(editExcavationHardcoreStoreFileReportController.signedOnCompletion.value.path);
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



                      SpaceHelperClass.v(14.h(context)),


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

                            editExcavationHardcoreStoreFileReportController.clientApproved.value.path == "" ?
                            SizedBox.shrink() :
                            ImageHelperClass.customFileImageContainer(
                              context: context,
                              imageFit: BoxFit.contain,
                              fit: BoxFit.contain,
                              height: 150.h(context),
                              width: 375.w(context),
                              imagePath: editExcavationHardcoreStoreFileReportController.clientApproved.value,
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
                                controller: editExcavationHardcoreStoreFileReportController.clientApprovedController.value,
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
                                      editExcavationHardcoreStoreFileReportController.clearClientApproved();
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
                                      Uint8List? data = await editExcavationHardcoreStoreFileReportController.clientApprovedController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        editExcavationHardcoreStoreFileReportController.clientApproved.value = File('${directory.path}/client_signature.png');
                                        await editExcavationHardcoreStoreFileReportController.clientApproved.value.writeAsBytes(data);
                                        print("Saved at: ${editExcavationHardcoreStoreFileReportController.clientApproved.value.path}");
                                        final result = await OpenFile.open(editExcavationHardcoreStoreFileReportController.clientApproved.value.path);
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


                      editExcavationHardcoreStoreFileReportController.isSubmit.value == true ?
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
                          if(editExcavationHardcoreStoreFileReportController.contractController.value.text == "" ||
                              editExcavationHardcoreStoreFileReportController.dateController.value.text == "" ||
                              editExcavationHardcoreStoreFileReportController.drawingReferenceInclRevisionController.value.text == "" ||
                              editExcavationHardcoreStoreFileReportController.revisionController.value.text == "" ||
                              editExcavationHardcoreStoreFileReportController.locationController.value.text == "" ||
                              editExcavationHardcoreStoreFileReportController.selectCompletionStatus.value == "" ||
                              editExcavationHardcoreStoreFileReportController.subContractorController.value.text == "" ||
                              editExcavationHardcoreStoreFileReportController.selectComplianceCheck.value == "" ||
                              editExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value == ""
                          ) {
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else if(editExcavationHardcoreStoreFileReportController.signedOnCompletion.value.path == "") {
                            kSnackBar(message: "Please Upload Signed On Completion", bgColor: AppColors.red);
                          } else if(editExcavationHardcoreStoreFileReportController.clientApproved.value.path == "") {
                            kSnackBar(message: "Please Upload Client Approved Sign", bgColor: AppColors.red);
                          } else {
                            Map<String,dynamic> payload = {
                              "project": projectId,
                              "contract": editExcavationHardcoreStoreFileReportController.contractController.value.text,
                              "date": editExcavationHardcoreStoreFileReportController.dateController.value.text,
                              "drawing_reference_incl_revision": editExcavationHardcoreStoreFileReportController.drawingReferenceInclRevisionController.value.text,
                              "revision": editExcavationHardcoreStoreFileReportController.revisionController.value.text,
                              "location_of_work": editExcavationHardcoreStoreFileReportController.locationController.value.text,
                              "completion_status": editExcavationHardcoreStoreFileReportController.selectCompletionStatus.value,
                              "sub_contractor": editExcavationHardcoreStoreFileReportController.subContractorController.value.text,
                              "compliance_check": editExcavationHardcoreStoreFileReportController.selectComplianceCheck.value == "Yes" ? true : false,
                              "check_for_underground_services": editExcavationHardcoreStoreFileReportController.selectCheckForUndergroundService.value == "Yes" ? true : false,
                              "comment": editExcavationHardcoreStoreFileReportController.commentController.value.text,
                            };
                            print(jsonEncode(payload));
                            editExcavationHardcoreStoreFileReportController.isSubmit.value = true;
                            await editExcavationHardcoreStoreFileReportController.createExcavationHardcoreStoreFileReportController(
                              payload: payload,
                              projectId: projectId,
                              clientApprovedSignature: editExcavationHardcoreStoreFileReportController.clientApproved.value,
                              signedOnCompletionSignature: editExcavationHardcoreStoreFileReportController.signedOnCompletion.value,
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
