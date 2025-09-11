
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/widget/post_pour_Inspection_report_widget.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/drainage_ducting_report/create_view/employee_drainage_ducting_report_second_page_view.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/view/employee_check_sheet_view.dart';
import 'package:get/get.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/controller/employee_drainage_ducting_report_controller.dart';
import 'package:flutter/material.dart';

class EmployeeDrainageDuctingReportFirstPageView extends StatelessWidget {
  EmployeeDrainageDuctingReportFirstPageView({super.key,required this.projectId});

  final String projectId;
  final EmployeeDrainageDuctingReportController employeeDrainageDuctingReportController = Get.put(EmployeeDrainageDuctingReportController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [


              CustomAppBarHelper.normalAppBar(
                context: context,
                height: 80,
                onBackPressed: () {
                  Get.off(()=>EmployeeCheckSheetView(projectId: projectId),preventDuplicates: false);
                },
                title: "Drainage/Ducting Report",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      TextHelperClass.headingText(
                        context: context,
                        text: " General Information Section",
                        fontSize: 16,
                        textColor: AppColors.black255,
                        fontWeight: FontWeight.w700,
                      ),

                      SpaceHelperClass.v(24.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeDrainageDuctingReportController.contractController.value,
                        label: "Contract : ",
                        hintText: "Enter contract number",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        readOnly: true,
                        controller: employeeDrainageDuctingReportController.dateController.value,
                        label: "Date : ",
                        hintText: "Enter date",
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
                            employeeDrainageDuctingReportController.dateController.value.text = picked.toLocal().toString();
                          }
                        },
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeDrainageDuctingReportController.drawingReferenceInclRevisionController.value,
                        label: "Drawing Reference Incl Revision : ",
                        hintText: "Enter drawing reference",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeDrainageDuctingReportController.locationController.value,
                        label: "Location of work : ",
                        hintText: "Enter work  location",
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
                              text: "Completion Status : ",
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
                              value: employeeDrainageDuctingReportController.selectCompletionStatus.value == "" ? null : employeeDrainageDuctingReportController.selectCompletionStatus.value,
                              items: ['in-progress','completed','not-completed'],
                              onChanged: (value) async {
                                employeeDrainageDuctingReportController.selectCompletionStatus.value = value!;
                              },
                              hintText: "Select Completion Status",
                            ),


                          ],
                        ),
                      ),



                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: employeeDrainageDuctingReportController.subContractorController.value,
                        label: "Sub-Contractor : ",
                        hintText: "Enter sub-contractor",
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
                          if(employeeDrainageDuctingReportController.contractController.value.text == "" ||
                              employeeDrainageDuctingReportController.dateController.value.text == "" ||
                              employeeDrainageDuctingReportController.drawingReferenceInclRevisionController.value.text == "" ||
                              employeeDrainageDuctingReportController.locationController.value.text == "" ||
                              employeeDrainageDuctingReportController.selectCompletionStatus.value == "" ||
                              employeeDrainageDuctingReportController.subContractorController.value.text == ""
                          ) {
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else {
                            Get.to(()=>EmployeeDrainageDuctingReportSecondPageView(projectId: projectId));
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
        ),
      ),
    );
  }
}
