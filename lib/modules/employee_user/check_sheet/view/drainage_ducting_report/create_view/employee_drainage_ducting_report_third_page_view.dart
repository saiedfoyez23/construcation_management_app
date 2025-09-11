import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/widget/post_pour_Inspection_report_widget.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/drainage_ducting_report/create_view/employee_drainage_ducting_report_second_page_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';


class EmployeeDrainageDuctingReportThirdPageView extends StatelessWidget {
  EmployeeDrainageDuctingReportThirdPageView({super.key,required this.projectId});
  final String projectId;
  final EmployeeDrainageDuctingReportController employeeDrainageDuctingReportController = Get.put(EmployeeDrainageDuctingReportController());


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
                              value: employeeDrainageDuctingReportController.selectPipeHaunchingSurrounding.value == "" ? null : employeeDrainageDuctingReportController.selectPipeHaunchingSurrounding.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeDrainageDuctingReportController.selectPipeHaunchingSurrounding.value = value!;
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
                              value: employeeDrainageDuctingReportController.selectCompaction.value == "" ? null : employeeDrainageDuctingReportController.selectCompaction.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeDrainageDuctingReportController.selectCompaction.value = value!;
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
                              value: employeeDrainageDuctingReportController.selectBackfill.value == "" ? null : employeeDrainageDuctingReportController.selectBackfill.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeDrainageDuctingReportController.selectBackfill.value = value!;
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
                              value: employeeDrainageDuctingReportController.selectThickness.value == "" ? null : employeeDrainageDuctingReportController.selectThickness.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeDrainageDuctingReportController.selectThickness.value = value!;
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
                              value: employeeDrainageDuctingReportController.selectType.value == "" ? null : employeeDrainageDuctingReportController.selectType.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeDrainageDuctingReportController.selectType.value = value!;
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
                              value: employeeDrainageDuctingReportController.selectMakerTape.value == "" ? null :employeeDrainageDuctingReportController.selectMakerTape.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                employeeDrainageDuctingReportController.selectMakerTape.value = value!;
                              },
                              hintText: "Select Maker Tape",
                            ),


                          ],
                        ),
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeDrainageDuctingReportController.installByController.value,
                        label: "Install By : ",
                        hintText: "Enter Name",
                      ),


                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeDrainageDuctingReportController.commentController.value,
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

                            // Signature area with color options
                            Container(
                              height: 150.h(context),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(247, 247, 247, 1),
                                borderRadius: BorderRadius.circular(8.r(context)),
                              ),
                              child: Signature(
                                controller: employeeDrainageDuctingReportController.signedOnCompletionController.value,
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
                                      employeeDrainageDuctingReportController.clearSignedOnCompletion();
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
                                      Uint8List? data = await employeeDrainageDuctingReportController.signedOnCompletionController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        employeeDrainageDuctingReportController.signedOnCompletion.value = File('${directory.path}/signature.png');
                                        await employeeDrainageDuctingReportController.signedOnCompletion.value.writeAsBytes(data);
                                        print("Saved at: ${employeeDrainageDuctingReportController.signedOnCompletion.value.path}");
                                        final result = await OpenFile.open(employeeDrainageDuctingReportController.signedOnCompletion.value.path);
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
                                controller: employeeDrainageDuctingReportController.clientApprovedController.value,
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
                                      employeeDrainageDuctingReportController.clearClientApproved();
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
                                      Uint8List? data = await employeeDrainageDuctingReportController.clientApprovedController.value.toPngBytes();
                                      if (data != null) {
                                        final directory = await getApplicationDocumentsDirectory();
                                        employeeDrainageDuctingReportController.clientApproved.value = File('${directory.path}/client_signature.png');
                                        await employeeDrainageDuctingReportController.clientApproved.value.writeAsBytes(data);
                                        print("Saved at: ${employeeDrainageDuctingReportController.clientApproved.value.path}");
                                        final result = await OpenFile.open(employeeDrainageDuctingReportController.clientApproved.value.path);
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
                                Get.to(()=>EmployeeDrainageDuctingReportSecondPageView(projectId: projectId));
                              },
                            ),
                          ),


                          SpaceHelperClass.h(12.w(context)),



                          Expanded(
                            child: employeeDrainageDuctingReportController.isSubmit.value == true ?
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
                                  if(employeeDrainageDuctingReportController.selectPipeHaunchingSurrounding.value == "" ||
                                      employeeDrainageDuctingReportController.selectCompaction.value == "" ||
                                      employeeDrainageDuctingReportController.selectBackfill.value == "" ||
                                      employeeDrainageDuctingReportController.selectThickness.value == "" ||
                                      employeeDrainageDuctingReportController.selectType.value == "" ||
                                      employeeDrainageDuctingReportController.selectMakerTape.value == "" ||
                                      employeeDrainageDuctingReportController.installByController.value.text == ""
                                  ) {
                                    kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                                  } else if(employeeDrainageDuctingReportController.signedOnCompletion.value.path == "") {
                                    kSnackBar(message: "Please Upload Signed On Completion", bgColor: AppColors.red);
                                  } else if(employeeDrainageDuctingReportController.clientApproved.value.path == "") {
                                    kSnackBar(message: "Please Upload Client Approved Sign", bgColor: AppColors.red);
                                  } else {
                                    Map<String,dynamic> payload = {
                                      "project": projectId,
                                      "contract": employeeDrainageDuctingReportController.contractController.value.text,
                                      "date": employeeDrainageDuctingReportController.dateController.value.text,
                                      "drawing_reference_incl_revision": employeeDrainageDuctingReportController.drawingReferenceInclRevisionController.value.text,
                                      "location_of_work": employeeDrainageDuctingReportController.locationController.value.text,
                                      "completion_status": employeeDrainageDuctingReportController.selectCompletionStatus.value,
                                      "sub_contractor": employeeDrainageDuctingReportController.subContractorController.value.text,
                                      "bed_type_and_thickness": employeeDrainageDuctingReportController.selectBedTypeAndThickness.value == "Yes" ? true : false,
                                      "installation_pipe_type": employeeDrainageDuctingReportController.pipeTypeController.value.text,
                                      "line": employeeDrainageDuctingReportController.selectLine.value == "Yes" ? true : false,
                                      "level": employeeDrainageDuctingReportController.selectLevel.value == "Yes" ? true : false,
                                      "position": employeeDrainageDuctingReportController.selectPosition.value == "Yes" ? true : false,
                                      "gradient": employeeDrainageDuctingReportController.selectGradient.value == "Yes" ? true : false,
                                      "pop_up_dealed_off": employeeDrainageDuctingReportController.selectPopUpDealedOff.value == "Yes" ? true : false,
                                      "test_air_water_cctv_mandrill": employeeDrainageDuctingReportController.selectTestAirWaterCCTVMandrill.value == "Yes" ? true : false,
                                      "test_certificate_reference": employeeDrainageDuctingReportController.testCertificateReferenceController.value.text,
                                      "pipe_haunching_surrounding": employeeDrainageDuctingReportController.selectPipeHaunchingSurrounding.value == "Yes" ? true : false,
                                      "pipe_type": employeeDrainageDuctingReportController.pipeTypeController.value.text,
                                      "compaction": employeeDrainageDuctingReportController.selectCompaction.value == "Yes" ? true : false,
                                      "backfill": employeeDrainageDuctingReportController.selectBackfill.value == "Yes" ? true : false,
                                      "thickness": employeeDrainageDuctingReportController.selectThickness.value == "Yes" ? true : false,
                                      "type": employeeDrainageDuctingReportController.selectType.value == "Yes" ? true : false,
                                      "marker_tape": employeeDrainageDuctingReportController.selectMakerTape.value == "Yes" ? true : false,
                                      "install_by": employeeDrainageDuctingReportController.installByController.value.text,
                                      "comment": employeeDrainageDuctingReportController.commentController.value.text,
                                    };
                                    print(jsonEncode(payload));

                                    employeeDrainageDuctingReportController.isSubmit.value = true;
                                    await employeeDrainageDuctingReportController.createEmployeeDrainageDuctingReportController(
                                      payload: payload,
                                      clientApprovedSignature: employeeDrainageDuctingReportController.clientApproved.value,
                                      signedOnCompletionSignature: employeeDrainageDuctingReportController.signedOnCompletion.value,
                                      projectId: projectId,
                                    );
                                  }

                                },
                              ),
                          )



                        ],
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
