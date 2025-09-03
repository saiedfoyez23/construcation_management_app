import 'dart:convert';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:construction_management_app/modules/employee_user/home/controller/employee_add_day_work_controller.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_add_day_work_widget/employee_add_day_work_widget.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_add_day_work_widget/employee_add_task_section_day_work_widget.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_add_day_work_widget/employee_image_and_location_day_work_widget.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_add_day_work_widget/employee_material_used_widget.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_add_day_work_widget/employee_task_details_day_work_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeAddDayWorkView extends StatelessWidget {
  EmployeeAddDayWorkView({super.key});

  final EmployeeAddDayWorkController employeeAddDayWorkController = Get.put(EmployeeAddDayWorkController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [

              CustomAppBarHelper.normalAppBar(
                context: context,
                onBackPressed: () {
                  Get.off(()=>EmployeeDashboardView(index: 0),preventDuplicates: false);
                },
                title: 'Add Day Works',
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: employeeAddDayWorkController.isLoading.value == true  ?
                  CustomLoaderButton().customLoaderButton(
                    backgroundColor: Colors.transparent,
                    loaderColor: Color.fromRGBO(38, 50, 56, 1),
                    height: 812,
                    context: context,
                  ) :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperClass.v(24.h(context)),


                      EmployeeAddDayWorkWidget.employeeProjectSelectionAndDescriptionDayWorkBuilder(
                        context: context,
                        controller: employeeAddDayWorkController,
                      ),

                      SpaceHelperClass.v(24.h(context)),

                      EmployeeAddTaskSectionWidgetDayWork().employeeAddTaskSectionDayWorkBuilder(
                        context: context,
                        controller: employeeAddDayWorkController,
                      ),

                      SpaceHelperClass.v(24.h(context)),

                      ...employeeAddDayWorkController.taskList.map((item) {
                        return EmployeeTaskDetailsDayWorkWidget().employeeTaskDetailsDayWorkBuilder(
                          context: context,
                          controller: employeeAddDayWorkController,
                          item: item,
                        );
                      }),


                      EmployeeMaterialUsedWidget().employeeMaterialsUsedSection(
                        context: context,
                        controller: employeeAddDayWorkController,
                      ),


                      SpaceHelperClass.v(24.h(context)),


                      EmployeeImageAndLocationDayWorkWidget().employeeImageAndLocationDayWorkBuilder(
                        context: context,
                        controller: employeeAddDayWorkController,
                      ),

                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: employeeAddDayWorkController.isSubmit.value == true ?
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
                                if(employeeAddDayWorkController.getEmployeeProjectDetailsResponseModel.value.data == null) {
                                  kSnackBar(message: "Please select a project", bgColor: AppColors.red);
                                } else if(employeeAddDayWorkController.nameController.value.text == ""){
                                  kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                } else if(employeeAddDayWorkController.descriptionController.value.text == "") {
                                  kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                } else if(employeeAddDayWorkController.dateTimeController.value.text == "") {
                                  kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                } else if(employeeAddDayWorkController.weatherConditionController.value.text == "") {
                                  kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                } else if(employeeAddDayWorkController.locationController.value.text == "") {
                                  kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                } else if(employeeAddDayWorkController.taskList.isEmpty == true) {
                                  kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                } else if(employeeAddDayWorkController.selectedImage.value.path == "") {
                                  kSnackBar(message: "Please select a image", bgColor: AppColors.red);
                                } else {
                                  employeeAddDayWorkController.isSubmit.value = true;
                                  List<Map<String, dynamic>> tasksToJson(List<EmployeeDayWorkTask> tasks) {
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
                                    "name": employeeAddDayWorkController.nameController.value.text,
                                    "project": employeeAddDayWorkController.getEmployeeProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "description": employeeAddDayWorkController.descriptionController.value.text,
                                    "date": employeeAddDayWorkController.dateTimeController.value.text,
                                    "weather_condition": employeeAddDayWorkController.weatherConditionController.value.text,
                                    "duration": "8 hours",
                                    "tasks": tasksToJson(employeeAddDayWorkController.taskList),
                                    "location": employeeAddDayWorkController.locationController.value.text,
                                    "materials": employeeAddDayWorkController.metrialUsedController.value.text,
                                  };
                                  print(jsonEncode(payload));
                                  //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                  await employeeAddDayWorkController.createDayWorksController(
                                    payload: payload,
                                    image: employeeAddDayWorkController.selectedImage.value,
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
                                Get.off(()=>EmployeeDashboardView(index: 0),preventDuplicates: false);
                              },
                            ),
                          ),



                        ],
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
