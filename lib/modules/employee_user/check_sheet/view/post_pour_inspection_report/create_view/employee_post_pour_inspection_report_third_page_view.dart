import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/post_pour_inspection_report/create_view/employee_post_pour_inspection_report_second_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class EmployeePostPourInspectionReportThirdPageView extends StatelessWidget {
  EmployeePostPourInspectionReportThirdPageView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    EmployeePostPourInspectionReportController employeePostPourInspectionReportController = Get.put(EmployeePostPourInspectionReportController(projectId: projectId));
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


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

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
                              text: "Cast in items",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(14.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Drainage Elements",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Inspection",
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
                              value: employeePostPourInspectionReportController.selectDrainageElementsInspection.value == "" ?
                              null : employeePostPourInspectionReportController.selectDrainageElementsInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeePostPourInspectionReportController.selectDrainageElementsInspection.value = value!;
                                } else {
                                  employeePostPourInspectionReportController.selectDrainageElementsInspection.value = value!;
                                }
                              },
                              hintText: "Select Inspection",
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Comment : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: employeePostPourInspectionReportController.commentDrainageElementsController.value,
                              hintText: "Enter comment",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),



                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Holding Down Bolts",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Inspection",
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
                              value: employeePostPourInspectionReportController.selectHoldingDownBoltsInspection.value == "" ?
                              null : employeePostPourInspectionReportController.selectHoldingDownBoltsInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeePostPourInspectionReportController.selectHoldingDownBoltsInspection.value = value!;
                                } else {
                                  employeePostPourInspectionReportController.selectHoldingDownBoltsInspection.value = value!;
                                }
                              },
                              hintText: "Select Inspection",
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Comment : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: employeePostPourInspectionReportController.commentHoldingDownBoltsController.value,
                              hintText: "Enter comment",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),



                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Crack Inducers",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Inspection",
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
                              value: employeePostPourInspectionReportController.selectCrackInducersInspection.value == "" ?
                              null : employeePostPourInspectionReportController.selectCrackInducersInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeePostPourInspectionReportController.selectCrackInducersInspection.value = value!;
                                } else {
                                  employeePostPourInspectionReportController.selectCrackInducersInspection.value = value!;
                                }
                              },
                              hintText: "Select Inspection",
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Comment : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: employeePostPourInspectionReportController.commentCrackInducersController.value,
                              hintText: "Enter comment",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),



                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Waterproofling membrane",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Inspection",
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
                              value: employeePostPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "" ?
                              null : employeePostPourInspectionReportController.selectWaterprooflingMembraneInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeePostPourInspectionReportController.selectWaterprooflingMembraneInspection.value = value!;
                                } else {
                                  employeePostPourInspectionReportController.selectWaterprooflingMembraneInspection.value = value!;
                                }
                              },
                              hintText: "Select Inspection",
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Comment : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: employeePostPourInspectionReportController.commentWaterprooflingMembraneController.value,
                              hintText: "Enter comment",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),




                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Others",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Inspection",
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
                              value: employeePostPourInspectionReportController.selectOthersInspection.value == "" ?
                              null : employeePostPourInspectionReportController.selectOthersInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeePostPourInspectionReportController.selectOthersInspection.value = value!;
                                } else {
                                  employeePostPourInspectionReportController.selectOthersInspection.value = value!;
                                }
                              },
                              hintText: "Select Inspection",
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Comment : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: employeePostPourInspectionReportController.commentOthersController.value,
                              hintText: "Enter comment",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
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
                                controller: employeePostPourInspectionReportController.signedOnCompletionController.value,
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
                                      employeePostPourInspectionReportController.clearSignedOnCompletion();
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
                                      Uint8List? data = await employeePostPourInspectionReportController.signedOnCompletionController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        employeePostPourInspectionReportController.signedOnCompletion.value = File('${directory.path}/signature.png');
                                        await employeePostPourInspectionReportController.signedOnCompletion.value.writeAsBytes(data);
                                        print("Saved at: ${employeePostPourInspectionReportController.signedOnCompletion.value.path}");
                                        final result = await OpenFile.open(employeePostPourInspectionReportController.signedOnCompletion.value.path);
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

                            // Signature area with color options
                            Container(
                              height: 150.h(context),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(247, 247, 247, 1),
                                borderRadius: BorderRadius.circular(8.r(context)),
                              ),
                              child: Signature(
                                controller: employeePostPourInspectionReportController.clientApprovedController.value,
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
                                      employeePostPourInspectionReportController.clearClientApproved();
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
                                      Uint8List? data = await employeePostPourInspectionReportController.clientApprovedController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        employeePostPourInspectionReportController.clientApproved.value = File('${directory.path}/client_signature.png');
                                        await employeePostPourInspectionReportController.clientApproved.value.writeAsBytes(data);
                                        print("Saved at: ${employeePostPourInspectionReportController.clientApproved.value.path}");
                                        final result = await OpenFile.open(employeePostPourInspectionReportController.clientApproved.value.path);
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
                                Get.to(()=>EmployeePostPourInspectionReportSecondPageView(projectId: projectId));
                              },
                            ),
                          ),

                          SpaceHelperClass.h(12.w(context)),


                          Expanded(
                            child: employeePostPourInspectionReportController.isSubmit.value == true ?
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
                                if(employeePostPourInspectionReportController.commentDrainageElementsController.value.text == "" ||
                                    employeePostPourInspectionReportController.selectDrainageElementsInspection.value == "" ||
                                    employeePostPourInspectionReportController.commentHoldingDownBoltsController.value.text == "" ||
                                    employeePostPourInspectionReportController.selectHoldingDownBoltsInspection.value == "" ||
                                    employeePostPourInspectionReportController.commentCrackInducersController.value.text == "" ||
                                    employeePostPourInspectionReportController.selectCrackInducersInspection.value == "" ||
                                    employeePostPourInspectionReportController.commentWaterprooflingMembraneController.value.text == "" ||
                                    employeePostPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "" ||
                                    employeePostPourInspectionReportController.commentOthersController.value.text == "" ||
                                    employeePostPourInspectionReportController.selectOthersInspection.value == ""
                                ) {
                                  kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                                } else if(employeePostPourInspectionReportController.signedOnCompletion.value.path == "") {
                                  kSnackBar(message: "Please Upload Signed On Completion", bgColor: AppColors.red);
                                } else if(employeePostPourInspectionReportController.clientApproved.value.path == "") {
                                  kSnackBar(message: "Please Upload Client Approved Sign", bgColor: AppColors.red);
                                } else {
                                  Map<String,dynamic> payload = {
                                    "project": employeePostPourInspectionReportController.getEmployeeProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "pour_no": employeePostPourInspectionReportController.pourNoController.value.text,
                                    "pour_date": employeePostPourInspectionReportController.pourDateController.value.text,
                                    "inspection_date": employeePostPourInspectionReportController.inspectionDataTimeController.value.text,
                                    "drawing_no": employeePostPourInspectionReportController.drawingSketchNoRevisionController.value.text,
                                    "ga_drawing": employeePostPourInspectionReportController.gaDrawingController.value.text,
                                    "rebar_drgs": employeePostPourInspectionReportController.rebarDrgsController.value.text,
                                    "temporary_works": employeePostPourInspectionReportController.temporaryWorksController.value.text,
                                    "pour_reference": employeePostPourInspectionReportController.pourReferenceController.value.text,
                                    "setting_out": {
                                      "line": employeePostPourInspectionReportController.lineLevelPositionController.value.text,
                                      "inspection": employeePostPourInspectionReportController.selectInspection.value == "Yes" ? true : false,
                                      "comment": employeePostPourInspectionReportController.commentInspectionController.value.text
                                    },
                                    "concrete_finish_type": {
                                      "inspection": employeePostPourInspectionReportController.selectConcreteFinishTypeInspection.value == "Yes" ? true : false,
                                      "comment": employeePostPourInspectionReportController.concreteFinishTypeCommentController.value.text,
                                    },
                                    "chamfers_edging_etc": {
                                      "inspection": employeePostPourInspectionReportController.selectChamfersEdgingInspection.value == "Yes" ? true : false,
                                      "comment": employeePostPourInspectionReportController.chamfersEdgingCommentController.value.text,
                                    },
                                    "drainage_elements": {
                                      "inspection": employeePostPourInspectionReportController.selectDrainageElementsInspection.value == "Yes" ? true : false,
                                      "comment": employeePostPourInspectionReportController.commentDrainageElementsController.value.text,
                                    },
                                    "holding_down_bolts": {
                                      "inspection": employeePostPourInspectionReportController.selectHoldingDownBoltsInspection.value == "Yes" ? true : false,
                                      "comment": employeePostPourInspectionReportController.commentHoldingDownBoltsController.value.text,
                                    },
                                    "crack_inducers": {
                                      "inspection": employeePostPourInspectionReportController.selectCrackInducersInspection.value == "Yes" ? true : false,
                                      "comment": employeePostPourInspectionReportController.commentCrackInducersController.value.text,
                                    },
                                    "waterproofing_membrane": {
                                      "inspection": employeePostPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "Yes" ? true : false,
                                      "comment": employeePostPourInspectionReportController.commentWaterprooflingMembraneController.value.text,
                                    },
                                    "others": {
                                      "inspection": employeePostPourInspectionReportController.selectOthersInspection.value == "Yes" ? true : false,
                                      "comment": employeePostPourInspectionReportController.commentOthersController.value.text,
                                    },
                                  };
                                  print(jsonEncode(payload));
                                  employeePostPourInspectionReportController.isSubmit.value = true;
                                  await employeePostPourInspectionReportController.createEmployeePostPostPourInspectionReportsController(
                                    payload: payload,
                                    clientApprovedSignature: employeePostPourInspectionReportController.clientApproved.value,
                                    signedOnCompletionSignature: employeePostPourInspectionReportController.signedOnCompletion.value,
                                  );
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
              ),



            ],
          ),
        )),
      ),
    );
  }

}
