import 'package:construction_management_app/modules/company_user/check_sheet/controller/check_sheet_view_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/excavation_hardcore_stone_file_report/create_view/excavation_hardcore_store_file_report_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/create_view/post_pour_inspection_report_first_page_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/get_view/post_pour_inspection_report_get_view.dart';
import 'package:construction_management_app/modules/company_user/project_details/view/project_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/common.dart';

class CheckSheetView extends StatelessWidget {
  CheckSheetView({super.key,required this.projectId});

  final String projectId;
  final List<String> calculators = [
    'Drainage/Ducting Report',
    'EXCAVATION / HARDCORE / STONE FIL Report',
    'Post Pour Inspection Report',
  ];

  @override
  Widget build(BuildContext context) {
    CheckSheetViewController checkSheetViewController = Get.put(CheckSheetViewController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=>checkSheetViewController.isLoading.value == true  ?
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
                  Get.off(()=>ProjectDetailsView(projectId: projectId),preventDuplicates: false);
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
                          if(checkSheetViewController.isDuctingReports.value == true && index == 0) {
                            //Get.off(()=>ConcreteVolumeCalculatorView(projectId: projectId,),preventDuplicates: false);
                          } else if(checkSheetViewController.isDuctingReports.value == false && index == 0) {

                          } else if(checkSheetViewController.isExcavationReports.value == true && index == 1) {
                            //Get.off(()=>StoneCalculatorView(projectId: projectId),preventDuplicates: false);
                          } else if(checkSheetViewController.isExcavationReports.value == false && index == 1) {
                            Get.off(()=>ExcavationHardcoreStoreFileReportView(projectId: projectId),preventDuplicates: false);
                          } else if(checkSheetViewController.isPostPourInspectionReports.value == true && index == 2) {
                            Get.off(()=>PostPourInspectionReportGetView(projectId: projectId),preventDuplicates: false);
                          }  else if(checkSheetViewController.isPostPourInspectionReports.value == false && index == 2) {
                            Get.off(()=>PostPourInspectionReportFirstPageView(projectId: projectId),preventDuplicates: false);
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


                              if(checkSheetViewController.isDuctingReports.value == true && index == 0) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.eye,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(checkSheetViewController.isDuctingReports.value == false && index == 0) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.file,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(checkSheetViewController.isExcavationReports.value == true && index == 1) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.eye,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(checkSheetViewController.isExcavationReports.value == false && index == 1) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.file,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(checkSheetViewController.isPostPourInspectionReports.value == true && index == 2) ...[
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24,
                                  width: 24,
                                  imagePath: AppImages.eye,
                                  imageFit: BoxFit.cover,
                                  fit: BoxFit.contain,
                                ),
                              ] else if(checkSheetViewController.isPostPourInspectionReports.value == false && index == 2) ...[
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
