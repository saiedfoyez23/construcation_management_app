import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/edit_drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/widget/post_pour_Inspection_report_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class EditDrainageDuctingReportThirdPageView extends StatelessWidget {
  EditDrainageDuctingReportThirdPageView({super.key,required this.projectId});
  final String projectId;


  @override
  Widget build(BuildContext context) {
    EditDrainageDuctingReportController editDrainageDuctingReportController = Get.put(EditDrainageDuctingReportController(projectId: projectId));
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
                              text: "Pipe haunching / surrounding: ",
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
                              value: editDrainageDuctingReportController.selectPipeHaunchingSurrounding.value == "" ? null : editDrainageDuctingReportController.selectPipeHaunchingSurrounding.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectPipeHaunchingSurrounding.value = value!;
                              },
                              hintText: "Select Pipe haunching / surrounding",
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
                              text: "Compaction : ",
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
                              value: editDrainageDuctingReportController.selectCompaction.value == "" ? null : editDrainageDuctingReportController.selectCompaction.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectCompaction.value = value!;
                              },
                              hintText: "Select Compaction",
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
                              text: "Backfill : ",
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
                              value: editDrainageDuctingReportController.selectBackfill.value == "" ? null : editDrainageDuctingReportController.selectBackfill.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectBackfill.value = value!;
                              },
                              hintText: "Select Backfill",
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
                              text: "Thickness : ",
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
                              value: editDrainageDuctingReportController.selectThickness.value == "" ? null : editDrainageDuctingReportController.selectThickness.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectThickness.value = value!;
                              },
                              hintText: "Select Thickness",
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
                              text: "Type : ",
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
                              value: editDrainageDuctingReportController.selectType.value == "" ? null : editDrainageDuctingReportController.selectType.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectType.value = value!;
                              },
                              hintText: "Select Thickness",
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
                              text: "Marker tape : ",
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
                              value: editDrainageDuctingReportController.selectMakerTape.value == "" ? null : editDrainageDuctingReportController.selectMakerTape.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectMakerTape.value = value!;
                              },
                              hintText: "Select Maker Tape",
                            ),


                          ],
                        ),
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: editDrainageDuctingReportController.installByController.value,
                        label: "Install By : ",
                        hintText: "Enter Name",
                      ),


                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: editDrainageDuctingReportController.commentController.value,
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


                            editDrainageDuctingReportController.signedOnCompletion.value.path == "" ?
                            SizedBox.shrink() :
                            ImageHelperClass.customFileImageContainer(
                              context: context,
                              imageFit: BoxFit.contain,
                              fit: BoxFit.contain,
                              height: 150.h(context),
                              width: 375.w(context),
                              imagePath: editDrainageDuctingReportController.signedOnCompletion.value,
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
                                controller: editDrainageDuctingReportController.signedOnCompletionController.value,
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
                                      editDrainageDuctingReportController.clearSignedOnCompletion();
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
                                      Uint8List? data = await editDrainageDuctingReportController.signedOnCompletionController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        editDrainageDuctingReportController.signedOnCompletion.value = File('${directory.path}/signature.png');
                                        await editDrainageDuctingReportController.signedOnCompletion.value.writeAsBytes(data);
                                        print("Saved at: ${editDrainageDuctingReportController.signedOnCompletion.value.path}");
                                        final result = await OpenFile.open(editDrainageDuctingReportController.signedOnCompletion.value.path);
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

                            editDrainageDuctingReportController.clientApproved.value.path == "" ?
                            SizedBox.shrink() :
                            ImageHelperClass.customFileImageContainer(
                              context: context,
                              imageFit: BoxFit.contain,
                              fit: BoxFit.contain,
                              height: 150.h(context),
                              width: 375.w(context),
                              imagePath: editDrainageDuctingReportController.clientApproved.value,
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
                                controller: editDrainageDuctingReportController.clientApprovedController.value,
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
                                      editDrainageDuctingReportController.clearClientApproved();
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
                                      Uint8List? data = await editDrainageDuctingReportController.clientApprovedController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        editDrainageDuctingReportController.clientApproved.value = File('${directory.path}/client_signature.png');
                                        await editDrainageDuctingReportController.clientApproved.value.writeAsBytes(data);
                                        print("Saved at: ${editDrainageDuctingReportController.clientApproved.value.path}");
                                        final result = await OpenFile.open(editDrainageDuctingReportController.clientApproved.value.path);
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

                      editDrainageDuctingReportController.isSubmit.value == true ?
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
                          if(editDrainageDuctingReportController.selectPipeHaunchingSurrounding.value == "" ||
                              editDrainageDuctingReportController.selectCompaction.value == "" ||
                              editDrainageDuctingReportController.selectBackfill.value == "" ||
                              editDrainageDuctingReportController.selectThickness.value == "" ||
                              editDrainageDuctingReportController.selectType.value == "" ||
                              editDrainageDuctingReportController.selectMakerTape.value == "" ||
                              editDrainageDuctingReportController.installByController.value.text == ""
                          ) {
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else if(editDrainageDuctingReportController.signedOnCompletion.value.path == "") {
                            kSnackBar(message: "Please Upload Signed On Completion", bgColor: AppColors.red);
                          } else if(editDrainageDuctingReportController.clientApproved.value.path == "") {
                            kSnackBar(message: "Please Upload Client Approved Sign", bgColor: AppColors.red);
                          } else {
                            Map<String,dynamic> payload = {
                              "project": projectId,
                              "contract": editDrainageDuctingReportController.contractController.value.text,
                              "date": editDrainageDuctingReportController.dateController.value.text,
                              "drawing_reference_incl_revision": editDrainageDuctingReportController.drawingReferenceInclRevisionController.value.text,
                              "location_of_work": editDrainageDuctingReportController.locationController.value.text,
                              "completion_status": editDrainageDuctingReportController.selectCompletionStatus.value,
                              "sub_contractor": editDrainageDuctingReportController.subContractorController.value.text,
                              "bed_type_and_thickness": editDrainageDuctingReportController.selectBedTypeAndThickness.value == "Yes" ? true : false,
                              "installation_pipe_type": editDrainageDuctingReportController.pipeTypeController.value.text,
                              "line": editDrainageDuctingReportController.selectLine.value == "Yes" ? true : false,
                              "level": editDrainageDuctingReportController.selectLevel.value == "Yes" ? true : false,
                              "position": editDrainageDuctingReportController.selectPosition.value == "Yes" ? true : false,
                              "gradient": editDrainageDuctingReportController.selectGradient.value == "Yes" ? true : false,
                              "pop_up_dealed_off": editDrainageDuctingReportController.selectPopUpDealedOff.value == "Yes" ? true : false,
                              "test_air_water_cctv_mandrill": editDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value == "Yes" ? true : false,
                              "test_certificate_reference": editDrainageDuctingReportController.testCertificateReferenceController.value.text,
                              "pipe_haunching_surrounding": editDrainageDuctingReportController.selectPipeHaunchingSurrounding.value == "Yes" ? true : false,
                              "pipe_type": editDrainageDuctingReportController.pipeTypeController.value.text,
                              "compaction": editDrainageDuctingReportController.selectCompaction.value == "Yes" ? true : false,
                              "backfill": editDrainageDuctingReportController.selectBackfill.value == "Yes" ? true : false,
                              "thickness": editDrainageDuctingReportController.selectThickness.value == "Yes" ? true : false,
                              "type": editDrainageDuctingReportController.selectType.value == "Yes" ? true : false,
                              "marker_tape": editDrainageDuctingReportController.selectMakerTape.value == "Yes" ? true : false,
                              "install_by": editDrainageDuctingReportController.installByController.value.text,
                              "comment": editDrainageDuctingReportController.commentController.value.text,
                            };
                            print(jsonEncode(payload));

                            editDrainageDuctingReportController.isSubmit.value = true;
                            await editDrainageDuctingReportController.editDrainageDuctingReportController(
                              payload: payload,
                              clientApprovedSignature: editDrainageDuctingReportController.clientApproved.value,
                              signedOnCompletionSignature: editDrainageDuctingReportController.signedOnCompletion.value,
                              projectId: projectId,
                            );
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
