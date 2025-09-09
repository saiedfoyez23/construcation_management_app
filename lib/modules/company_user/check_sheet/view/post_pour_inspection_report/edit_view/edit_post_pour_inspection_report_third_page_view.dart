import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/edit_post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/create_view/post_pour_inspection_report_first_page_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';


class EditPostPourInspectionReportThirdPageView extends StatelessWidget {
  EditPostPourInspectionReportThirdPageView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    EditPostPourInspectionReportController editPostPourInspectionReportController = Get.put(EditPostPourInspectionReportController(projectId: projectId));
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
                              value: editPostPourInspectionReportController.selectDrainageElementsInspection.value == "" ?
                              null : editPostPourInspectionReportController.selectDrainageElementsInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  editPostPourInspectionReportController.isDrainageElementsInspection.value = true;
                                  editPostPourInspectionReportController.selectDrainageElementsInspection.value = value!;
                                } else {
                                  editPostPourInspectionReportController.isDrainageElementsInspection.value = false;
                                  editPostPourInspectionReportController.selectDrainageElementsInspection.value = value!;
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
                              controller: editPostPourInspectionReportController.commentDrainageElementsController.value,
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
                              value: editPostPourInspectionReportController.selectHoldingDownBoltsInspection.value == "" ?
                              null : editPostPourInspectionReportController.selectHoldingDownBoltsInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  editPostPourInspectionReportController.isHoldingDownBoltsInspection.value = true;
                                  editPostPourInspectionReportController.selectHoldingDownBoltsInspection.value = value!;
                                } else {
                                  editPostPourInspectionReportController.isHoldingDownBoltsInspection.value = false;
                                  editPostPourInspectionReportController.selectHoldingDownBoltsInspection.value = value!;
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
                              controller: editPostPourInspectionReportController.commentHoldingDownBoltsController.value,
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
                              value: editPostPourInspectionReportController.selectCrackInducersInspection.value == "" ?
                              null : editPostPourInspectionReportController.selectCrackInducersInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  editPostPourInspectionReportController.isCrackInducersInspection.value = true;
                                  editPostPourInspectionReportController.selectCrackInducersInspection.value = value!;
                                } else {
                                  editPostPourInspectionReportController.isCrackInducersInspection.value = false;
                                  editPostPourInspectionReportController.selectCrackInducersInspection.value = value!;
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
                              controller: editPostPourInspectionReportController.commentCrackInducersController.value,
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
                              value: editPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "" ?
                              null : editPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  editPostPourInspectionReportController.isWaterprooflingMembraneInspection.value = true;
                                  editPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value = value!;
                                } else {
                                  editPostPourInspectionReportController.isWaterprooflingMembraneInspection.value = false;
                                  editPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value = value!;
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
                              controller: editPostPourInspectionReportController.commentWaterprooflingMembraneController.value,
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
                              value: editPostPourInspectionReportController.selectOthersInspection.value == "" ?
                              null : editPostPourInspectionReportController.selectOthersInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  editPostPourInspectionReportController.isOthersInspection.value = true;
                                  editPostPourInspectionReportController.selectOthersInspection.value = value!;
                                } else {
                                  editPostPourInspectionReportController.isOthersInspection.value = false;
                                  editPostPourInspectionReportController.selectOthersInspection.value = value!;
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
                              controller: editPostPourInspectionReportController.commentOthersController.value,
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


                            editPostPourInspectionReportController.signedOnCompletion.value.path == "" ?
                            SizedBox.shrink() :
                            ImageHelperClass.customFileImageContainer(
                              context: context,
                              imageFit: BoxFit.contain,
                              fit: BoxFit.contain,
                              height: 150.h(context),
                              width: 375.w(context),
                              imagePath: editPostPourInspectionReportController.signedOnCompletion.value,
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
                                controller: editPostPourInspectionReportController.signedOnCompletionController.value,
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
                                      editPostPourInspectionReportController.clearSignedOnCompletion();
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
                                      Uint8List? data = await editPostPourInspectionReportController.signedOnCompletionController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        editPostPourInspectionReportController.signedOnCompletion.value = File('${directory.path}/signature.png');
                                        await editPostPourInspectionReportController.signedOnCompletion.value.writeAsBytes(data);
                                        print("Saved at: ${editPostPourInspectionReportController.signedOnCompletion.value.path}");
                                        final result = await OpenFile.open(editPostPourInspectionReportController.signedOnCompletion.value.path);
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

                            editPostPourInspectionReportController.clientApproved.value.path == "" ?
                            SizedBox.shrink() :
                            ImageHelperClass.customFileImageContainer(
                              context: context,
                              imageFit: BoxFit.contain,
                              fit: BoxFit.contain,
                              height: 150.h(context),
                              width: 375.w(context),
                              imagePath: editPostPourInspectionReportController.clientApproved.value,
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
                                controller: editPostPourInspectionReportController.clientApprovedController.value,
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
                                      editPostPourInspectionReportController.clearClientApproved();
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
                                      Uint8List? data = await editPostPourInspectionReportController.clientApprovedController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        editPostPourInspectionReportController.clientApproved.value = File('${directory.path}/client_signature.png');
                                        await editPostPourInspectionReportController.clientApproved.value.writeAsBytes(data);
                                        print("Saved at: ${editPostPourInspectionReportController.clientApproved.value.path}");
                                        final result = await OpenFile.open(editPostPourInspectionReportController.clientApproved.value.path);
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
                      editPostPourInspectionReportController.isSubmit.value == true ?
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
                          if(editPostPourInspectionReportController.commentDrainageElementsController.value.text == "" ||
                              editPostPourInspectionReportController.selectDrainageElementsInspection.value == "" ||
                              editPostPourInspectionReportController.commentHoldingDownBoltsController.value.text == "" ||
                              editPostPourInspectionReportController.selectHoldingDownBoltsInspection.value == "" ||
                              editPostPourInspectionReportController.commentCrackInducersController.value.text == "" ||
                              editPostPourInspectionReportController.selectCrackInducersInspection.value == "" ||
                              editPostPourInspectionReportController.commentWaterprooflingMembraneController.value.text == "" ||
                              editPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "" ||
                              editPostPourInspectionReportController.commentOthersController.value.text == "" ||
                              editPostPourInspectionReportController.selectOthersInspection.value == ""
                          ) {
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else if(editPostPourInspectionReportController.signedOnCompletion.value.path == "") {
                            kSnackBar(message: "Please Upload Signed On Completion", bgColor: AppColors.red);
                          } else if(editPostPourInspectionReportController.clientApproved.value.path == "") {
                            kSnackBar(message: "Please Upload Client Approved Sign", bgColor: AppColors.red);
                          } else {
                            Map<String,dynamic> payload = {
                              "project": editPostPourInspectionReportController.getProjectDetailsResponseModel.value.data?.sId ?? "",
                              "pour_no": editPostPourInspectionReportController.pourNoController.value.text,
                              "pour_date": editPostPourInspectionReportController.pourDateController.value.text,
                              "inspection_date": editPostPourInspectionReportController.inspectionDataTimeController.value.text,
                              "drawing_no": editPostPourInspectionReportController.drawingSketchNoRevisionController.value.text,
                              "ga_drawing": editPostPourInspectionReportController.gaDrawingController.value.text,
                              "rebar_drgs": editPostPourInspectionReportController.rebarDrgsController.value.text,
                              "temporary_works": editPostPourInspectionReportController.temporaryWorksController.value.text,
                              "pour_reference": editPostPourInspectionReportController.pourReferenceController.value.text,
                              "setting_out": {
                                "line": editPostPourInspectionReportController.lineLevelPositionController.value.text,
                                "inspection": editPostPourInspectionReportController.selectInspection.value == "Yes" ? true : false,
                                "comment": editPostPourInspectionReportController.commentInspectionController.value.text
                              },
                              "concrete_finish_type": {
                                "inspection": editPostPourInspectionReportController.selectConcreteFinishTypeInspection.value == "Yes" ? true : false,
                                "comment": editPostPourInspectionReportController.concreteFinishTypeCommentController.value.text,
                              },
                              "chamfers_edging_etc": {
                                "inspection": editPostPourInspectionReportController.selectChamfersEdgingInspection.value == "Yes" ? true : false,
                                "comment": editPostPourInspectionReportController.chamfersEdgingCommentController.value.text,
                              },
                              "drainage_elements": {
                                "inspection": editPostPourInspectionReportController.selectDrainageElementsInspection.value == "Yes" ? true : false,
                                "comment": editPostPourInspectionReportController.commentDrainageElementsController.value.text,
                              },
                              "holding_down_bolts": {
                                "inspection": editPostPourInspectionReportController.selectHoldingDownBoltsInspection.value == "Yes" ? true : false,
                                "comment": editPostPourInspectionReportController.commentHoldingDownBoltsController.value.text,
                              },
                              "crack_inducers": {
                                "inspection": editPostPourInspectionReportController.selectCrackInducersInspection.value == "Yes" ? true : false,
                                "comment": editPostPourInspectionReportController.commentCrackInducersController.value.text,
                              },
                              "waterproofing_membrane": {
                                "inspection": editPostPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "Yes" ? true : false,
                                "comment": editPostPourInspectionReportController.commentWaterprooflingMembraneController.value.text,
                              },
                              "others": {
                                "inspection": editPostPourInspectionReportController.selectOthersInspection.value == "Yes" ? true : false,
                                "comment": editPostPourInspectionReportController.commentOthersController.value.text,
                              },
                            };
                            print(jsonEncode(payload));
                            editPostPourInspectionReportController.isSubmit.value = true;
                            await editPostPourInspectionReportController.editPostPostPourInspectionReportsController(
                              payload: payload,
                              clientApprovedSignature: editPostPourInspectionReportController.clientApproved.value,
                              signedOnCompletionSignature: editPostPourInspectionReportController.signedOnCompletion.value,
                            );
                          }

                        },
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
