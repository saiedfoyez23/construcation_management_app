import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/edit_drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/get_drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/check_sheet_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/drainage_ducting_report/edit_view/edit_drainage_ducting_report_first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class DrainageDuctingReportGetView extends StatelessWidget {
  DrainageDuctingReportGetView({super.key,required this.projectId});

  final String projectId;
  @override
  Widget build(BuildContext context) {
    GetDrainageDuctingReportController getDrainageDuctingReportController = Get.put(GetDrainageDuctingReportController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: getDrainageDuctingReportController.isLoading.value == true ?
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
                height: 60,
                onBackPressed: () {
                  Get.off(()=>CheckSheetView(projectId: projectId),preventDuplicates: false);
                },
                title: "Drainage/Ducting Report",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      Row(
                        children: [
                          Expanded(
                            child: TextHelperClass.headingText(
                              context: context,
                              text: "Drainage/Ducting Report",
                              fontSize: 20,
                              textColor: AppColors.black255,
                              fontWeight: FontWeight.w500,
                            ),
                          ),


                          SpaceHelperClass.h(12.w(context)),


                          ImageHelperClass.customImageButtonContainer(
                            onPressed: () async {
                              Get.delete<EditDrainageDuctingReportController>(force: true);
                              Get.off(()=>EditDrainageDuctingReportFirstPageView(projectId: projectId),preventDuplicates: false);
                            },
                            context: context,
                            height: 30.h(context),
                            width: 30.w(context),
                            imagePath: AppImages.editBlueIconSite,
                            fit: BoxFit.cover,
                            imageFit: BoxFit.contain,
                          ),
                        ],
                      ),

                      SpaceHelperClass.v(16.h(context)),


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
                          children: [

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Contact",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.contract ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Date",
                              value: DateFormat("MMM dd yyyy").format(DateTime.parse(getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.date)),
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Drawing Reference Incl Revision",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.drawingReferenceInclRevision ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Location of work",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.locationOfWork ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Completion Status",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.completionStatus ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Sub-Contractor",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.subContractor ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Pipe Type",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.pipeType ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Test Certificate Reference",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.testCertificateReference ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Install By",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.installBy ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Bed Type and Thickness",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.bedTypeAndThickness == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Line",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.line == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Level",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.level == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Position",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.position == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Gradient",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.gradient == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Pop up dealed off",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.popUpDealedOff == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Test(Air/Water/CCTV/Mandrill)",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.testAirWaterCctvMandrill == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "PIPE HAUNCHING / SURROUNDING",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.pipeHaunchingSurrounding == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "COMPACTION",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.compaction == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "BACKFILL",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.backfill == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "THICKNESS",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.thickness == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "TYPE",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.type == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "MARKER TAPE",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.markerTape == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.comment ?? "",
                            ),





                          ],
                        ),
                      ),

                      SpaceHelperClass.v(16.h(context)),


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
                          children: [


                            Row(
                              children: [


                                Expanded(
                                  child: TextHelperClass.headingText(
                                    context: context,
                                    text: "Client Approved",
                                    fontSize: 15,
                                    textColor: AppColors.black65,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                SpaceHelperClass.h(7.w(context)),

                                Expanded(
                                  child: ImageHelperClass.customNetworkImageContainer(
                                    context: context,
                                    imageFit: BoxFit.contain,
                                    fit: BoxFit.contain,
                                    height: 35.h(context),
                                    width: 65.w(context),
                                    imagePath: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.clientApprovedSignature,
                                  ),
                                )


                              ],
                            ),


                            SpaceHelperClass.v(10.h(context)),

                            Row(
                              children: [


                                Expanded(
                                  child: TextHelperClass.headingText(
                                    context: context,
                                    text: "Signed on Completion",
                                    fontSize: 15,
                                    textColor: AppColors.black65,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                SpaceHelperClass.h(7.w(context)),

                                Expanded(
                                  child: ImageHelperClass.customNetworkImageContainer(
                                    context: context,
                                    height: 35.h(context),
                                    width: 65.w(context),
                                    imageFit: BoxFit.contain,
                                    fit: BoxFit.contain,
                                    imagePath: getDrainageDuctingReportController.getDuctingReportResponseModel.value.data?.signedOnCompletionSignature,
                                  ),
                                )


                              ],
                            ),

                          ],
                        ),
                      ),

                      SpaceHelperClass.v(16.h(context)),

                      getDrainageDuctingReportController.isPdf.value == true  ?
                      CustomLoaderButton().customLoaderButton(
                        backgroundColor: Colors.transparent,
                        loaderColor: Color.fromRGBO(38, 50, 56, 1),
                        height: 50,
                        context: context,
                      ) :
                      SizedBox(
                        height: 50.h(context),
                        child: OutlinedButton(
                          onPressed: () async {
                            await getDrainageDuctingReportController.createAndOpenPdf(getDrainageDuctingReportController.getDuctingReportResponseModel.value);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.hpm(context),
                              vertical: 6.vpm(context),
                            ),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r(context)),
                            ),
                            side: BorderSide(
                                color: Color.fromRGBO(239, 68, 68, 1),
                                width: 1
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size(375.w(context), 50.h(context)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              ImageHelperClass.customImageContainer(
                                context: context,
                                height: 20.h(context),
                                width: 20.w(context),
                                imagePath: AppImages.pdf,
                                imageFit: BoxFit.contain,
                                fit: BoxFit.cover,
                              ),

                              SpaceHelperClass.h(4.w(context)),

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                text: "Export as pdf",
                                fontSize: 16,
                                textColor: Color.fromRGBO(239, 68, 68, 1),
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      ),


                      SpaceHelperClass.v(16.h(context)),


                      getDrainageDuctingReportController.isExcelOpen.value == true  ?
                      CustomLoaderButton().customLoaderButton(
                        backgroundColor: Colors.transparent,
                        loaderColor: Color.fromRGBO(38, 50, 56, 1),
                        height: 50,
                        context: context,
                      ) :
                      SizedBox(
                        height: 50.h(context),
                        child: OutlinedButton(
                          onPressed: () async {
                            getDrainageDuctingReportController.isExcelOpen.value = true;
                            await getDrainageDuctingReportController.generateAndOpenExcel(getDrainageDuctingReportController.getDuctingReportResponseModel.value);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.hpm(context),
                              vertical: 6.vpm(context),
                            ),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r(context)),
                            ),
                            side: BorderSide(
                                color: Color.fromRGBO(33, 178, 122, 1),
                                width: 1
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size(375.w(context), 50.h(context)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              ImageHelperClass.customImageContainer(
                                context: context,
                                height: 20.h(context),
                                width: 20.w(context),
                                imagePath: AppImages.excell,
                                imageFit: BoxFit.contain,
                                fit: BoxFit.cover,
                              ),

                              SpaceHelperClass.h(4.w(context)),

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                text: "Export as Excel",
                                fontSize: 16,
                                textColor: Color.fromRGBO(33, 178, 122, 1),
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      ),




                      SpaceHelperClass.v(16.h(context)),


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
