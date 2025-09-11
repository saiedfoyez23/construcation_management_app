import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_check_sheet_view_controller.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/drainage_ducting_report/create_view/employee_drainage_ducting_report_first_page_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/drainage_ducting_report/get_view/employee_drainage_ducting_report_get_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/excavation_hardcore_stone_file_report/create_view/employee_excavation_hardcore_store_file_report_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/excavation_hardcore_stone_file_report/get_view/employee_excavation_hardcore_store_file_report_get_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/post_pour_inspection_report/create_view/employee_post_pour_inspection_report_first_page_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/post_pour_inspection_report/get_view/employee_post_pour_inspection_report_get_view.dart';
import 'package:construction_management_app/modules/employee_user/project_details/view/employee_project_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeCheckSheetView extends StatelessWidget {
  EmployeeCheckSheetView({super.key,required this.projectId});

  final String projectId;
  final List<String> calculators = [
    'Drainage/Ducting Report',
    'EXCAVATION / HARDCORE / STONE FIL Report',
    'Post Pour Inspection Report',
  ];

  @override
  Widget build(BuildContext context) {
    EmployeeCheckSheetViewController employeeCheckSheetViewController = Get.put(EmployeeCheckSheetViewController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=>employeeCheckSheetViewController.isLoading.value == true  ?
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
                height: 70,
                onBackPressed: () {
                  Get.off(()=>EmployeeProjectDetailsView(projectId: projectId),preventDuplicates: false);
                },
                title: "Check Sheet",
              ),


              SliverToBoxAdapter(
                child: Container(
                  height: 812.h(context),
                  width: 375.w(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r(context)),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                  margin: EdgeInsets.only(top: 16.tpm(context)),
                  child: ListView.builder(
                    itemCount: calculators.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          if(employeeCheckSheetViewController.isDuctingReports.value == true && index == 0) {
                            Get.off(()=>EmployeeDrainageDuctingReportGetView(projectId: projectId),preventDuplicates: false);
                          } else if(employeeCheckSheetViewController.isDuctingReports.value == false && index == 0) {
                            Get.off(()=>EmployeeDrainageDuctingReportFirstPageView(projectId: projectId),preventDuplicates: false);
                          } else if(employeeCheckSheetViewController.isExcavationReports.value == true && index == 1) {
                            Get.off(()=>EmployeeExcavationHardcoreStoreFileReportGetView(projectId: projectId),preventDuplicates: false);
                          } else if(employeeCheckSheetViewController.isExcavationReports.value == false && index == 1) {
                            Get.off(()=>EmployeeExcavationHardcoreStoreFileReportView(projectId: projectId),preventDuplicates: false);
                          } else if(employeeCheckSheetViewController.isPostPourInspectionReports.value == true && index == 2) {
                            Get.off(()=>EmployeePostPourInspectionReportGetView(projectId: projectId),preventDuplicates: false);
                          }  else if(employeeCheckSheetViewController.isPostPourInspectionReports.value == false && index == 2) {
                            Get.off(()=>EmployeePostPourInspectionReportFirstPageView(projectId: projectId),preventDuplicates: false);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.bpm(context)),
                          width: 375.w(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r(context)),
                            color: Color.fromRGBO(249, 250, 251, 1), // rgba(249, 250, 251, 1)
                          ),
                          padding: EdgeInsets.fromLTRB(
                            12.lpm(context),
                            9.tpm(context),
                            12.rpm(context),
                            9.bpm(context),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextHelperClass.headingText(
                                  context: context,
                                  text: calculators[index],
                                  fontSize: 22,
                                  textColor: Color.fromRGBO(35, 47, 48, 1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),


                              if(employeeCheckSheetViewController.isDuctingReports.value == true && index == 0) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.eye,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(employeeCheckSheetViewController.isDuctingReports.value == false && index == 0) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.file,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(employeeCheckSheetViewController.isExcavationReports.value == true && index == 1) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.eye,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(employeeCheckSheetViewController.isExcavationReports.value == false && index == 1) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.file,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(employeeCheckSheetViewController.isPostPourInspectionReports.value == true && index == 2) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.eye,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(employeeCheckSheetViewController.isPostPourInspectionReports.value == false && index == 2) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.file,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ]

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
