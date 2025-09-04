import 'dart:convert';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/day_work/controller/new_employee_day_work_controller.dart';
import 'package:construction_management_app/modules/employee_user/day_work/view/day_employee_work_view.dart';
import 'package:construction_management_app/modules/employee_user/day_work/widget/employee_add_day_work_widget/employee_image_and_location_day_work_widget.dart';
import 'package:construction_management_app/modules/employee_user/day_work/widget/employee_add_day_work_widget/employee_new_add_day_work_widget.dart';
import 'package:construction_management_app/modules/employee_user/day_work/widget/employee_add_day_work_widget/employee_new_day_work_add_task_section_widget.dart';
import 'package:construction_management_app/modules/employee_user/day_work/widget/employee_add_day_work_widget/employee_new_day_work_material_used_widget.dart';
import 'package:construction_management_app/modules/employee_user/day_work/widget/employee_add_day_work_widget/employee_new_day_work_task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NewEmployeeDayWorkView extends StatelessWidget {
  NewEmployeeDayWorkView({super.key,required this.projectId});

  final String projectId;
  @override
  Widget build(BuildContext context) {
    NewEmployeeDayWorkController newEmployeeDayWorkController = Get.put(NewEmployeeDayWorkController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: newEmployeeDayWorkController.isLoading.value == true  ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :CustomScrollView(
            slivers: [



              CustomAppBarHelper.normalAppBar(
                context: context,
                onBackPressed: () {
                  Get.off(()=>DayEmployeeWorkView(projectId: projectId),preventDuplicates: false);
                },
                title: "New Day Work",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperClass.v(24.h(context)),


                      EmployeeNewAddDayWorkWidget.employeeNewDayWorkProjectSelectionAndDescriptionBuilder(
                        context: context,
                        controller: newEmployeeDayWorkController,
                      ),

                      SpaceHelperClass.v(24.h(context)),

                      EmployeeNewDayWorkAddTaskSectionWidget().employeeNewDayWorkAddTaskSectionBuilder(context: context, controller: newEmployeeDayWorkController,),

                      SpaceHelperClass.v(24.h(context)),

                      ...newEmployeeDayWorkController.taskList.map((item) {
                        return EmployeeNewDayWorkTaskDetailsWidget().employeeNewDayWorkTaskDetailsBuilder(
                          context: context,
                          controller: newEmployeeDayWorkController,
                          item: item,
                        );
                      }),


                      EmployeeNewDayWorkMaterialUsedWidget().employeeNewDayWorkMaterialsUsedSection(
                        context: context,
                        controller: newEmployeeDayWorkController,
                      ),



                      SpaceHelperClass.v(24.h(context)),


                      EmployeeNewDayWorkImageAndLocationWidget().employeeNewDayWorkImageAndLocationBuilder(context: context, controller: newEmployeeDayWorkController),

                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: newEmployeeDayWorkController.isSubmit.value == true ?
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
                                if(newEmployeeDayWorkController.getEmployeeProjectDetailsResponseModel.value.data == null) {
                                  kSnackBar(message: "Please select a project", bgColor: AppColors.red);
                                } else if(newEmployeeDayWorkController.nameController.value.text == ""){
                                  kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                } else if(newEmployeeDayWorkController.descriptionController.value.text == "") {
                                  kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                } else if(newEmployeeDayWorkController.dateTimeController.value.text == "") {
                                  kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                } else if(newEmployeeDayWorkController.weatherConditionController.value.text == "") {
                                  kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                } else if(newEmployeeDayWorkController.locationController.value.text == "") {
                                  kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                } else if(newEmployeeDayWorkController.taskList.isEmpty == true) {
                                  kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                } else if(newEmployeeDayWorkController.selectedImage.value.path == "") {
                                  kSnackBar(message: "Please select a image", bgColor: AppColors.red);
                                } else {
                                  newEmployeeDayWorkController.isSubmit.value = true;
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
                                    "name": newEmployeeDayWorkController.nameController.value.text,
                                    "project": newEmployeeDayWorkController.getEmployeeProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "description": newEmployeeDayWorkController.descriptionController.value.text,
                                    "date": newEmployeeDayWorkController.dateTimeController.value.text,
                                    "weather_condition": newEmployeeDayWorkController.weatherConditionController.value.text,
                                    "duration": "8 hours",
                                    "tasks": tasksToJson(newEmployeeDayWorkController.taskList),
                                    "location": newEmployeeDayWorkController.locationController.value.text,
                                    "materials": newEmployeeDayWorkController.metrialUsedController.value.text,
                                  };
                                  print(jsonEncode(payload));
                                  //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                  await newEmployeeDayWorkController.createDayWorksController(
                                    payload: payload,
                                    image: newEmployeeDayWorkController.selectedImage.value,
                                    projectId: projectId,
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
                                Get.off(()=>DayEmployeeWorkView(projectId: projectId),preventDuplicates: false);
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
