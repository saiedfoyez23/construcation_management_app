import 'dart:convert';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/controller/employee_site_diary_edit_controller.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/view/site_employee_diary_details_view.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/widget/edit_site_diary_widget/edit_employee_site_diary_add_task_section_widget.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/widget/edit_site_diary_widget/edit_employee_site_diary_delay_widget.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/widget/edit_site_diary_widget/edit_employee_site_diary_image_and_location_widget.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/widget/edit_site_diary_widget/edit_employee_site_diary_task_details_widget.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/widget/edit_site_diary_widget/edit_employee_site_diary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEmployeeSiteDiaryView extends StatelessWidget {
  EditEmployeeSiteDiaryView({super.key,required this.siteDiaryId,required this.projectId});

  final String siteDiaryId;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    EmployeeSiteDiaryEditController employeeSiteDiaryEditController = Get.put(EmployeeSiteDiaryEditController(projectId: projectId, siteDiaryId: siteDiaryId));
    return Scaffold(
      body:  SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=> employeeSiteDiaryEditController.isLoading.value == true  ?
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
                onBackPressed: () {
                  Get.off(()=>SiteEmployeeDiaryDetailsView(projectId: projectId,siteDiaryId: siteDiaryId,),preventDuplicates: false);
                },
                title: "Edit Site Diary",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      EditEmployeeSiteDiaryWidget.employeeProjectSelectionAndDescriptionBuilder(context: context, controller: employeeSiteDiaryEditController),


                      SpaceHelperClass.v(24.h(context)),




                      EditEmployeeSiteDiaryAddTaskSectionWidget().editEmployeeSiteDiaryAddTaskSectionBuilder(context: context,controller: employeeSiteDiaryEditController),

                      SpaceHelperClass.v(24.h(context)),

                      ...[
                        for (int i = 0; i < employeeSiteDiaryEditController.taskList.length; i++)
                          EditEmployeeSiteDiaryTaskDetailsWidget().editEmployeeSiteDiaryTaskDetailsBuilder(
                            context: context,
                            controller: employeeSiteDiaryEditController,
                            item: employeeSiteDiaryEditController.taskList[i],
                            index: i,
                            siteDiaryId: siteDiaryId
                          ),
                      ],


                      SpaceHelperClass.v(24.h(context)),


                      EditEmployeeSiteDiaryCommandWidget().editEmployeeSiteDiaryCommendWidget(context: context, controller: employeeSiteDiaryEditController),

                      SpaceHelperClass.v(24.h(context)),


                      EditEmployeeSiteDiaryImageAndLocationWidget().editEmployeeSiteDiaryImageAndLocationBuilder(context: context, controller: employeeSiteDiaryEditController),

                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: employeeSiteDiaryEditController.isSubmit.value == true ?
                            CustomLoaderButton().customLoaderButton(
                              backgroundColor: Colors.transparent,
                              loaderColor: Color.fromRGBO(38, 50, 56, 1),
                              height: 50,
                              context: context,
                            ) :
                            CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Save Log",
                              fontSize: 16,
                              textColor: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                              onPressed: () async {
                                if(employeeSiteDiaryEditController.nameController.value.text == ""){
                                  kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                } else if(employeeSiteDiaryEditController.descriptionController.value.text == "") {
                                  kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                } else if(employeeSiteDiaryEditController.dateTimeController.value.text == "") {
                                  kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                } else if(employeeSiteDiaryEditController.weatherConditionController.value.text == "") {
                                  kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                } else if(employeeSiteDiaryEditController.locationController.value.text == "") {
                                  kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                } else if(employeeSiteDiaryEditController.taskList.isEmpty == true) {
                                  kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                } else {
                                  employeeSiteDiaryEditController.isSubmit.value = true;

                                  List<Map<String, dynamic>> tasksToJson(List<EmployeeEditSiteDiaryTask> tasks) {
                                    return tasks.map((task) {
                                      return {
                                        "name": task.name,
                                        "workforces": task.workforce.map((wf) {
                                          return {
                                            "workforce": wf.typeId,
                                            "quantity": wf.quantity,
                                            "duration": "${wf.duration} hours",
                                          };
                                        }).toList(),
                                        "equipments": task.equipment.map((eq) {
                                          return {
                                            "equipment": eq.typeId,
                                            "quantity": eq.quantity,
                                            "duration": "${eq.duration} hours",
                                          };
                                        }).toList(),
                                      };
                                    }).toList();
                                  }

                                  Map<String,dynamic> payload = {
                                    "name": employeeSiteDiaryEditController.nameController.value.text,
                                    "project": employeeSiteDiaryEditController.getEmployeeProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "description": employeeSiteDiaryEditController.descriptionController.value.text,
                                    "date": employeeSiteDiaryEditController..dateTimeController.value.text,
                                    "weather_condition": employeeSiteDiaryEditController..weatherConditionController.value.text,
                                    "duration": employeeSiteDiaryEditController.delayController.value.text,
                                    "location": employeeSiteDiaryEditController..locationController.value.text,
                                  };
                                  print(jsonEncode(payload));
                                  //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                  await employeeSiteDiaryEditController.updateSiteDiaryController(
                                    payload: payload,
                                    image: employeeSiteDiaryEditController.selectedImage.value,
                                    projectId: projectId,
                                    siteDiaryId: siteDiaryId,
                                  );
                                }

                              },
                            ),
                          ),


                          SpaceHelperClass.h(12.w(context)),

                          Expanded(
                            child: CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Cancel",
                              fontSize: 16,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(234, 235, 235, 1),
                              borderWidth: 1,
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              onPressed: () {
                                Get.off(()=>SiteEmployeeDiaryDetailsView(projectId: projectId, siteDiaryId: siteDiaryId,),preventDuplicates: false);
                              },
                            ),
                          ),



                        ],
                      ),


                      SpaceHelperClass.v(35.h(context)),


                    ],
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
