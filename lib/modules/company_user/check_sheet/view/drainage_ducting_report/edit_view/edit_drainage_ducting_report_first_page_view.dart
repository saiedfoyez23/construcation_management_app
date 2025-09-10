import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/edit_drainage_ducting_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/check_sheet_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/drainage_ducting_report/create_view/drainage_ducting_report_second_page_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/drainage_ducting_report/edit_view/edit_drainage_ducting_report_second_page_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/drainage_ducting_report/get_view/drainage_ducting_report_get_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/widget/post_pour_Inspection_report_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDrainageDuctingReportFirstPageView extends StatelessWidget {
  EditDrainageDuctingReportFirstPageView({super.key,required this.projectId});

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
          child: editDrainageDuctingReportController.isLoading.value == true ?
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
                  Get.off(()=>DrainageDuctingReportGetView(projectId: projectId),preventDuplicates: false);
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
                        controller: editDrainageDuctingReportController.contractController.value,
                        label: "Contract : ",
                        hintText: "Enter contract number",
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        readOnly: true,
                        controller: editDrainageDuctingReportController.dateController.value,
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
                            editDrainageDuctingReportController.dateController.value.text = picked.toLocal().toString();
                          }
                        },
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller:editDrainageDuctingReportController.drawingReferenceInclRevisionController.value,
                        label: "Drawing Reference Incl Revision : ",
                        hintText: "Enter drawing reference",
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: editDrainageDuctingReportController.locationController.value,
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
                              value: editDrainageDuctingReportController.selectCompletionStatus.value == "" ? null : editDrainageDuctingReportController.selectCompletionStatus.value,
                              items: ['in-process','completed','not-completed'],
                              onChanged: (value) async {
                                editDrainageDuctingReportController.selectCompletionStatus.value = value!;
                              },
                              hintText: "Select Completion Status",
                            ),


                          ],
                        ),
                      ),



                      SpaceHelperClass.v(12.h(context)),


                      PostPourInspectionReportWidget().postPourInspectionReportWidget(
                        context: context,
                        controller: editDrainageDuctingReportController.subContractorController.value,
                        label: "Sub-Contractor : ",
                        hintText: "Enter sub-contractor",
                      ),

                      SpaceHelperClass.v(35.h(context)),


                      CustomButtonHelper.customRoundedButton(
                        context: context,
                        text: "Save",
                        fontSize: 16,
                        textColor: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w600,
                        borderRadius: 8,
                        backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                        onPressed: () async {
                          if(editDrainageDuctingReportController.contractController.value.text == "" ||
                              editDrainageDuctingReportController.dateController.value.text == "" ||
                              editDrainageDuctingReportController.drawingReferenceInclRevisionController.value.text == "" ||
                              editDrainageDuctingReportController.locationController.value.text == "" ||
                              editDrainageDuctingReportController.selectCompletionStatus.value == "" ||
                              editDrainageDuctingReportController.subContractorController.value.text == ""
                          ) {
                            kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                          } else {
                            Get.to(()=>EditDrainageDuctingReportSecondPageView(projectId: projectId));
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
