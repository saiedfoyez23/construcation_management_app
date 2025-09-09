import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/create_view/post_pour_inspection_report_first_page_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';


class PostPourInspectionReportThirdPageView extends StatelessWidget {
  PostPourInspectionReportThirdPageView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    PostPourInspectionReportController postPourInspectionReportController = Get.put(PostPourInspectionReportController(projectId: projectId));
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
                              value: postPourInspectionReportController.selectDrainageElementsInspection.value == "" ?
                              null : postPourInspectionReportController.selectDrainageElementsInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  postPourInspectionReportController.isDrainageElementsInspection.value = true;
                                  postPourInspectionReportController.selectDrainageElementsInspection.value = value!;
                                } else {
                                  postPourInspectionReportController.isDrainageElementsInspection.value = false;
                                  postPourInspectionReportController.selectDrainageElementsInspection.value = value!;
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
                              controller: postPourInspectionReportController.commentDrainageElementsController.value,
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
                              value: postPourInspectionReportController.selectHoldingDownBoltsInspection.value == "" ?
                              null : postPourInspectionReportController.selectHoldingDownBoltsInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  postPourInspectionReportController.isHoldingDownBoltsInspection.value = true;
                                  postPourInspectionReportController.selectHoldingDownBoltsInspection.value = value!;
                                } else {
                                  postPourInspectionReportController.isHoldingDownBoltsInspection.value = false;
                                  postPourInspectionReportController.selectHoldingDownBoltsInspection.value = value!;
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
                              controller: postPourInspectionReportController.commentHoldingDownBoltsController.value,
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
                              value: postPourInspectionReportController.selectCrackInducersInspection.value == "" ?
                              null : postPourInspectionReportController.selectCrackInducersInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  postPourInspectionReportController.isCrackInducersInspection.value = true;
                                  postPourInspectionReportController.selectCrackInducersInspection.value = value!;
                                } else {
                                  postPourInspectionReportController.isCrackInducersInspection.value = false;
                                  postPourInspectionReportController.selectCrackInducersInspection.value = value!;
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
                              controller: postPourInspectionReportController.commentCrackInducersController.value,
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
                              value: postPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "" ?
                              null : postPourInspectionReportController.selectWaterprooflingMembraneInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  postPourInspectionReportController.isWaterprooflingMembraneInspection.value = true;
                                  postPourInspectionReportController.selectWaterprooflingMembraneInspection.value = value!;
                                } else {
                                  postPourInspectionReportController.isWaterprooflingMembraneInspection.value = false;
                                  postPourInspectionReportController.selectWaterprooflingMembraneInspection.value = value!;
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
                              controller: postPourInspectionReportController.commentWaterprooflingMembraneController.value,
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
                              value: postPourInspectionReportController.selectOthersInspection.value == "" ?
                              null : postPourInspectionReportController.selectOthersInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  postPourInspectionReportController.isOthersInspection.value = true;
                                  postPourInspectionReportController.selectOthersInspection.value = value!;
                                } else {
                                  postPourInspectionReportController.isOthersInspection.value = false;
                                  postPourInspectionReportController.selectOthersInspection.value = value!;
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
                              controller: postPourInspectionReportController.commentOthersController.value,
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
                                controller: postPourInspectionReportController.signedOnCompletionController.value,
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
                                      postPourInspectionReportController.clearSignedOnCompletion();
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
                                      Uint8List? data = await postPourInspectionReportController.signedOnCompletionController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        postPourInspectionReportController.signedOnCompletion.value = File('${directory.path}/signature.png');
                                        await postPourInspectionReportController.signedOnCompletion.value.writeAsBytes(data);
                                        print("Saved at: ${postPourInspectionReportController.signedOnCompletion.value.path}");
                                        final result = await OpenFile.open(postPourInspectionReportController.signedOnCompletion.value.path);
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
                                controller: postPourInspectionReportController.clientApprovedController.value,
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
                                      postPourInspectionReportController.clearClientApproved();
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
                                      Uint8List? data = await postPourInspectionReportController.clientApprovedController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        postPourInspectionReportController.clientApproved.value = File('${directory.path}/client_signature.png');
                                        await postPourInspectionReportController.clientApproved.value.writeAsBytes(data);
                                        print("Saved at: ${postPourInspectionReportController.clientApproved.value.path}");
                                        final result = await OpenFile.open(postPourInspectionReportController.clientApproved.value.path);
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
                      postPourInspectionReportController.isSubmit.value == true ?
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
                          if(postPourInspectionReportController.commentDrainageElementsController.value.text == "" ||
                              postPourInspectionReportController.selectDrainageElementsInspection.value == "" ||
                              postPourInspectionReportController.commentHoldingDownBoltsController.value.text == "" ||
                              postPourInspectionReportController.selectHoldingDownBoltsInspection.value == "" ||
                              postPourInspectionReportController.commentCrackInducersController.value.text == "" ||
                              postPourInspectionReportController.selectCrackInducersInspection.value == "" ||
                              postPourInspectionReportController.commentWaterprooflingMembraneController.value.text == "" ||
                              postPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "" ||
                              postPourInspectionReportController.commentOthersController.value.text == "" ||
                              postPourInspectionReportController.selectOthersInspection.value == ""
                          ) {
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else if(postPourInspectionReportController.signedOnCompletion.value.path == "") {
                            kSnackBar(message: "Please Upload Signed On Completion", bgColor: AppColors.red);
                          } else if(postPourInspectionReportController.clientApproved.value.path == "") {
                            kSnackBar(message: "Please Upload Client Approved Sign", bgColor: AppColors.red);
                          } else {
                            Map<String,dynamic> payload = {
                              "project": postPourInspectionReportController.getProjectDetailsResponseModel.value.data?.sId ?? "",
                              "pour_no": postPourInspectionReportController.pourNoController.value.text,
                              "pour_date": postPourInspectionReportController.pourDateController.value.text,
                              "inspection_date": postPourInspectionReportController.inspectionDataTimeController.value.text,
                              "drawing_no": postPourInspectionReportController.drawingSketchNoRevisionController.value.text,
                              "ga_drawing": postPourInspectionReportController.gaDrawingController.value.text,
                              "rebar_drgs": postPourInspectionReportController.rebarDrgsController.value.text,
                              "temporary_works": postPourInspectionReportController.temporaryWorksController.value.text,
                              "pour_reference":  postPourInspectionReportController.pourReferenceController.value.text,
                              "setting_out": {
                                "line": postPourInspectionReportController.lineLevelPositionController.value.text,
                                "inspection": postPourInspectionReportController.selectInspection.value == "Yes" ? true : false,
                                "comment": postPourInspectionReportController.commentInspectionController.value.text
                              },
                              "concrete_finish_type": {
                                "inspection": postPourInspectionReportController.selectConcreteFinishTypeInspection.value == "Yes" ? true : false,
                                "comment": postPourInspectionReportController.concreteFinishTypeCommentController.value.text,
                              },
                              "chamfers_edging_etc": {
                                "inspection": postPourInspectionReportController.selectChamfersEdgingInspection.value == "Yes" ? true : false,
                                "comment": postPourInspectionReportController.chamfersEdgingCommentController.value.text,
                              },
                              "drainage_elements": {
                                "inspection": postPourInspectionReportController.selectDrainageElementsInspection.value == "Yes" ? true : false,
                                "comment": postPourInspectionReportController.commentDrainageElementsController.value.text,
                              },
                              "holding_down_bolts": {
                                "inspection": postPourInspectionReportController.selectHoldingDownBoltsInspection.value == "Yes" ? true : false,
                                "comment": postPourInspectionReportController.commentHoldingDownBoltsController.value.text,
                              },
                              "crack_inducers": {
                                "inspection": postPourInspectionReportController.selectCrackInducersInspection.value == "Yes" ? true : false,
                                "comment": postPourInspectionReportController.commentCrackInducersController.value.text,
                              },
                              "waterproofing_membrane": {
                                "inspection": postPourInspectionReportController.selectWaterprooflingMembraneInspection.value == "Yes" ? true : false,
                                "comment": postPourInspectionReportController.commentWaterprooflingMembraneController.value.text,
                              },
                              "others": {
                                "inspection": postPourInspectionReportController.selectOthersInspection.value == "Yes" ? true : false,
                                "comment": postPourInspectionReportController.commentOthersController.value.text,
                              },
                            };
                            print(jsonEncode(payload));
                            postPourInspectionReportController.isSubmit.value = true;
                            await postPourInspectionReportController.createPostPostPourInspectionReportsController(
                              payload: payload,
                              clientApprovedSignature: postPourInspectionReportController.clientApproved.value,
                              signedOnCompletionSignature: postPourInspectionReportController.signedOnCompletion.value,
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
