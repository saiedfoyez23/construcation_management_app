import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/widget/post_pour_Inspection_report_widget.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_edit_post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/post_pour_inspection_report/edit_view/employee_edit_post_pour_inspection_report_second_page_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/post_pour_inspection_report/get_view/employee_post_pour_inspection_report_get_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeEditPostPourInspectionReportFirstPageView extends StatelessWidget {
  EmployeeEditPostPourInspectionReportFirstPageView({super.key,required this.projectId});
  final String projectId;


  @override
  Widget build(BuildContext context) {
    EmployeeEditPostPourInspectionReportController employeeEditPostPourInspectionReportController = Get.put(EmployeeEditPostPourInspectionReportController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=> employeeEditPostPourInspectionReportController.isLoading.value == true  ?
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
                  Get.delete<EmployeeEditPostPourInspectionReportController>(force: true);
                  Get.off(()=>EmployeePostPourInspectionReportGetView(projectId: projectId),preventDuplicates: false);
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
                        controller: employeeEditPostPourInspectionReportController.projectNameController.value,
                        readOnly: true,
                        label: "Project : ",
                        hintText: "Enter project name",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeEditPostPourInspectionReportController.pourNoController.value,
                        label: "Pour No : ",
                        hintText: "Enter pour number",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        readOnly: true,
                        controller: employeeEditPostPourInspectionReportController.pourDateController.value,
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
                            employeeEditPostPourInspectionReportController.pourDateController.value.text = picked.toLocal().toString();
                          }
                        }
                      ),


                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                          context: context,
                          readOnly: true,
                          controller: employeeEditPostPourInspectionReportController.inspectionDataTimeController.value,
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
                              employeeEditPostPourInspectionReportController.inspectionDataTimeController.value.text = picked.toLocal().toString();
                            }
                          }
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeEditPostPourInspectionReportController.drawingSketchNoRevisionController.value,
                        label: "Drawing/Sketch No. & Revision : ",
                        hintText: "Enter drawing number",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeEditPostPourInspectionReportController.gaDrawingController.value,
                        label: "GA Drawing : ",
                        hintText: "Enter GA drawing",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeEditPostPourInspectionReportController.rebarDrgsController.value,
                        label: "Rebar Drgs : ",
                        hintText: "Enter rebar drawing",
                      ),


                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeEditPostPourInspectionReportController.temporaryWorksController.value,
                        label: "Temporary Works : ",
                        hintText: "Enter Temporary Works",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeEditPostPourInspectionReportController.pourReferenceController.value,
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
                          if(employeeEditPostPourInspectionReportController.projectNameController.value.text == "" ||
                              employeeEditPostPourInspectionReportController.inspectionDataTimeController.value.text == "" ||
                              employeeEditPostPourInspectionReportController.pourDateController.value.text == "" ||
                              employeeEditPostPourInspectionReportController.temporaryWorksController.value.text == "" ||
                              employeeEditPostPourInspectionReportController.pourReferenceController.value.text == "" ||
                              employeeEditPostPourInspectionReportController.rebarDrgsController.value.text == "" ||
                              employeeEditPostPourInspectionReportController.drawingSketchNoRevisionController.value.text == "" ||
                              employeeEditPostPourInspectionReportController.gaDrawingController.value.text == "" ||
                              employeeEditPostPourInspectionReportController.pourNoController.value.text == ""
                          ){
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else {
                            Get.to(()=>EmployeeEditPostPourInspectionReportSecondPageView(projectId: projectId));
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
