import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/widget/post_pour_Inspection_report_widget.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/employee_check_sheet_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/post_pour_inspection_report/create_view/employee_post_pour_inspection_report_second_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeePostPourInspectionReportFirstPageView extends StatelessWidget {
  EmployeePostPourInspectionReportFirstPageView({super.key,required this.projectId});
  final String projectId;


  @override
  Widget build(BuildContext context) {
    EmployeePostPourInspectionReportController employeePostPourInspectionReportController = Get.put(EmployeePostPourInspectionReportController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=> employeePostPourInspectionReportController.isLoading.value == true  ?
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
                    children: [

                      SpaceHelperClass.v(24.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeePostPourInspectionReportController.projectNameController.value,
                        readOnly: true,
                        label: "Project : ",
                        hintText: "Enter project name",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeePostPourInspectionReportController.pourNoController.value,
                        label: "Pour No : ",
                        hintText: "Enter pour number",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        readOnly: true,
                        controller: employeePostPourInspectionReportController.pourDateController.value,
                        label: "Pour Date : ",
                        hintText: "Enter pour date",
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
                            employeePostPourInspectionReportController.pourDateController.value.text = picked.toLocal().toString();
                          }
                        }
                      ),


                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                          context: context,
                          readOnly: true,
                          controller: employeePostPourInspectionReportController.inspectionDataTimeController.value,
                          label: "Inspection Date & Time : ",
                          hintText: "Enter inspection date & time",
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
                              employeePostPourInspectionReportController.inspectionDataTimeController.value.text = picked.toLocal().toString();
                            }
                          }
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeePostPourInspectionReportController.drawingSketchNoRevisionController.value,
                        label: "Drawing/Sketch No. & Revision : ",
                        hintText: "Enter drawing number",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeePostPourInspectionReportController.gaDrawingController.value,
                        label: "GA Drawing : ",
                        hintText: "Enter GA drawing",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeePostPourInspectionReportController.rebarDrgsController.value,
                        label: "Rebar Drgs : ",
                        hintText: "Enter rebar drawing",
                      ),


                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeePostPourInspectionReportController.temporaryWorksController.value,
                        label: "Temporary Works : ",
                        hintText: "Enter Temporary Works",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeePostPourInspectionReportController.pourReferenceController.value,
                        label: "Pour Reference : ",
                        hintText: "Enter pour reference",
                      ),

                      SpaceHelperClass.v(35.h(context)),


                      CustomButtonHelper.customRoundedButton(
                        context: context,
                        text: "Next",
                        fontSize: 16,
                        textColor: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w600,
                        borderRadius: 8,
                        backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                        onPressed: () async {
                          if(employeePostPourInspectionReportController.projectNameController.value.text == "" ||
                              employeePostPourInspectionReportController.inspectionDataTimeController.value.text == "" ||
                              employeePostPourInspectionReportController.pourDateController.value.text == "" ||
                              employeePostPourInspectionReportController.temporaryWorksController.value.text == "" ||
                              employeePostPourInspectionReportController.pourReferenceController.value.text == "" ||
                              employeePostPourInspectionReportController.rebarDrgsController.value.text == "" ||
                              employeePostPourInspectionReportController.drawingSketchNoRevisionController.value.text == "" ||
                              employeePostPourInspectionReportController.gaDrawingController.value.text == "" ||
                              employeePostPourInspectionReportController.pourNoController.value.text == ""
                          ){
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else {
                            Get.to(()=>EmployeePostPourInspectionReportSecondPageView(projectId: projectId));
                          }
                        },
                      ),


                      SpaceHelperClass.v(35.h(context)),


                    ],
                  ),
                ),
              ),



            ],
          ),),
        ),
      ),
    );
  }
}
