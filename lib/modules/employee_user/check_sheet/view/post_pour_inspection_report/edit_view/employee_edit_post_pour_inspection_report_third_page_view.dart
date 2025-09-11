import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_edit_post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/post_pour_inspection_report/edit_view/employee_edit_post_pour_inspection_report_second_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class EmployeeEditPostPourInspectionReportThirdPageView extends StatelessWidget {
  EmployeeEditPostPourInspectionReportThirdPageView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    EmployeeEditPostPourInspectionReportController employeeEditPostPourInspectionReportController = Get.put(EmployeeEditPostPourInspectionReportController(projectId: projectId));
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
                              value: employeeEditPostPourInspectionReportController.selectDrainageElementsInspection.value == "" ?
                              null : employeeEditPostPourInspectionReportController.selectDrainageElementsInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeeEditPostPourInspectionReportController.selectDrainageElementsInspection.value = value!;
                                } else {
                                  employeeEditPostPourInspectionReportController.selectDrainageElementsInspection.value = value!;
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
                              controller: employeeEditPostPourInspectionReportController.commentDrainageElementsController.value,
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
                              value: employeeEditPostPourInspectionReportController.selectHoldingDownBoltsInspection.value == "" ?
                              null : employeeEditPostPourInspectionReportController.selectHoldingDownBoltsInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeeEditPostPourInspectionReportController.selectHoldingDownBoltsInspection.value = value!;
                                } else {
                                  employeeEditPostPourInspectionReportController.selectHoldingDownBoltsInspection.value = value!;
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
                              controller: employeeEditPostPourInspectionReportController.commentHoldingDownBoltsController.value,
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
                              value: employeeEditPostPourInspectionReportController.selectCrackInducersInspection.value == "" ?
                              null : employeeEditPostPourInspectionReportController.selectCrackInducersInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeeEditPostPourInspectionReportController.selectCrackInducersInspection.value = value!;
                                } else {
                                  employeeEditPostPourInspectionReportController.selectCrackInducersInspection.value = value!;
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
                              controller: employeeEditPostPourInspectionReportController.commentCrackInducersController.value,
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
                              value: employeeEditPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "" ?
                              null : employeeEditPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeeEditPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value = value!;
                                } else {
                                  employeeEditPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value = value!;
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
                              controller: employeeEditPostPourInspectionReportController.commentWaterprooflingMembraneController.value,
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
                              value: employeeEditPostPourInspectionReportController.selectOthersInspection.value == "" ?
                              null : employeeEditPostPourInspectionReportController.selectOthersInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  employeeEditPostPourInspectionReportController.selectOthersInspection.value = value!;
                                } else {
                                  employeeEditPostPourInspectionReportController.selectOthersInspection.value = value!;
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
                              controller: employeeEditPostPourInspectionReportController.commentOthersController.value,
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


                            employeeEditPostPourInspectionReportController.signedOnCompletion.value.path == "" ?
                            SizedBox.shrink() :
                            ImageHelperClass.customFileImageContainer(
                              context: context,
                              imageFit: BoxFit.contain,
                              fit: BoxFit.contain,
                              height: 150.h(context),
                              width: 375.w(context),
                              imagePath: employeeEditPostPourInspectionReportController.signedOnCompletion.value,
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
                                controller: employeeEditPostPourInspectionReportController.signedOnCompletionController.value,
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
                                      employeeEditPostPourInspectionReportController.clearSignedOnCompletion();
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
                                      Uint8List? data = await employeeEditPostPourInspectionReportController.signedOnCompletionController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        employeeEditPostPourInspectionReportController.signedOnCompletion.value = File('${directory.path}/signature.png');
                                        await employeeEditPostPourInspectionReportController.signedOnCompletion.value.writeAsBytes(data);
                                        print("Saved at: ${employeeEditPostPourInspectionReportController.signedOnCompletion.value.path}");
                                        final result = await OpenFile.open(employeeEditPostPourInspectionReportController.signedOnCompletion.value.path);
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

                            employeeEditPostPourInspectionReportController.clientApproved.value.path == "" ?
                            SizedBox.shrink() :
                            ImageHelperClass.customFileImageContainer(
                              context: context,
                              imageFit: BoxFit.contain,
                              fit: BoxFit.contain,
                              height: 150.h(context),
                              width: 375.w(context),
                              imagePath: employeeEditPostPourInspectionReportController.clientApproved.value,
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
                                controller: employeeEditPostPourInspectionReportController.clientApprovedController.value,
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
                                      employeeEditPostPourInspectionReportController.clearClientApproved();
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
                                      Uint8List? data = await employeeEditPostPourInspectionReportController.clientApprovedController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        employeeEditPostPourInspectionReportController.clientApproved.value = File('${directory.path}/client_signature.png');
                                        await employeeEditPostPourInspectionReportController.clientApproved.value.writeAsBytes(data);
                                        print("Saved at: ${employeeEditPostPourInspectionReportController.clientApproved.value.path}");
                                        final result = await OpenFile.open(employeeEditPostPourInspectionReportController.clientApproved.value.path);
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
                                Get.to(()=>EmployeeEditPostPourInspectionReportSecondPageView(projectId: projectId));
                              },
                            ),
                          ),


                          SpaceHelperClass.h(12.w(context)),


                          Expanded(
                            child: employeeEditPostPourInspectionReportController.isSubmit.value == true ?
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
                                if(employeeEditPostPourInspectionReportController.commentDrainageElementsController.value.text == "" ||
                                    employeeEditPostPourInspectionReportController.selectDrainageElementsInspection.value == "" ||
                                    employeeEditPostPourInspectionReportController.commentHoldingDownBoltsController.value.text == "" ||
                                    employeeEditPostPourInspectionReportController.selectHoldingDownBoltsInspection.value == "" ||
                                    employeeEditPostPourInspectionReportController.commentCrackInducersController.value.text == "" ||
                                    employeeEditPostPourInspectionReportController.selectCrackInducersInspection.value == "" ||
                                    employeeEditPostPourInspectionReportController.commentWaterprooflingMembraneController.value.text == "" ||
                                    employeeEditPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "" ||
                                    employeeEditPostPourInspectionReportController.commentOthersController.value.text == "" ||
                                    employeeEditPostPourInspectionReportController.selectOthersInspection.value == ""
                                ) {
                                  kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                                } else if(employeeEditPostPourInspectionReportController.signedOnCompletion.value.path == "") {
                                  kSnackBar(message: "Please Upload Signed On Completion", bgColor: AppColors.red);
                                } else if(employeeEditPostPourInspectionReportController.clientApproved.value.path == "") {
                                  kSnackBar(message: "Please Upload Client Approved Sign", bgColor: AppColors.red);
                                } else {
                                  Map<String,dynamic> payload = {
                                    "project": employeeEditPostPourInspectionReportController.getEmployeeProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "pour_no": employeeEditPostPourInspectionReportController.pourNoController.value.text,
                                    "pour_date": employeeEditPostPourInspectionReportController.pourDateController.value.text,
                                    "inspection_date": employeeEditPostPourInspectionReportController.inspectionDataTimeController.value.text,
                                    "drawing_no": employeeEditPostPourInspectionReportController.drawingSketchNoRevisionController.value.text,
                                    "ga_drawing": employeeEditPostPourInspectionReportController.gaDrawingController.value.text,
                                    "rebar_drgs": employeeEditPostPourInspectionReportController.rebarDrgsController.value.text,
                                    "temporary_works": employeeEditPostPourInspectionReportController.temporaryWorksController.value.text,
                                    "pour_reference": employeeEditPostPourInspectionReportController.pourReferenceController.value.text,
                                    "setting_out": {
                                      "line": employeeEditPostPourInspectionReportController.lineLevelPositionController.value.text,
                                      "inspection": employeeEditPostPourInspectionReportController.selectInspection.value == "Yes" ? true : false,
                                      "comment": employeeEditPostPourInspectionReportController.commentInspectionController.value.text
                                    },
                                    "concrete_finish_type": {
                                      "inspection": employeeEditPostPourInspectionReportController.selectConcreteFinishTypeInspection.value == "Yes" ? true : false,
                                      "comment": employeeEditPostPourInspectionReportController.concreteFinishTypeCommentController.value.text,
                                    },
                                    "chamfers_edging_etc": {
                                      "inspection": employeeEditPostPourInspectionReportController.selectChamfersEdgingInspection.value == "Yes" ? true : false,
                                      "comment": employeeEditPostPourInspectionReportController.chamfersEdgingCommentController.value.text,
                                    },
                                    "drainage_elements": {
                                      "inspection": employeeEditPostPourInspectionReportController.selectDrainageElementsInspection.value == "Yes" ? true : false,
                                      "comment": employeeEditPostPourInspectionReportController.commentDrainageElementsController.value.text,
                                    },
                                    "holding_down_bolts": {
                                      "inspection": employeeEditPostPourInspectionReportController.selectHoldingDownBoltsInspection.value == "Yes" ? true : false,
                                      "comment": employeeEditPostPourInspectionReportController.commentHoldingDownBoltsController.value.text,
                                    },
                                    "crack_inducers": {
                                      "inspection": employeeEditPostPourInspectionReportController.selectCrackInducersInspection.value == "Yes" ? true : false,
                                      "comment": employeeEditPostPourInspectionReportController.commentCrackInducersController.value.text,
                                    },
                                    "waterproofing_membrane": {
                                      "inspection": employeeEditPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "Yes" ? true : false,
                                      "comment": employeeEditPostPourInspectionReportController.commentWaterprooflingMembraneController.value.text,
                                    },
                                    "others": {
                                      "inspection": employeeEditPostPourInspectionReportController.selectOthersInspection.value == "Yes" ? true : false,
                                      "comment": employeeEditPostPourInspectionReportController.commentOthersController.value.text,
                                    },
                                  };
                                  print(jsonEncode(payload));
                                  employeeEditPostPourInspectionReportController.isSubmit.value = true;
                                  await employeeEditPostPourInspectionReportController.editEmployeePostPostPourInspectionReportsController(
                                    payload: payload,
                                    clientApprovedSignature: employeeEditPostPourInspectionReportController.clientApproved.value,
                                    signedOnCompletionSignature: employeeEditPostPourInspectionReportController.signedOnCompletion.value,
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
