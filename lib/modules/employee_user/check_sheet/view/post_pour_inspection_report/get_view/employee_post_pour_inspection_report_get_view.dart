import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_edit_post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_get_post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/employee_check_sheet_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/post_pour_inspection_report/edit_view/employee_edit_post_pour_inspection_report_first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeePostPourInspectionReportGetView extends StatelessWidget {
  EmployeePostPourInspectionReportGetView({super.key,required this.projectId});
  final String projectId;


  @override
  Widget build(BuildContext context) {
    EmployeeGetPostPourInspectionReportController employeeGetPostPourInspectionReportController = Get.put(EmployeeGetPostPourInspectionReportController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=>employeeGetPostPourInspectionReportController.isLoading.value == true  ?
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
                  Get.off(()=>EmployeeCheckSheetView(projectId: projectId),preventDuplicates: false);
                },
                title: "Post Pour Inspection Report",
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
                              text: "Post Pour Inspection Report",
                              fontSize: 20,
                              textColor: AppColors.black255,
                              fontWeight: FontWeight.w500,
                            ),
                          ),


                          SpaceHelperClass.h(12.w(context)),


                          ImageHelperClass.customImageButtonContainer(
                            onPressed: () async {
                              Get.delete<EmployeeEditPostPourInspectionReportController>(force: true);
                              Get.off(()=>EmployeeEditPostPourInspectionReportFirstPageView(projectId: projectId),preventDuplicates: false);
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
                              label: "Project",
                              value: employeeGetPostPourInspectionReportController.getEmployeeProjectDetailsResponseModel.value.data?.name ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Pour No",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.pourNo ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Pour Date",
                              value: DateFormat("MMM dd yyyy").format(DateTime.parse(employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.pourDate)),
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Inspection date",
                              value: DateFormat("MMM dd yyyy").format(DateTime.parse(employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.inspectionDate)),
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Drawing/Sketch No. & Revision",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.drawingNo ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "GA Drawing",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.gaDrawing ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Rebar Drgs",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.rebarDrgs ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Temporary Works",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.temporaryWorks ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Pour Reference",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.pourReference ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),



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

                            TextHelperClass.headingText(
                              context: context,
                              text: "Setting Out",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(15.h(context)),



                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Line / Level / Position",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.settingOut?.line ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Inspection",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.settingOut?.inspection == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.settingOut?.comment ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

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

                            TextHelperClass.headingText(
                              context: context,
                              text: "Concrete Finish",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(15.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Concrete Finish Type",
                              fontSize: 15,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(8.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Inspection",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.concreteFinishType?.inspection == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.concreteFinishType?.comment ?? "",
                            ),

                            SpaceHelperClass.v(15.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Chamfers,Edging etc",
                              fontSize: 15,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(8.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Inspection",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.chamfersEdgingEtc?.inspection == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.chamfersEdgingEtc?.comment ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

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

                            TextHelperClass.headingText(
                              context: context,
                              text: "Cast in items",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(15.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Drainage Elements",
                              fontSize: 15,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(8.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Inspection",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.drainageElements?.inspection == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.drainageElements?.comment ?? "",
                            ),

                            SpaceHelperClass.v(15.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Holding Down Bolts",
                              fontSize: 15,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(8.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Inspection",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.holdingDownBolts?.inspection == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.holdingDownBolts?.comment ?? "",
                            ),

                            SpaceHelperClass.v(15.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Crack Inducers",
                              fontSize: 15,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(8.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Inspection",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.crackInducers?.inspection == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.crackInducers?.comment ?? "",
                            ),

                            SpaceHelperClass.v(15.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Waterproofling Membrane",
                              fontSize: 15,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(8.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Inspection",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.waterproofingMembrane?.inspection == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.waterproofingMembrane?.comment ?? "",
                            ),


                            SpaceHelperClass.v(15.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Other",
                              fontSize: 15,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(8.h(context)),


                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Inspection",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.others?.inspection == true ? "Yes" : "No",
                            ),

                            SpaceHelperClass.v(10.h(context)),

                            ReportInfoHelper.projectInfoRow(
                              context: context,
                              label: "Comment",
                              value: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.others?.comment ?? "",
                            ),

                            SpaceHelperClass.v(10.h(context)),

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
                                    imagePath: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.clientApprovedSignature,
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
                                    imagePath: employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data?.signedOnCompletionSignature,
                                  ),
                                )


                              ],
                            ),

                          ],
                        ),
                      ),



                      SpaceHelperClass.v(16.h(context)),

                      employeeGetPostPourInspectionReportController.isPdf.value == true  ?
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
                            await employeeGetPostPourInspectionReportController.createAndOpenPdf(employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data!);
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


                      employeeGetPostPourInspectionReportController.isExcelOpen.value == true  ?
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
                            employeeGetPostPourInspectionReportController.isExcelOpen.value = true;
                            await employeeGetPostPourInspectionReportController.generateAndOpenExcel(employeeGetPostPourInspectionReportController.getEmployeePostPourInspectionReportResponseModel.value.data!);
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
          )),
        ),
      ),
    );
  }
}
