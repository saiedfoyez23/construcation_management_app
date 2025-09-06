import 'dart:convert';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/planning/controller/employee_new_planing_controller.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_planing_view.dart';
import 'package:construction_management_app/modules/employee_user/planning/widget/new_planing_task/employee_new_planing_task_details_widget.dart';
import 'package:construction_management_app/modules/employee_user/planning/widget/new_planing_task/employee_new_planing_task_section_widget.dart';
import 'package:construction_management_app/modules/employee_user/planning/widget/new_planing_task/employee_new_planing_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeNewPlaningView extends StatelessWidget {
  const EmployeeNewPlaningView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    EmployeeNewPlaningController employeeNewPlaningController = Get.put(EmployeeNewPlaningController(projectId: projectId));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: employeeNewPlaningController.isLoading.value == true  ?
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
                  Get.off(()=>EmployeePlaningView(projectId: projectId),preventDuplicates: false);
                },
                title: "Add New Planing",
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      EmployeeNewPlaningWidget.employeeNewPlaningProjectSelectionAndDescriptionBuilder(context: context, controller: employeeNewPlaningController),

                      SpaceHelperClass.v(24.h(context)),

                      EmployeeNewPlaningAddTaskSectionWidget().employeeNewPlaningAddTaskSectionBuilder(context: context, controller: employeeNewPlaningController),

                      SpaceHelperClass.v(24.h(context)),


                      ...employeeNewPlaningController.taskList.map((item) {
                        return EmployeeNewPlaningTaskDetailsWidget().employeeNewPlaningTaskDetailsBuilder(
                          context: context,
                          controller: employeeNewPlaningController,
                          item: item,
                        );
                      }),

                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: employeeNewPlaningController.isSubmit.value == true ?
                            CustomLoaderButton().customLoaderButton(
                              backgroundColor: Colors.transparent,
                              loaderColor: Color.fromRGBO(38, 50, 56, 1),
                              height: 50,
                              context: context,
                            ) :
                            CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Save",
                              fontSize: 16,
                              textColor: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                              onPressed: () async {
                                if(employeeNewPlaningController.getEmployeeProjectDetailsResponseModel.value.data == null) {
                                  kSnackBar(message: "Please select a project", bgColor: AppColors.red);
                                } else if(employeeNewPlaningController.taskController.value.text == ""){
                                  kSnackBar(message: "Please enter task name", bgColor: AppColors.red);
                                } else if(employeeNewPlaningController.dueTimeController.value.text == ""){
                                  kSnackBar(message: "Please select due time", bgColor: AppColors.red);
                                } else if(employeeNewPlaningController.dueDateController.value.text == ""){
                                  kSnackBar(message: "Please select due date", bgColor: AppColors.red);
                                } else if(employeeNewPlaningController.taskList.isEmpty == true) {
                                  kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                } else {
                                  employeeNewPlaningController.isSubmit.value = true;
                                  List<Map<String, dynamic>> tasksToJson(List<EmployeePlaningTask> tasks) {
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
                                    "name": employeeNewPlaningController.taskController.value.text,
                                    "project": employeeNewPlaningController.getEmployeeProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "due_date": employeeNewPlaningController.date.value.toString(),
                                    "due_time": employeeNewPlaningController.date.value.toString(),
                                    "tasks": tasksToJson(employeeNewPlaningController.taskList),
                                  };
                                  print(jsonEncode(payload));
                                  await employeeNewPlaningController.createPlanController(
                                    data: payload,
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
                                Get.off(()=>EmployeePlaningView(projectId: projectId),preventDuplicates: false);
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
          ),
        ),
      ))
    );
  }
}
