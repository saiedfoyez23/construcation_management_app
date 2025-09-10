import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/get_excavation_hardcore_store_file_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/check_sheet_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/excavation_hardcore_stone_file_report/edit_view/excavation_hardcore_store_file_report_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ExcavationHardcoreStoreFileReportGetView extends StatelessWidget {
  ExcavationHardcoreStoreFileReportGetView({super.key,required this.projectId});

  final String projectId;
  @override
  Widget build(BuildContext context) {
    GetExcavationHardcoreStoreFileReportController getExcavationHardcoreStoreFileReportController = Get.put(GetExcavationHardcoreStoreFileReportController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=>getExcavationHardcoreStoreFileReportController.isLoading.value == true  ?
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
                  Get.off(()=>CheckSheetView(projectId: projectId),preventDuplicates: false);
                },
                title: "Excavation / Hardcore / Stone Fill Report",
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
                              text: "Excavation / Hardcore / Stone Fill Report",
                              fontSize: 20,
                              textColor: AppColors.black255,
                              fontWeight: FontWeight.w500,
                            ),
                          ),


                          SpaceHelperClass.h(12.w(context)),


                          ImageHelperClass.customImageButtonContainer(
                            onPressed: () async {
                              Get.off(()=>ExcavationHardcoreStoreFileReportEditView(projectId: projectId),preventDuplicates: false);
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
                              value: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.contract ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Date",
                              value: DateFormat("MMM dd yyyy").format(DateTime.parse(getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.date)),
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Drawing Reference Incl Revision",
                              value: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.drawingReferenceInclRevision ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Revision",
                              value: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.revision ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Location of work",
                              value: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.locationOfWork ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Completion Status",
                              value: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.completionStatus ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Sub-Contractor",
                              value: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.subContractor ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Compliance Check",
                              value: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.complianceCheck == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Check for Underground Services",
                              value: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.checkForUndergroundServices == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.comment ?? "",
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
                                    imagePath: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.clientApprovedSignature,
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
                                    imagePath: getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value.data?.signedOnCompletionSignature,
                                  ),
                                )


                              ],
                            ),

                          ],
                        ),
                      ),


                      SpaceHelperClass.v(16.h(context)),

                      getExcavationHardcoreStoreFileReportController.isPdf.value == true  ?
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
                            await getExcavationHardcoreStoreFileReportController.createAndOpenPdf(getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value);
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


                      getExcavationHardcoreStoreFileReportController.isExcelOpen.value == true  ?
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
                            getExcavationHardcoreStoreFileReportController.isExcelOpen.value = true;
                            await getExcavationHardcoreStoreFileReportController.generateAndOpenExcel(getExcavationHardcoreStoreFileReportController.getExcavationHardcoreStoreFileReportModel.value);
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
                  )
                ),
              )



            ],
          )),
        ),
      ),
    );
  }
}
